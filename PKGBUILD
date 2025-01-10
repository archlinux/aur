# Maintainer: Christopher Arndt <aur at chrisarndt.de>
# Contributor: Gimmeapill <gimmeapill at gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: SpepS <dreamspepser at yahoo.it>
# Contributor: Bernardo Barros <bernardobarros at gmail.com>
# Contributor: Uli Armbruster <uli_armbruster at web.de>
# Contributor: Albert Gräf <aggraef -at- gmail -dot- com>

_pkgname=ardour
pkgname=$_pkgname-git
pkgver=9.0.pre0.r675.ge273ec06bb
pkgrel=1
pkgdesc='Professional-grade digital audio workstation (git version)'
arch=(x86_64)
url='https://ardour.org/'
license=(
  CC0-1.0
  GPL-2.0-or-later
  GPL-3.0-or-later
  MIT
)
groups=(pro-audio)
depends=(
  cairo
  gcc-libs
  glibc
  hicolor-icon-theme
  libsigc++
  libx11
  libxext
  libxinerama
  libxrandr
  sh
  taglib
)
makedepends=(
  aubio
  boost
  cairomm
  cppunit
  curl
  dbus
  doxygen
  fftw
  flac
  fluidsynth
  fontconfig
  freetype2
  git
  glib2
  glibmm
  graphviz
  hidapi
  itstool
  jack
  libarchive
  liblo
  liblrdf
  libltc
  libogg
  libpng
  libpulse
  libsamplerate
  libsndfile
  libusb
  libwebsockets
  libxml2
  lilv
  lv2
  pango
  pangomm
  python
  readline
  rubberband
  serd
  sord
  sratom
  unzip
  vamp-plugin-sdk
)
optdepends=(
  'harvid: video timeline'
  'non-session-manager: for session management'
  'xjadeo: video monitoring'
)
provides=(
  $_pkgname
  ladspa-host
  lv2-host
  vamp-host
  vst-host
  vst3-host
)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/Ardour/ardour.git"
        "$_pkgname-midi-${pkgver%%.*}.zip::http://stuff.ardour.org/loops/ArdourBundledMedia.zip"
        'ardour-7.x-vendor_qm-dsp.patch')
noextract=($_pkgname-midi-${pkgver%%.*}.zip)
sha256sums=('SKIP'
            'a00de00671cdc329b2ca35c2a5c4150af3d6588147f9dca2e3dea752aa2e234c'
            '6393d52d2c084e03ba24f657352a76a58d5e9f530cfeecb87babf8990c902cbc')

pkgver() {
  cd $_pkgname
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname

  # using vendored version of qm-dsp because qm-dsp >= 1.8.0 is not compatible
  patch -Np1 -r - -i "$srcdir"/ardour-7.x-vendor_qm-dsp.patch

  # https://bugs.archlinux.org/task/54389
  sed -e '8iexport GTK2_RC_FILES=/dev/null' -i gtk2_ardour/ardour.sh.in
}

build() {
  cd $_pkgname

  export LINKFLAGS="$LDFLAGS"
  python waf configure \
    --prefix=/usr \
    --configdir=/etc \
    --cxx17 \
    --freedesktop \
    --no-phone-home \
    --optimize \
    --ptformat \
    --use-external-libs \
    --with-backends=alsa,dummy,jack,pulseaudio
  python waf build $MAKEFLAGS
}

package() {
  depends+=(
    alsa-lib libasound.so
    aubio libaubio.so
    cairomm libcairomm-1.0.so
    curl libcurl.so
    dbus libdbus-1.so
    fftw libfftw3f.so libfftw3f_threads.so
    fluidsynth libfluidsynth.so
    fontconfig libfontconfig.so
    glib2 libglib-2.0.so libgobject-2.0.so
    glibmm libglibmm-2.4.so
    jack libjack.so
    libarchive libarchive.so
    liblo liblo.so
    libpulse libpulse.so
    liblrdf liblrdf.so
    libltc libltc.so
    libpng libpng16.so
    libsamplerate libsamplerate.so
    libsndfile libsndfile.so
    libusb libusb-1.0.so
    libwebsockets libwebsockets.so
    libxml2 libxml2.so
    lilv liblilv-0.so
    pango libpango-1.0.so libpangocairo-1.0.so libpangoft2-1.0.so
    pangomm libpangomm-1.4.so
    readline libreadline.so
    rubberband librubberband.so
    vamp-plugin-sdk libvamp-hostsdk.so libvamp-sdk.so
  )

  cd $_pkgname

  python waf --destdir="$pkgdir" i18n
  python waf --destdir="$pkgdir" install

  # Install XDG integration
  # File types
  install -vDm 644 "build/gtk2_$_pkgname/$_pkgname.xml" \
    -t "$pkgdir"/usr/share/mime/packages/

  # application starter desktop file
  install -vDm644 "build/gtk2_$_pkgname/$_pkgname${pkgver%%.*}.desktop" \
    "$pkgdir"/usr/share/applications/ardour.desktop

  # Icons
  for size in 16 22 32 48; do
    install -vdm 755 "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/mimetypes
    ln -sf "/usr/share/ardour${pkgver%%.*}/icons/application-x-ardour_${size}px.png" \
      "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-ardour.png
  done
  for size in 16 22 32 48 256 512; do
    install -vdm 755 "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps
    ln -sf "/usr/share/ardour${pkgver%%.*}/resources/Ardour-icon_${size}px.png" \
      "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname${pkgver%%.*}.png
  done

  # Man pages
  install -vDm 644 "$_pkgname.1"* -t "$pkgdir"/usr/share/man/man1/

  # from the official package at https://archlinux.org/packages/extra/x86_64/ardour/
  # installation of MIDI files is a bit of a horrorshow,
  # as upstream is not flexible about tarball naming, etc.
  install -vdm 755 "$pkgdir"/usr/share/$_pkgname${pkgver%%.*}/media
  unzip "$srcdir"/$_pkgname-midi-${pkgver%%.*}.zip \
    -d "$pkgdir"/usr/share/$_pkgname${pkgver%%.*}/media

  install -vdm 755 "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "/usr/share/$_pkgname${pkgver%%.*}/media/MIDI Beats/LICENSE" \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.beats
  ln -s "/usr/share/$_pkgname${pkgver%%.*}/media/MIDI Chords/LICENSE" \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.chords
  ln -s "/usr/share/$_pkgname${pkgver%%.*}/media/MIDI Progressions/LICENSE" \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.progressions
}
