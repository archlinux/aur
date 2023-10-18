# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('jellyfin-rpc-iced-git')
pkgver=r15.a4d7a87
pkgrel=3
pkgdesc="GUI For Jellyfin-RPC"
arch=('any')
url="https://github.com/Radiicall/jellyfin-rpc-iced"
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
provides=('jellyfin-rpc-iced')
conflicts=('jellyfin-rpc-iced')
source=("git+https://github.com/Radiicall/jellyfin-rpc-iced.git")
md5sums=('SKIP')

pkgver() {
  cd jellyfin-rpc-iced
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd jellyfin-rpc-iced
	wget https://raw.githubusercontent.com/Radiicall/jellyfin-rpc/main/example.json
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu" 
}


build() {
	cd jellyfin-rpc-iced
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd jellyfin-rpc-iced
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features

}

package() {
	cd jellyfin-rpc-iced
	install -Dm0755 "target/release/jellyfin-rpc-iced" -t "$pkgdir/usr/bin/"
	install -Dm0644 ./README.md "$pkgdir/usr/share/doc/jellyfin-rpc-iced"
	install -Dm0644 "example.json" -t "$pkgdir/usr/lib/jellyfin-rpc/"


	echo
	echo
	echo -------------------------------------------------------------
	echo 'READ THE GITHUB DOCUMENTATION'
	echo 'jellyfin-rpc-iced binary is located at /usr/bin/jellyfin-rpc-iced'
	echo 'Example Config is located at /usr/lib/jellyfin-rpc/example.json'
		if [ -d $XDG_CONFIG_HOME ]; then
		echo "Place your main.json at $XDG_CONFIG_HOME/jellyfin-rpc/main.json"
	else
		echo "Place your main.json at /home/$USER/.config/jellyfin-rpc/main.json"
	fi
	echo
	echo -------------------------------------------------------------
	echo
	echo
}
