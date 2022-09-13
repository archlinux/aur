# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=rlr-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r25.5fd3169
pkgrel=1
pkgdesc="interactive pixel screen ruler and protractor"
arch=('any')
url="https://github.com/epilys/rlr"
license=('GPL')
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}" "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '7f659ea7e8cb794963ff6881294a8aba388c33bc10c7e14c1ecf58fb241386e7')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# git, no tags available
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
	# binary
	install -Dm0755 "${srcdir}/${pkgname%-git}/target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin/"
	# desktop file
	install -Dm644 "${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}
