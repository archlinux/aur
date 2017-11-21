# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=solbuild
pkgname=solbuild-git
pkgver=1.4.1.r2.geef38f4
pkgrel=1
pkgdesc="The Solus package build system"
arch=(x86_64 i686)
url="https://solus-project.com/"
license=(Apache)
depends=(git libgit2 abireport)
makedepends=(go)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/solus-project/solbuild.git"
        solbuild.conf)
sha512sums=('SKIP'
            'e3ab36dbb1a84e49f499e6c27cf3adb738961351799bd993ac339d2c22b3c753cf3ead8bde5e7a7ca2c5cc39028c20f024711f3fd68489c666ffb25c7eff323b')
validpgpkeys=('8876CC8EDAEC52CEAB7742E778E2387015C1205F') # Ikey Doherty

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  make ensure_modules
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
  install -m 00644 data/99_unstable.conf "$pkgdir"/usr/share/solbuild/.
  install -m 00644 data/local-unstable-x86_64.profile "$pkgdir"/usr/share/solbuild/.
  install -D -m 00644 "$srcdir"/solbuild.conf "$pkgdir"/usr/lib/tmpfiles.d/solbuild.conf
}
