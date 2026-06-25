# Maintainer: Fermín Olaiz <fermin@olaiz.net>

_pkgname=AutoKuma
pkgname="${_pkgname,,}-cli-git"
pkgver=v2.1.0.rc.2.r0.g1cba1f0
pkgrel=1
pkgdesc="kuma-cli tool from the AutoKuma project"
arch=('x86_64' 'aarch64')
url="https://github.com/BigBoot/$_pkgname"
license=('MIT')
depends=('glibc' 'openssl' 'libgcc' 'libstdc++')
makedepends=('cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git#branch=master")
sha256sums=(SKIP)

# It fails with lto, see https://bbs.archlinux.org/viewtopic.php?id=312228
options=(!lto)

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin/" 'kuma-cli/target/release/kuma'
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" 'LICENSE'
}
