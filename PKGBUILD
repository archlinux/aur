# Maintainer: James Crompton <DonJaime@freenet.de>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_name=ardour
pkgname=ardour6
pkgver=6.9
pkgrel=1
pkgdesc="Ardour version 6.9, for legacy sessions that more recent versions corrupt."
arch=(x86_64)
url="https://ardour.org/"
license=(GPL2)
groups=(pro-audio)
depends=(cairo gcc-libs glibc glibmm gtkmm libx11 libxml2
soundtouch taglib)
makedepends=(atkmm aubio boost cairomm cppunit curl dbus doxygen fftw flac
fluidsynth fontconfig freetype2 gdk-pixbuf2 git glib2 graphviz gtk2 hidapi
itstool jack libarchive liblo liblrdf libltc libogg libpulse libsamplerate
libsndfile libusb libwebsockets lilv lv2 pango pangomm readline rubberband serd
sord sratom suil vamp-plugin-sdk waf)
optdepends=(
  'harvid: for video timeline and MP3 export'
  'new-session-manager: for session management'
  'xjadeo: for video monitoring'
)
provides=(ladspa-host lv2-host vst-host vst3-host)
options=(debug)
source=("${_name}::git+https://github.com/${_name^}/${_name}.git#tag=$pkgver"
        "${_name}-6.2-vendor_qm-dsp.patch")
sha512sums=('SKIP'
            '2d69e23948ed8679b7fd872c50d2ea44299330c6ed356158689a1f6befb3841f2d9b8a889d4891436c65b57d90601156bc916ad0f0f385c91b22131a766467a8')
b2sums=('SKIP'
        'b28aebf0a5791795d94e29780c064faa1b858da6b89f1ff32edb2aea9de138f2e91b01fcbd16d278e47fd1c7bf892cf7838fea946b38d1196d758873f62742aa')

prepare() {
  cd "${_name}"

  # fix mime package installation location: https://bugs.archlinux.org/task/72867
  git cherry-pick -n b95078ae464f0d132d2d0a9d5727a72bd1ee88d7
  # using vendored version of qm-dsp because qm-dsp >= 1.8.0 is not compatible
  patch -Np1 -i "../${_name}-6.2-vendor_qm-dsp.patch"

  # unsetting gtk2 rc (FS#54389)
  sed -e '8iexport GTK2_RC_FILES=/dev/null' -i gtk2_ardour/ardour.sh.in

  # Fixes to use system waf:
  # making sure, that subdirectories can be picked up with local includes
  touch __init__.py
  # making ancient 'misc.py' include available to system installed waf
  sed -e "s/('misc')/('misc', tooldir='tools')/" \
      -i {gtk2_ardour,headless,luasession,session_utils,libs/fst}/wscript
  # make custom 'autowaf' include compatible with system installed waf
  find . -type f \
         -iname "*wscript*" \
         -exec sed -e 's/from waflib.extras import autowaf/from tools import autowaf/g' \
                   -e 's/import waflib.extras.autowaf/from tools import autowaf/g' \
                   -i {} \;
}

build() {
  cd "${_name}"
  export LINKFLAGS="$LDFLAGS"
  waf configure --prefix=/usr \
                --configdir=/etc \
                --cxx11 \
                --freedesktop \
                --lxvst \
                --nls \
                --no-phone-home \
                --optimize \
                --ptformat \
                --use-external-libs \
                --with-backends="alsa,dummy,jack,pulseaudio"
  waf build -v
}

package() {
  depends+=(libasound.so libatkmm-1.6.so libaubio.so libarchive.so
  libcairomm-1.0.so libcurl.so libdbus-1.so libfftw3f.so libfftw3f_threads.so
  libfluidsynth.so libfontconfig.so libgdk_pixbuf-2.0.so
  libgdk-x11-2.0.so libglib-2.0.so libgobject-2.0.so
  libgtk-x11-2.0.so libjack.so liblo.so liblilv-0.so liblrdf.so libltc.so
  libpango-1.0.so libpangocairo-1.0.so libpangoft2-1.0.so
  libpangomm-1.4.so libpulse.so libreadline.so librubberband.so
  libsamplerate.so libsndfile.so
  libsuil-0.so libusb-1.0.so libvamp-hostsdk.so libvamp-sdk.so
  libwebsockets.so)

  cd "${_name}"
  waf i18n --destdir="${pkgdir}"
  waf install --destdir="${pkgdir}"
  # man pages
  install -vDm 644 "${_name}.1"* -t "${pkgdir}/usr/share/man/man1/"

  rename $_name $pkgname "${pkgdir}"/usr/share/{man,mime}/*/$_name*
  sed -i "s/Name=${_name^}/Name=${pkgname^}/" "${pkgdir}"/usr/share/applications/*
}
# vim:set ts=2 sw=2 et:
