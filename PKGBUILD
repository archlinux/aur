# Maintainer: Reihar <reihar@necronomicon.fr>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Adrian Stratulat <adrian.stratulat at inboxcom>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: KillaB <xGenoBlast@gmail.com>
# Contributor: Callan Barrett <wizzomafizzo@gmail.com>
# Contributor: Christian Schmidt <xmucknertx@googlemail.com>
# Contributor: Sebastian Sareyko <public@nooms.de>

_pkgname=angband
pkgname=angband-ncurses
pkgver=4.2.4
pkgrel=0
pkgdesc="A roguelike dungeon exploration game based on the writings of JRR Tolkien (ncurses-only)"
arch=('i686' 'x86_64' 'armv7h')
url="http://rephial.org/"
license=('GPL2' 'custom')
depends=('ncurses')
makedepends=('python-docutils'
			 #'texlive-core' #Uncomment if you want a pdf manual. That's quite the dependency, don't you think?
			'autoconf' 'automake')
conflicts=('angband' 'angband-git')
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/releases/download/${pkgver}/${_pkgname^}-${pkgver}.tar.gz"
#  "http://rephial.org/downloads/${pkgver:0:3}/${_pkgname}-${pkgver}.tar.gz"
)
install=angband-ncurses.install

prepare() {
  mv "${srcdir}/${_pkgname^}-${pkgver}" "${srcdir}/${_pkgname}-${pkgver}"
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Fix detection of ncurses config script for ncurses 6.0
  sed -i 's/ncursesw5-config/ncursesw6-config/g' acinclude.m4
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sysconfdir=/usr/share/angband \
    --with-configpath=/usr/share/angband \
    --with-libpath=/usr/share/angband \
    --disable-x11

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}/usr/share/${_pkgname}/*/delete.me"
  rm -R "${pkgdir}"/usr/share/angband/{icons,sounds}
  install -Dm644 docs/copying.rst "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}

sha256sums=('a07c78c1dd05e48ddbe4d8ef5d1880fcdeab55fd05f1336d9cba5dd110b15ff3')
