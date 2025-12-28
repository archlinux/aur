# Maintainer: Ash <xash at riseup d0t net>
pkgname=lazygsf-git
pkgver=r22.2e1579e
pkgrel=1
pkgdesc="A library for decoding GSF (Game Boy Advance) files"
arch=(i686 x86_64)
url="https://github.com/jprjr/lazygsf"
license=(MIT)
depends=(glibc)
makedepends=(git cmake ninja)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "${pkgname}::git+https://github.com/jprjr/lazygsf.git"
  "mgba::git+https://github.com/mgba-emu/mgba.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  # get the exact submodule commit that the superproject expects
  local _mgba_commit
  _mgba_commit="$(git ls-tree -d HEAD mgba | awk '{print $3}')"

  # make sure our separately-fetched mgba repo is at that commit
  # (this avoids relying on network during submodule init)
  git -C "$srcdir/mgba" checkout -q "$_mgba_commit"

  # point the submodule URL to the local mgba checkout, then sync+update
  git config -f .gitmodules submodule.mgba.url "$srcdir/mgba"
  git submodule sync --recursive

  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname"

  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON

  cmake --build build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
