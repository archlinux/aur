# Maintainer: Jonas Hvid <mail@johv.dk>
# Contributor: Alfredo Beaumont <alfredo.beaumont@gmail.com>

pkgname='picat'
pkgver='3.8.7'
pkgrel=1
pkgdesc='A simple, and yet powerful, logic-based multi-paradigm programming language aimed for general-purpose applications.'
arch=('x86_64')
groups=()
depends=(glibc gcc-libs)
optdepends=('coin-or-cbc: CBC MIP support'
            'cvc4: CVC4 SMT support'
            'glpk: GLPK MIP support'
            'gurobi: Gurobi MIP support'
            'z3: Z3 SMT support')
url='https://picat-lang.org/'
license=('MPL-2.0')

_pkgver=$(echo ${pkgver} | sed 's/\.//;s/#//')
source=("https://picat-lang.org/download/${pkgname}${pkgver//\./}_src.tar.gz")
b2sums=('b5c3ce7d3ac1d2d9c5d87c1329c835e01b053f357e58a447b4b4d7f12b8afb5ff1bc5da5ff3a19b5446e1d5d95f2a108419e6085cf2f62e5046bab58143c5c48')

prepare() {
  # Inherit system-wide CFLAGS and LDFLAGS (/etc/makepkg.conf):
  cd "$srcdir/Picat/emu"
  sed -i 's/CFLAGS = /CFLAGS += /' Makefile.linux64
  sed -i 's/LFLAGS = /&$(LDFLAGS) -Wl,-z,shstk /' Makefile.linux64
}

build() {
  cd "$srcdir/Picat/emu"
  make -f Makefile.linux64
}

package() {
  install -m644 "$srcdir/Picat/LICENSE" -Dt "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 "$srcdir/Picat/emu/picat" -Dt "$pkgdir/usr/bin"
  install -m644 "$srcdir/Picat/lib/"* -Dt "$pkgdir/usr/lib/$pkgname"
  install -m644 "$srcdir/Picat/doc/"* -Dt "$pkgdir/usr/share/doc/$pkgname"
}
