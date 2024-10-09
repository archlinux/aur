# Maintainer: Edmund Lodewijks <e .lodewijks @ gmail. com>

pkgname=gnubg-git
_pkgname=gnubg
pkgver=1.08.003.r49.g898bb44f
pkgrel=2
pkgdesc="World class backgammon application"
arch=('x86_64')
url="https://www.gnu.org/software/gnubg/"
license=('GPL-3.0-or-later')
depends=('python' 'gtkglext' 'curl')
makedepends=('git')
provides=("gnubg=${pkgver%%.r*}")
conflicts=("gnubg")
source=('git+https://git.savannah.gnu.org/git/gnubg.git#branch=master'
        "${_pkgname}.desktop")
validpgpkeys=('39FC530C20B9B8C627E71BAC973B63D4ECB3B8BD')
sha256sums=('SKIP'
            'e9b40a2ce5e0b4f3c517913189abc138fe3377d86ca0baafa2b220c962caf7f1')
pkgver() {
  cd "$srcdir/${_pkgname}"

  git describe --long --tags | sed 's/release.//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"

  ./autogen.sh

  ./configure --prefix=/usr --bindir=/usr/bin --sysconfdir=/etc \
    --mandir=/usr/share/man --enable-simd=sse2

  make
}

package() {
  cd "$srcdir/${_pkgname}"

  DESTDIR="${pkgdir}" make install

  install -Dm644 "$srcdir"/${_pkgname}.desktop \
    "$pkgdir"/usr/share/applications/${_pkgname}.desktop
}
