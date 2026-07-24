pkgname=xwayland-satellite-hidpi-git
_pkgname=xwayland-satellite

pkgver=e7cc44e
pkgrel=1

pkgdesc="Xwayland satellite with HiDPI cursor scaling fixes"
arch=('x86_64')
url="https://github.com/ByDefolt/xwayland-satellite"
license=('MPL-2.0')

depends=(
  'glibc'
  'libgcc'
  'libxcb'
  'xcb-util-cursor'
  'xorg-xwayland'
)

makedepends=(
  'cargo'
  'clang'
  'git'
)

provides=(
  'xwayland-satellite'
)

conflicts=(
  'xwayland-satellite'
  'xwayland-satellite-git'
)

source=(
  "${_pkgname}::git+https://github.com/ByDefolt/xwayland-satellite.git#branch=x-cursor-changes"
)

sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags --always |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked
}

build() {
  cd "$_pkgname"

  cargo build \
    --frozen \
    --release \
    --features systemd
}

package() {
  cd "$_pkgname"

  install -Dm755 \
    target/release/xwayland-satellite \
    "$pkgdir/usr/bin/xwayland-satellite"

  install -Dm644 \
    LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 \
    resources/xwayland-satellite.service \
    "$pkgdir/usr/lib/systemd/user/xwayland-satellite.service"
}
