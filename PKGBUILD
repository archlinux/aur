# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=rlr-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r19.3d62f7a
pkgrel=1
pkgdesc="interactive pixel screen ruler and protractor"
arch=('any')
url="https://github.com/epilys/rlr"
license=('GPL')
depends=()
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
  # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/${pkgname%-git}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
