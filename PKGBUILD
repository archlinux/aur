# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('jellyfin-rpc-git')
pkgver=0.14.1.r2.ge1ec0dd
pkgrel=5
pkgdesc="Displays the content you're currently watching on Discord"
arch=('x86_64')
url="https://github.com/Radiicall/jellyfin-rpc"
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
provides=('jellyfin-rpc')
conflicts=('jellyfin-rpc')
source=("git+https://github.com/Radiicall/jellyfin-rpc.git"
	"git+https://github.com/0xGingi/jellyfin-rpc-aur.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd jellyfin-rpc
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd jellyfin-rpc
	cargo build --release
}

#Jellyfin-RPC cannot be ran as root and is designed to be ran in userspace
#As such, I've set very loose permissions for the configs

package() {
	cd jellyfin-rpc
	install -Dm755 ./target/release/jellyfin-rpc "$pkgdir/opt/jellyfin-rpc/jellyfin-rpc"
	install -Dm777 ./example.json "$pkgdir/opt/jellyfin-rpc/example.json"
	install -Dm755 ./README.md "$pkgdir/usr/share/doc/jellyfin-rpc"
	cd ..
	cd jellyfin-rpc-aur
	install -Dm777 ./jellyfin-rpc.service "$pkgdir/usr/lib/systemd/user/jellyfin-rpc.service"

	echo
	echo
	echo -------------------------------------------------------------
	echo 'READ THE GITHUB DOCUMENTATION - CONFIG FILE MUST BE EDITED BEFORE USE'
	echo 'jellyfin-rpc binary is located at /opt/jellyfin-rpc/jellyfin-rpc'
	echo 'config example is located at /opt/jellyfin-rpc/example.json'
	echo 'systemd service file is located at /usr/lib/systemd/user/jellyfin-rpc.service'
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
