# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>

pkgname=lean-git
_pkgver=0.2.0
pkgver=${_pkgver}.r8554.9fa30e3
pkgrel=1
pkgdesc='Lean Theorem Prover'
arch=('x86_64' 'i386')
url="http://leanprover.github.io/"
license=('Apache')
depends=('gmp' 'mpfr' 'lua>=5.2')
makedepends=('git' 'cmake' 'python' 'gperftools')
optdepends=('emacs: emacs mode')
conflicts=('lean-bin')
source=("$pkgname::git+https://github.com/leanprover/lean.git")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
  cd "$pkgname"
  cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr src/ \
    -DTCMALLOC=OFF # temporary workaround for a tcmalloc bug
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set et ts=2 sw=2:
