# Maintainer: Jonas Hvid <mail@johv.dk>
# Contributor: Alfredo Beaumont <alfredo.beaumont@gmail.com>

pkgname='picat'
pkgver='3.9'
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
b2sums=('ae49ddd20810c2a05af338ff0ad226ce0c0dad7af9bbbc690dab9c54c3fd9c0e90588e376593a68a6c725840e73c56f9a4dfcbc30c574faf989c841d0a4ed63c')

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
