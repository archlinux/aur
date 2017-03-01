# Maintainer: Oliver Friedrich <olifriedrich at gmail.com>
# Contributor: Scott Percival <code at moral.net.au>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: SpepS <dreamspepser at yahoo.it>
# Contributor: Bernardo Barros <bernardobarros at gmail.com>
# Contributor: Uli Armbruster <uli_armbruster at web.de>
# Contributor: Christopher Arndt <chris at chrisarndt.de>

_pkgname=ardour
pkgname="${_pkgname}5"
pkgver=5.8
pkgrel=1
pkgdesc="A multichannel hard disk recorder and digital audio workstation"
arch=('i686' 'x86_64')
url="http://ardour.org/"
license=('GPL')
depends=('aubio' 'cwiid' 'gtkmm' 'liblo' 'liblrdf' 'lilv' 'suil'
         'rubberband' 'taglib')
makedepends=('git' 'python2' 'boost' 'cppunit' 'doxygen' 'graphviz' 'itstool' 'qm-dsp')
optdepends=('xjadeo: video monitoring' 'harvid: video timeline') 
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}::git://github.com/Ardour/ardour.git#tag=${pkgver}"
        "${_pkgname}.desktop")
md5sums=('SKIP'
         '347a69827fd57c4c71a9adc326541256')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 waf configure \
    --prefix=/usr \
    --docs \
    --libjack=weak \
    --configdir=/etc \
    --internal-shared-libs \
    --lv2 \
    --lxvst \
    --optimize \
    --with-backends=jack,alsa,dummy \
    --cxx11 \
    --no-phone-home

  python2 waf build $MAKEFLAGS
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 waf --destdir="${pkgdir}" install

  # Install freedesktop.org compatible application starter desktop file
  install -Dm644 "$srcdir/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
