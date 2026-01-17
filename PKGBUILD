# Maintainer: Jonas Hvid <mail@johv.dk>
# Contributor: Alfredo Beaumont <alfredo.beaumont@gmail.com>

pkgname='picat'
pkgver='3.9.5'
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
b2sums=('e244bf86de711e9235074a60fe9e506300d13ed5aed37f44930ca00e5845bfb3e049b413d08e8eefbe61c1b35dcc1ccd11315ddce9cc3e71b410ed0e8146600c')

prepare() {
  # Inherit system-wide CFLAGS and LDFLAGS (/etc/makepkg.conf):
  cd "$srcdir/Picat/emu"
  sed -i 's/CFLAGS = /CFLAGS += /' Makefile.linux64
  sed -i 's/LFLAGS = /&$(LDFLAGS) -Wl,-z,shstk /' Makefile.linux64

  # As of GCC 15 (?), gnu23 is the default, but it seems like Picat
  # may require the older gnu17. Check in the future if this is still
  # the case. (2025-09-18)
  sed -i '/^CC *= gcc/aCC += -std=gnu17' Makefile.linux64
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
