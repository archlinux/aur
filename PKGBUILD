# Contributor: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>

pkgrel=1
pkgver=r173.6cb9d54
pkgname=zsh-zim-git
pkgdesc="ZIM - Zsh IMproved"
url="https://github.com/Eriner/zim"
arch=('any')
license=('MIT')
depends=('zsh')
makedepends=('git')
optdepends=('otf-powerline-symbols-git: for eriner prompt')
source=('git://github.com/Eriner/zim.git' 'zim.install')
options=('!strip')
install='zim.install'
sha256sums=('SKIP'
            'ce9391f23d553fe220ee3eae5cfc10cd6d1b905d0ef900ce577c400f01e3f305')
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

	echo "source /etc/zsh/zimrc" > "$srcdir/etc/zsh/zshrc"
	echo "source /usr/lib/zim/init.zsh" >> "$srcdir/etc/zsh/zshrc"

	sed -i 's#\${ZDOTDIR:-\${HOME}}/\.zim\(\>\)#/usr/lib/zim\1#g' $(find $srcdir/$_gitname -name init.zsh) $srcdir/$_gitname/templates/zlogin
	sed -i 's#\${ZDOTDIR:-\${HOME}}/\.zim#/usr/lib/zim#g' $srcdir/$_gitname/modules/debug/functions/trace-zim

	for entry in ${backup[@]}; do
		rcfile=$(basename $entry)
		if [ -f $srcdir/$_gitname/templates/$rcfile ]; then
			echo "source /usr/lib/zim/templates/$rcfile" >> "$srcdir/etc/zsh/$rcfile"
		fi
	done	
}

package() {
	mkdir -p $pkgdir/usr/lib/zim
	cp -r $srcdir/$_gitname/* $pkgdir/usr/lib/zim

	mkdir -p $pkgdir/etc
	cp -r $srcdir/etc/zsh $pkgdir/etc
}
