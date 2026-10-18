# Maintainer: Jonas Hvid <mail@johv.dk>
# Contributor: Alfredo Beaumont <alfredo.beaumont@gmail.com>

pkgname='picat'
pkgver='3.9.12'
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
source=("https://picat-lang.org/download/${pkgname}${_pkgver//\./_}_src.tar.gz")
b2sums=('3bc8cfc1ac6f694ed22f16e81b3cdd2f489c7d235975e716e372b02cbf92413d9a4b082534a3ca46f9468b4073d852cc24838d19dc0d5a487e0788e17f448a28')

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
