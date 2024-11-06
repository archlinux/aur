pkgname=rl_custom_rime
pkgver=0.0.1
pkgrel=1
pkgdesc="rime for readline"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$pkgname
license=(GPL3)
source=(
	"$url/archive/$pkgver.tar.gz"
	https://github.com/Freed-Wu/tmux-rime/archive/0.0.3.tar.gz
)
depends=(librime glib2 readline rl_custom_function)
makedepends=(xmake)
sha256sums=('94d7d20dbf443fed7d8ea5112b82b9ac6f0576a0b9fdab7e4e266433ae50f10a'
            '012d1b8e8fe265fbd927af113fa7d54fc8704a449f9b86904767fe20378bea81')

export XMAKE_ROOT=y

prepare() {
	cd "$pkgname-$pkgver" || return 1
	sed -i s/glib/glib-2.0/g xmake.lua
	ln -s ../tmux-rime-0.0.3 tmux-rime
}

build() {
	# https://github.com/xmake-io/xmake/discussions/5699
	HOME=$PWD PATH=$HOME:$PATH
	echo -e "#!$SHELL\necho I am git" >$HOME/git
	chmod +x $HOME/git

	cd "$pkgname-$pkgver" || return 1

	xmake g --network=private
	xmake f --verbose
	xmake
}

package() {
	cd "$pkgname-$pkgver" || return 1

	xmake install -o"$pkgdir/usr"
}
