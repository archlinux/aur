# Maintainer: Gimmeapill <gimmeapill at gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: SpepS <dreamspepser at yahoo.it>
# Contributor: Bernardo Barros <bernardobarros at gmail.com>
# Contributor: Uli Armbruster <uli_armbruster at web.de>
# Contributor: Christopher Arndt <aur at chrisarndt.de>

pkgname=ardour-git
pkgver=6.3.r55.ga4b1277f85
pkgrel=1
pkgdesc="A multichannel hard disk recorder and digital audio workstation (git version)"
arch=('x86_64')
url="https://ardour.org/"
license=('GPL2')
groups=('pro-audio')
depends=('atkmm' 'cairo' 'cairomm' 'fontconfig' 'gdk-pixbuf2' 'gcc-libs'
         'glibc' 'glibmm' 'gtkmm' 'libx11' 'libxml2' 'pangomm' 'soundtouch'
         'taglib')
makedepends=('atk' 'aubio' 'boost' 'cppunit' 'curl' 'dbus' 'doxygen' 'fftw'
             'flac' 'fluidsynth' 'freetype2' 'git' 'glib2' 'graphviz' 'gtk2'
             'harfbuzz' 'itstool' 'libarchive' 'liblo' 'liblrdf' 'libltc'
             'libogg' 'libpulse' 'libsamplerate' 'libsndfile' 'libusb'
             'libwebsockets' 'lilv' 'lv2' 'pango' 'readline' 'rubberband'
             'serd' 'sord' 'sratom' 'suil' 'vamp-plugin-sdk')
optdepends=('harvid: video timeline'
            'libwebsockets: WebSockets control support'
            'non-session-manager: for session management'
            'xjadeo: video monitoring')
provides=('ardour')
conflicts=('ardour')
source=("${pkgname%-*}::git+https://github.com/Ardour/ardour.git"
        'ardour-6.2-vendor_qm-dsp.patch')
sha256sums=('SKIP'
            'e937d80e05fd2955b537b617793c06df23804406b5af7283821ad654fa646635')

pkgver() {
  cd "${srcdir}/${pkgname%-*}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-*}"

  # using vendored version of qm-dsp because qm-dsp >= 1.8.0 is not compatible
  patch -Np1 -i "${srcdir}/ardour-6.2-vendor_qm-dsp.patch"

  #~# Set icon for .adour files
  #~patch -Np1 -i "${srcdir}/ardour-mime-icon.patch"

  # https://bugs.archlinux.org/task/54389
  sed -e '8iexport GTK2_RC_FILES=/dev/null' -i gtk2_ardour/ardour.sh.in
}

build() {
  cd "${srcdir}/${pkgname%-*}"

  python waf configure  --prefix=/usr \
                        --configdir=/etc \
                        --cxx11 \
                        --freedesktop \
                        --libjack=weak \
                        --nls \
                        --no-phone-home \
                        --optimize \
                        --ptformat \
                        --use-external-libs \
                        --with-backends=alsa,dummy,jack,pulseaudio

  python waf build $MAKEFLAGS
}

package() {
  depends+=('libFLAC.so' 'libasound.so' 'libatk-1.0.so' 'libaubio.so'
            'libarchive.so' 'libcurl.so' 'libdbus-1.so' 'libfftw3f.so'
            'libfftw3f_threads.so' 'libfluidsynth.so' 'libfreetype.so'
            'libgdk-x11-2.0.so' 'libgio-2.0.so' 'libglib-2.0.so'
            'libgobject-2.0.so' 'libgtk-x11-2.0.so' 'libharfbuzz.so'
            'liblo.so' 'liblilv-0.so' 'liblrdf.so' 'libltc.so' 'libogg.so'
            'libpango-1.0.so' 'libpangocairo-1.0.so' 'libpangoft2-1.0.so'
            'libpulse.so' 'libreadline.so' 'librubberband.so'
            'libsamplerate.so' 'libserd-0.so' 'libsndfile.so' 'libsord-0.so'
            'libsratom-0.so' 'libsuil-0.so' 'libusb-1.0.so'
            'libvamp-hostsdk.so' 'libvamp-sdk.so')

  cd "${srcdir}/${pkgname%-*}"

  python waf --destdir="${pkgdir}" i18n
  python waf --destdir="${pkgdir}" install

  # XDG integration
  # File types
  install -vDm 644 "build/gtk2_${pkgname%-*}/${pkgname%-*}.xml" \
    -t "${pkgdir}/usr/share/mime/packages/"
  # Install freedesktop.org compatible application starter desktop file
  install -vDm644 "build/gtk2_${pkgname%-*}/${pkgname%-*}${pkgver%%.*}.desktop" \
    "${pkgdir}/usr/share/applications/ardour.desktop"
  # Icons
  for size in 16 22 32 48; do
    install -vdm 755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes"
    ln -sf "/usr/share/ardour6/icons/application-x-ardour_${size}px.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-ardour.png"
  done
  for size in 16 22 32 48 256 512; do
    install -vdm 755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    ln -sf "/usr/share/ardour6/resources/Ardour-icon_${size}px.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname%-*}${pkgver%%.*}.png"
  done
  # man pages
  install -vDm 644 "${pkgname%-*}.1"* -t "${pkgdir}/usr/share/man/man1/"
}
