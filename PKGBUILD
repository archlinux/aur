# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('jellyfin-rpc-git')
pkgver=0.14.1.r1.g09a2b60
pkgrel=1
pkgdesc="Displays the content you're currently watching on Jellyfin on Discord"
arch=('x86_64')
url="https://github.com/Radiicall/jellyfin-rpc"
license=('GPL3')
depends=('openssl' 'rust')
makedepends=('git')
optdepends=('rustup')
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
	install -Dm777 ./jellyfin-rpc.service "$pkgdir/opt/jellyfin-rpc/jellyfin-rpc.service"
	ln -s "/opt/jellyfin-rpc/jellyfin-rpc.service" "$HOME/.config/systemd/user/jellyfin-rpc.service"

	echo
	echo
	echo -------------------------------------------------------------
	echo 'READ THE GITHUB DOCUMENTATION - CONFIG FILES MUST BE EDITED BEFORE USE'
	echo 'jellyfin-rpc binary is located at /opt/jellyfin-rpc/jellyfin-rpc'
	echo 'config example is located at /opt/jellyfin-rpc/example.json'
	echo 'move the example.json to main.json in the same folder'
	echo 'systemd service file is symlinked to $HOME/.config/systemd/user/jellyfin-rpc.service'
	echo -------------------------------------------------------------
	echo
	echo

}
