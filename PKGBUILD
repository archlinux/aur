# Maintainer: lain <aur@hacktheinter.net>
# Maintainer: xorly <patrikbachan@gmail.com>
pkgname=ffts-git
_pkgname=ffts
pkgver=r800.b22d839b61c
pkgrel=1
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
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # Patch to fix compilation on non-SSE2 machines
  # Source: https://github.com/anthonix/ffts/pull/78
  # (has no effect on SSE2 machines, so we can just always apply the patch)
  git apply $srcdir/fix-non-sse2.patch
}

build() {
  cmake -B build -S "$srcdir/$_pkgname" \
    -DENABLE_SHARED=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "$srcdir/$_pkgname"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
