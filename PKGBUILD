# Contributor: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>

pkgrel=1
pkgver=r123.bf10ce7
pkgname=zsh-zim-git
pkgdesc="ZIM - Zsh IMproved"
url="https://github.com/Eriner/zim"
arch=('any')
license=('MIT')
depends=('zsh')
makedepends=('git' 'coreutils' 'sed')
optdepends=('otf-powerline-symbols-git: for some prompts')
source=('git://github.com/Eriner/zim.git' 'zim.install')
options=('!strip')
install='zim.install'
md5sums=('SKIP'
         '399786df4dc2c06abd0a0dbd6c57e5ae')
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
