# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('jellyfin-rpc-git')
pkgver=0.15.1.r0.geabf411
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
	cargo build --frozen --release --all-features
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

	echo
	echo
	echo -------------------------------------------------------------
	echo 'READ THE GITHUB DOCUMENTATION - CONFIG FILE MUST BE EDITED BEFORE USE'
	echo 'jellyfin-rpc binary is located at /usr/lib/jellyfin-rpc/jellyfin-rpc'
	echo 'systemd service file is located at /usr/lib/systemd/user/jellyfin-rpc.service'
	echo 'example config is located at /usr/lib/jellyfin-rpc/example.json'
	echo
	if [ -d $XDG_CONFIG_HOME ]; then
		echo "Place your main.json at $XDG_CONFIG_HOME/jellyfin-rpc/main.json"
	else
		echo "Place your main.json at /home/$USER/.config/jellyfin-rpc/main.json"
	fi
	echo -------------------------------------------------------------
	echo
	echo
}
