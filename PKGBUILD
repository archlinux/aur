# Maintainer: Henry Graham <henry)dot(arch)at(hgrahamcs)dot(com(>

pkgname=amimullvad
pkgver=1.1
pkgrel=2
pkgdesc='Utility to check for a mullvad vpn connection status'
arch=('x86_64')
url='https://github.com/hgrahamcs/amimullvad'
license=('custom:WTFPL')
makedepends=("cargo")
source=('https://github.com/hgrahamcs/amimullvad/archive/v1.1.tar.gz')
sha256sums=('42b1699869f3733aa3506f0cb804d19b515fc64c020b2502a1245cd256637160')

# I'm not using --locked here because there is no cargo.lock and I don't want
# to bump the pkgver for such a small change to the build process
prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd $pkgname-$pkgver 
	cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	cd $pkgname-$pkgver 
    	cargo build --frozen --release --all-features
}

package(){
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$pkgname-$pkgver/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
