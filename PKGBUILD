# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: SpepS <dreamspepser at yahoo.it>
# Contributor: Bernardo Barros <bernardobarros at gmail.com>
# Contributor: Uli Armbruster <uli_armbruster at web.de>
# Contributor: Christopher Arndt <chris at chrisarndt.de>

_pkgname=ardour
pkgname="${_pkgname}-git"
pkgver=5.4.r258.g91c2527
pkgrel=1
pkgdesc="A multichannel hard disk recorder and digital audio workstation"
arch=('i686' 'x86_64')
url="http://ardour.org/"
license=('GPL')
depends=('aubio' 'cwiid' 'gtkmm' 'liblo' 'liblrdf' 'lilv' 'suil' 'rubberband' 'taglib' 'libarchive')
makedepends=('git' 'python2' 'boost' 'cppunit' 'doxygen' 'graphviz' 'itstool')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git://github.com/Ardour/ardour.git"
        'ardour.desktop')
md5sums=('SKIP'
         'd4e6590ea931cbb539a159d3565802a2')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  python2 waf configure --prefix=/usr \
                        --configdir=/etc \
                        --with-backends="jack,alsa,dummy " \
                        --libjack=weak \
                        --optimize \
                        --docs \
                        --cxx11 \
                        --no-phone-home

  python2 waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}"

  python2 waf --destdir="${pkgdir}" install

  # Install freedesktop.org compatible application starter desktop file
  install -Dm644 "${srcdir}/ardour.desktop" \
    "${pkgdir}/usr/share/applications/ardour.desktop"
}

# vim:set ts=2 sw=2 et:
