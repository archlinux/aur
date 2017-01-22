# Contributor: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>

pkgrel=1
pkgver=r268.cc34e3f
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
            '957cf992cab05b884e0f4514e2ec4246c4c07fcb01a564cc92b57afe1109d41f')
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
	rsync -ar --exclude=.git $srcdir/$_gitname/ $pkgdir/usr/lib/zim

	mkdir -p $pkgdir/etc
	cp -r $srcdir/etc/zsh $pkgdir/etc
}
