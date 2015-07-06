# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: SpepS <dreamspepser at yahoo.it>
# Contributor: Bernardo Barros <bernardobarros at gmail.com>
# Contributor: Uli Armbruster <uli_armbruster at web.de>
# Contributor: Christopher Arndt <chris at chrisarndt.de>

_pkgname=ardour
pkgname="${_pkgname}-git"
pkgver=4.0.r306.gdeeb565
pkgrel=1
pkgdesc="A multichannel hard disk recorder and digital audio workstation"
arch=('i686' 'x86_64')
url="http://ardour.org/"
license=('GPL')
depends=('aubio' 'cwiid' 'gtkmm' 'liblo' 'liblrdf' 'libltc' 'lilv' 'suil'
         'rubberband' 'taglib')
makedepends=('git' 'python' 'boost' 'cppunit' 'doxygen' 'graphviz')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git://github.com/Ardour/ardour.git"
        'ardour.desktop')
md5sums=('SKIP'
         '151094720b3cdcce2d66b30915dea536')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  python waf configure \
    --prefix=/usr \
    --configdir=/etc \
    --docs \
    --freedesktop \
    --internal-shared-libs \
    --libjack=weak \
    --lv2 \
    --lxvst \
    --optimize \
    --with-backends=jack,alsa,dummy \
    --use-external-libs

  python waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python waf --destdir="${pkgdir}" install

  # Install freedesktop.org compatibile applictaion starter desktop file
  install -Dm644 "${srcdir}/ardour.desktop" \
    "${pkgdir}/usr/share/applications/ardour.desktop"
}

# vim:set ts=2 sw=2 et:
