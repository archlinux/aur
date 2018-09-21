# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Edward W Ayers <ewa21 at cam.ac.uk>

pkgname=lean-git
pkgver=3.4.1.r4.gb13ac127f
pkgrel=1
pkgdesc='Lean Theorem Prover'
arch=('x86_64' 'i386')
url="http://leanprover.github.io/"
license=('Apache')
depends=('gmp' 'mpfr' 'lua>=5.2')
makedepends=('git' 'cmake' 'python' 'gperftools' 'gcc7')
optdepends=('emacs: emacs mode')
conflicts=('lean-bin')
source=("$pkgname::git+https://github.com/leanprover/lean.git")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr src/ \
    -DCMAKE_CXX_COMPILER=g++-7 \
    -DTCMALLOC=OFF # temporary workaround for a tcmalloc bug
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set et ts=2 sw=2:
