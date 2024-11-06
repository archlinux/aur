pkgname=tmux-rime
pkgver=0.0.3
pkgrel=1
pkgdesc="rime for tmux"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$pkgname
license=(GPL3)
source=("$url/archive/$pkgver.tar.gz")
depends=(librime glib2 tmux)
makedepends=(xmake)
sha256sums=('012d1b8e8fe265fbd927af113fa7d54fc8704a449f9b86904767fe20378bea81')

export XMAKE_ROOT=y

prepare() {
	cd "$pkgname-$pkgver" || return 1
	sed -i s/glib/glib-2.0/g xmake.lua
}

build() {
	cd "$pkgname-$pkgver" || return 1

	# https://github.com/xmake-io/xmake/discussions/5699
	HOME=$PWD PATH=$HOME:$PATH
	echo -e "#!$SHELL\necho I am git" > $HOME/git
	chmod +x $HOME/git

	xmake g --network=private
	xmake f --verbose
	xmake
}

package() {
	cd "$pkgname-$pkgver" || return 1

	xmake install -o"$pkgdir/usr"
}
# ex: nowrap
