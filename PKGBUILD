pkgbase=sysinfo-bin
pkgname=sysinfo-bin
pkgver=1.2
pkgrel=1
pkgdesc="Simple neofetch-based system info wrapper"
arch=('any')
depends=('neofetch')
license=('MIT')

source=('sysinfo')
sha256sums=('SKIP')

package() {
    install -Dm755 sysinfo "$pkgdir/usr/bin/sysinfo"
}

post_install() {
	if ! command -v git >/dev/null; then
		if [ "$USER" = "root" ]; then
			echo "Downloading/Installing git for root."
			pacman -S --needed git
		else
			echo "Downloading/Installing git."
			sudo pacman -S --needed git
		fi
	fi
	
	if ! command -v git >/dev/null; then
		if [ "$USER" = "root" ]; then
			sudo pacman -S --needed make
		else
			sudo pacman -S --needed make
		fi
	fi
	echo "sysinfo-bin: Downloading and Building neofetch."
	mkdir -p "$HOME/temp"
	cd "$HOME/temp"
	git clone https://github.com/dylanaraps/neofetch
	echo "Going into directory '$HOME/temp/neofetch'"
	cd neofetch
	sudo make install
	cd ..
	rm -rf neofetch
	cd ..
	echo "sysinfo-bin: Installed NeoFetch!"
}
