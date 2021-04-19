# Maintainer: lain <aur@hacktheinter.net>
pkgname=ffts-git
pkgver=r799.fe86885
pkgrel=3
pkgdesc="The Fastest Fourier Transform in the South"
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
arch=('any')
url='https://github.com/anthonix/ffts'
license=('BSD')
depends=()
makedepends=('git' 'cmake')
source=(
  'git+https://github.com/anthonix/ffts.git'
  'fix-non-sse2.patch'
)
md5sums=(
  'SKIP'
  'e7711b3c9f73a2f36fbf405663c05c9d'
)

pkgver() {
  cd ffts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ffts
  # Patch to fix compilation on non-SSE2 machines
  # Source: https://github.com/anthonix/ffts/pull/78
  # (has no effect on SSE2 machines, so we can just always apply the patch)
  git apply $srcdir/fix-non-sse2.patch
}

build() {
  mkdir -p ffts/build
  cd ffts/build
  cmake -DENABLE_SHARED=ON -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ffts
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd build
  make DESTDIR="$pkgdir" install
}
