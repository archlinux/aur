# Contributor: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>

pkgrel=2
pkgver=r343.01e2766
pkgname=zsh-zim-git
pkgdesc="ZIM - Zsh IMproved"
url="https://github.com/Eriner/zim"
arch=('any')
license=('MIT')
depends=('zsh')
makedepends=('git' 'rsync')
optdepends=('otf-powerline-symbols-git: for eriner prompt')
source=('git://github.com/Eriner/zim.git' 'zim.install' 'zshrc')
options=('!strip')
install='zim.install'
sha384sums=('SKIP'
            'f83543b7749334a6085701135eb330f099ed2e6236f9b694defaf519193109866e20de55d78bc25aa31a69924a1be7fb'
            'f9369671dd4b4e116a6b1d6769482f148dc062ec9ff1cb0ec70f0c0ee91a62efc9acdae0193a299fab941e770f377d74')
_gitname='zim'
backup=('etc/zsh/zlogin' 'etc/zsh/zimrc' 'etc/zsh/zshrc')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$_gitname
	git submodule update --init --recursive

	mkdir -p $srcdir/etc/zsh

	rm -f $srcdir/etc/zsh/*

	for entry in ${backup[@]}; do
		rcfile=$(basename $entry)
		if [ -f $srcdir/$_gitname/templates/$rcfile ]; then
			echo "source /usr/lib/zim/templates/$rcfile" >> "$srcdir/etc/zsh/$rcfile"
		fi
	done
	
	cp $srcdir/zshrc $srcdir/etc/zsh/zshrc
}

package() {
	mkdir -p $pkgdir/usr/lib/zim
	rsync -ar --exclude=".git*" $srcdir/$_gitname/ $pkgdir/usr/lib/zim

	mkdir -p $pkgdir/etc
	cp -r $srcdir/etc/zsh $pkgdir/etc
}
