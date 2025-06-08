pkgname=tmux-rime
pkgver=0.0.4
pkgrel=1
pkgdesc="rime for tmux"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$pkgname
license=(GPL3)
_version=9e39ee6a9c9a4c43192b95b7efcc95ea1c79a28d
source=(
	"$url/archive/$pkgver.tar.gz"
	https://github.com/xmake-io/xmake-repo/archive/$_version.tar.gz
)
depends=(librime glib2 tmux)
makedepends=(xmake)
sha256sums=('328f5dc24d5ae77d3ff48ed56728af12d7d9a181492542aa3b08aae5d4c71280'
            'f4a75ea7b86ed7b652e514337746ea0232f88513ec6ab61a3c687a91b31d4a3c')

export XMAKE_ROOT=y

build() {
	# https://github.com/xmake-io/xmake/discussions/5699
	HOME=$PWD PATH=$HOME:$PATH
	echo -e "#!$SHELL\necho I am git" >$HOME/git
	chmod +x $HOME/git
	install -d .xmake/repositories
	ln -sf ../../"xmake-repo-$_version" .xmake/repositories/xmake-repo

	cd "$pkgname-$pkgver" || return 1

	xmake g --network=private
	xmake f --verbose
	xmake
}

package() {
	cd "$pkgname-$pkgver" || return 1

	xmake install -o"$pkgdir/usr"
}
