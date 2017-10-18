# Contributor: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>

pkgrel=1
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
            '9f85ac47436359f437202d561c2b8bcf5d8e13c544380130729a6e3340d01bdd2d63d44d676b4e48125341076c17e891')
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
