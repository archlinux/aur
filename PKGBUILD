# Maintainer: 9M2PJU <9m2pju@gmail.com>

pkgname=sshs-9m2pju-git
_pkgname=sshs
pkgver=4.8.1.r1.g9e09a1c
pkgrel=1
pkgdesc="Terminal user interface for SSH with themes, ASCII art banners, SSHS Explorer, and networking hub (9M2PJU fork)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/9M2PJU/sshs"
license=('MIT')
depends=('openssh')
makedepends=('cargo' 'git')
provides=('sshs')
conflicts=('sshs' 'sshs-bin' 'sshs-git')
source=("${_pkgname}::git+https://github.com/9M2PJU/sshs.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/user-manual.md "$pkgdir/usr/share/doc/$pkgname/user-manual.md"
}
