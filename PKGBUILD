# Contributor: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>

pkgrel=1
pkgver=r458.1ab110c
pkgname=zsh-zim-git
pkgdesc="ZIM - Zsh IMproved"
url="https://github.com/zimfw/zimfw"
arch=('any')
license=('MIT')
depends=('zsh')
makedepends=('git' 'rsync')
optdepends=('otf-powerline-symbols-git: for eriner prompt')
source=('git://github.com/zimfw/zimfw.git' 'zim.install' 'zshrc')
options=('!strip')
install='zim.install'
sha384sums=('SKIP'
            'ba9906f5cad124b1a419008ff5f98ca31414056be7a89d94ecf679a170765208d244b2d41ce85a2dba6a5aa60fc7f299'
            'f9369671dd4b4e116a6b1d6769482f148dc062ec9ff1cb0ec70f0c0ee91a62efc9acdae0193a299fab941e770f377d74')
_gitname='zimfw'
backup=('etc/zsh/zlogin' 'etc/zsh/zimrc' 'etc/zsh/zshrc')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/$_gitname
	git submodule update --init --recursive
}

package() {
	mkdir -p $pkgdir/usr/lib/zim
	rsync -ar --exclude=".git*" $srcdir/$_gitname/ $pkgdir/usr/lib/zim
	cp $srcdir/zshrc $pkgdir/usr/lib/zim/templates/zshrc

	mkdir -p $pkgdir/etc/zsh

	for entry in ${backup[@]}; do
		rcfile=$(basename $entry)
		if [ -f $srcdir/$_gitname/templates/$rcfile ]; then
			echo "source /usr/lib/zim/templates/$rcfile" >> "$pkgdir/etc/zsh/$rcfile"
		fi
	done
}
