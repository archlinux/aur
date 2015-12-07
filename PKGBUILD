# Maintainer: David Rodriguez <dissonant.tech@gmail.com>

pkgname=tmux-24bit-color
pkgver=2.1
pkgrel=1
pkgdesc='A terminal multiplexer, with patched true color support'
url='http://tmux.github.io/'
arch=('i686' 'x86_64')
license=('BSD')
conflicts=('tmux')
provides=('tmux')
depends=('ncurses' 'libevent' 'libutempter')
source=(https://github.com/tmux/tmux/releases/download/$pkgver/tmux-$pkgver.tar.gz
	ncurses6-xterm-standout.patch
    tmux-24bit.patch
	LICENSE)
md5sums=('74a2855695bccb51b6e301383ad4818c'
         '70347df93ed1922d6718d91491a7d9b4'
         '182026c71e164ce64cb7f82c3fc4c428'
         '71601bc37fa44e4395580b321963018e')

prepare() {
	cd "$srcdir/tmux-${pkgver/_/}"
	patch -Np1 -i ../tmux-24bit.patch
#	patch -Np1 -i ../ncurses6-xterm-standout.patch
}

build() {
	cd "$srcdir/tmux-${pkgver/_/}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/tmux-${pkgver/_/}"
	make install DESTDIR=$pkgdir
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/tmux/LICENSE"

	install -dm755 "$pkgdir/usr/share/tmux/"
	install -m644 examples/* "$pkgdir/usr/share/tmux/"
	install -Dm644 examples/tmux.vim "$pkgdir/usr/share/vim/vimfiles/syntax/tmux.vim"

	install -d $pkgdir/usr/share/bash-completion/completions/
	mv $pkgdir/usr/share/tmux/bash_completion_tmux.sh $pkgdir/usr/share/bash-completion/completions/tmux
}
