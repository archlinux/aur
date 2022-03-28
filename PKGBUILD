# Maintainer: Nil Geisweiller <ngeiswei at gmail.com>
# Contributor: Gimmeapill <gimmeapill at gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: SpepS <dreamspepser at yahoo.it>
# Contributor: Bernardo Barros <bernardobarros at gmail.com>
# Contributor: Uli Armbruster <uli_armbruster at web.de>
# Contributor: Christopher Arndt <aur at chrisarndt.de>

pkgname=ardour-tracker-editor-git
pkgver=7.0.pre0.r3030.gf8212bf849
pkgrel=1
pkgdesc="Ardour with a music tracker editor (git version, tracker-editor-wip branch)"
arch=('x86_64')
url="https://github.com/ngeiswei/ardour/blob/tracker-editor-wip/gtk2_ardour/tracker/README.md"
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
source=("${pkgname%-*}::git+https://github.com/ngeiswei/ardour.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-*}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-*}"
  git checkout f8212bf849

  # https://bugs.archlinux.org/task/54389
  sed -e '8iexport GTK2_RC_FILES=/dev/null' -i gtk2_ardour/ardour.sh.in
}

build() {
  cd "${srcdir}/${pkgname%-*}"

  python waf configure  --strict \
                        --prefix=/usr \
                        --configdir=/etc \
                        --cxx11 \
                        --libjack=weak \
                        --optimize \
                        --ptformat \
                        --with-backends=alsa,dummy,jack,pulseaudio \
                        --with-tracker-editor

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

  # NEXT try to reenable stuff from ardour-git
}
