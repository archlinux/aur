# Maintainer: Alexander Bocken <alexander@bocken.org>
pkgname=bthandler
pkgver=r99.136827f
pkgrel=1
pkgdesc="A shell script to interact with bluetooth devices via dmenu"
arch=(any)
depends=('bluez-utils')
makedepends=('git')
optdepends=(
	'dmenu: display menu'
)
url="https://github.com/AlexBocken/bthandler"
license=('AGPL3')
source=('bthandler::git+https://github.com/AlexBocken/bthandler.git')
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/$pkgname"
	mkdir -p /home/${USER}/.config/bt
	touch /home/${USER}/.config/bt/blacklist
	touch /home/${USER}/.config/bt/alias
	touch /home/${USER}/.config/bt/paired

	#remove wrong older install location
	rm -f $pkgdir/usr/bin/bt
	#force override for older config setups
	if grep -q '\#set to anything non-empty to enable' /home/${USER}/.config/bt/config
	then
		echo "config syntax has changed. overwritten old config."
		echo "Please adjust manually again."
		rm -f /home/${USER}/.config/bt/config
	fi

	cp config /home/${USER}/.config/bt/config

	install -Dm755 bt $pkgdir/usr/local/bin/bt
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
