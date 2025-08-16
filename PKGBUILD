# Maintainer: Marco Huenseler <marco@wuthoehle.de>

pkgname=bootc-git
_pkgname=bootc
pkgver=1.5.1.r14.g03fa72b
pkgrel=1
pkgdesc="Boot and upgrade via container images"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://bootc-dev.github.io/bootc"
_url="https://www.github.com/$_pkgname-dev/$_pkgname"
license=('MIT OR Apache-2.0')
depends=(gcc-libs
  glibc
  ostree)
makedepends=(cargo
  git)
provides=("bootc=$pkgver")
conflicts=('bootc')
source=("git+$_url.git")
sha256sums=('SKIP')
# options=(!lto)

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 --match="v*" HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/bootc -t "${pkgdir}/usr/bin"
  install -Dm755 -d "${pkgdir}/usr/share/doc/$pkgname"
  cp -Rv docs/src/* "${pkgdir}/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
