# Maintainer: BlackDragon2447 <blackdragon2447@e.email>
pkgname='leftwm-config-git'
pkgver=r53.3a2f422
pkgrel=2
pkgdesc="Config manager for LeftWM"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm-config"
license=('BSD')
depends=('leftwm')
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("leftwm-config")
conflicts=("leftwm-config")
source=("${pkgname}::git+https://github.com/leftwm/leftwm-config.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  # cd "$srcdir/$pkgname"
  # cargo +stable build --release

	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" $srcdir/$pkgname/LICENCE
	# cd "$srcdir/$pkgname/target/release"
	install -Dm755 -t "${pkgdir}/usr/bin" "target/release/leftwm-config"
}
