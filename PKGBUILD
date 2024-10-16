# Maintainer: Lukas Wölfer (domain is thasky) <aur at [domain] dot one>
pkgname=i3-insert-workspace-git
pkgver=1.3.3.r0.g4099c46
pkgrel=1
pkgdesc='Insert a new named workspace between two other named workspaces.'
url='https://github.com/corrodedHash/i3-insert-workspace'
source=("${pkgname}::git+https://github.com/corrodedHash/${pkgname%-git}#branch=main")
arch=('x86_64' 'i686')
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

makedepends=('cargo' 'git')
depends=('gcc-libs' 'glibc')
optdepends=()

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"

  RUSTUP_TOOLCHAIN=stable \
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build () {
  cd "$srcdir/$pkgname"

  RUSTUP_TOOLCHAIN=stable \
  CARGO_TARGET_DIR=target \
    cargo build --frozen --release
}

check() {
  # cd "$srcdir/$pkgname"
  # cargo test --frozen

  echo No tests
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm0755 target/release/i3-insert-workspace "${pkgdir}/usr/bin/i3-insert-workspace"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
