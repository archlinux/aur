# Maintainer: Gimmeapill <gimmeapill at gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: SpepS <dreamspepser at yahoo.it>
# Contributor: Bernardo Barros <bernardobarros at gmail.com>
# Contributor: Uli Armbruster <uli_armbruster at web.de>
# Contributor: Christopher Arndt <aur at chrisarndt.de>

pkgname=ardour-git
pkgver=6.0.rc1.r142.g551be058f2
pkgrel=1
pkgdesc="A multichannel hard disk recorder and digital audio workstation"
arch=('i686' 'x86_64')
url="http://ardour.org/"
license=('GPL')
groups=('pro-audio')
depends=('alsa-lib' 'aubio' 'gtkmm' 'libarchive' 'liblo' 'liblrdf' 'lilv'
         'python' 'rubberband' 'suil' 'taglib')
makedepends=('boost' 'cppunit' 'cwiid' 'doxygen' 'git' 'graphviz' 'itstool'
             'lv2' 'libwebsockets')
optdepends=('cwiid: Wiimote control support'
            'libwebsockets: WebSockets control support')
provides=('ardour')
conflicts=('ardour')
source=("${pkgname%-*}::git://github.com/Ardour/ardour.git"
        'ardour.desktop')
md5sums=('SKIP'
         '2133510d99892ed2793d9ff02e86b3fd')

pkgver() {
  cd "${srcdir}/${pkgname%-*}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-*}"
  # https://bugs.archlinux.org/task/54389
  sed -e '8iexport GTK2_RC_FILES=/dev/null' -i gtk2_ardour/ardour.sh.in
}

build() {
  cd "${srcdir}/${pkgname%-*}"

  python waf configure --prefix=/usr \
                        --configdir=/etc \
                        --with-backends=jack,alsa,dummy \
                        --libjack=weak \
                        --optimize \
                        --cxx11 \
                        --freedesktop \
                        --ptformat \
                        --no-phone-home

  python waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${pkgname%-*}"

  python waf --destdir="${pkgdir}" install

  # Install freedesktop.org compatible application starter desktop file
  install -Dm644 "${srcdir}/ardour.desktop" \
    "${pkgdir}/usr/share/applications/ardour.desktop"
}
