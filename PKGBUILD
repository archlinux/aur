# Maintainer: Gimmeapill <gimmeapill@gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: SpepS <dreamspepser at yahoo.it>
# Contributor: Bernardo Barros <bernardobarros at gmail.com>
# Contributor: Uli Armbruster <uli_armbruster at web.de>
# Contributor: Christopher Arndt <chris at chrisarndt.de>

pkgname=ardour-git
pkgver=6.0.pre0.r3048.g514c05a44e
pkgrel=1
pkgdesc="A multichannel hard disk recorder and digital audio workstation"
arch=('i686' 'x86_64')
url="http://ardour.org/"
license=('GPL')
groups=('pro-audio')
depends=('aubio' 'gtkmm' 'liblo' 'liblrdf' 'lilv' 'suil' 'rubberband' 'taglib' 'libarchive' 'python')
makedepends=('git' 'python2' 'boost' 'cppunit' 'doxygen' 'graphviz' 'itstool' 'lv2')
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

build() {
  cd "${srcdir}/${pkgname%-*}"

  python2 waf configure --prefix=/usr \
                        --configdir=/etc \
                        --with-backends=jack,alsa,dummy \
                        --libjack=weak \
                        --optimize \
                        --cxx11 \
                        --freedesktop \
                        --ptformat \
                        --no-phone-home

  python2 waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${pkgname%-*}"

  python2 waf --destdir="${pkgdir}" install

  # Install freedesktop.org compatible application starter desktop file
  install -Dm644 "${srcdir}/ardour.desktop" \
    "${pkgdir}/usr/share/applications/ardour.desktop"
}
