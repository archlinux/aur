# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('jellyfin-rpc-git')
pkgver=1.3.3.r0.ge860f27
pkgrel=1
pkgdesc="Displays the content you're currently watching on Discord"
arch=('any')
url="https://github.com/Radiicall/jellyfin-rpc"
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
provides=('jellyfin-rpc')
conflicts=('jellyfin-rpc')
source=("git+https://github.com/Radiicall/jellyfin-rpc.git")
md5sums=('SKIP')
options=(!lto)
install=jellyfin-rpc-git.install

pkgver() {
  cd jellyfin-rpc
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd jellyfin-rpc
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	sed -i "s|^ExecStart=.*\$|ExecStart=/usr/lib/jellyfin-rpc/jellyfin-rpc|" scripts/jellyfin-rpc.service 
}


build() {
	cd jellyfin-rpc
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --no-default-features

}

check() {
	cd jellyfin-rpc
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd jellyfin-rpc
	install -Dm0755 "target/release/jellyfin-rpc" -t "$pkgdir/usr/lib/jellyfin-rpc/"
	install -Dm0644 "example.json" -t "$pkgdir/usr/lib/jellyfin-rpc/"
	install -Dm0644 ./README.md "$pkgdir/usr/share/doc/jellyfin-rpc"
	install -Dm0644 "scripts/jellyfin-rpc.service" -t "$pkgdir/usr/lib/systemd/user/"
}
