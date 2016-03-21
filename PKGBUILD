# $Id: PKGBUILD 163998 2016-03-01 16:55:48Z spupykin $
# Maintainer: Ray Song <i@maskray.me>

pkgname=tmux-fullwidth-backspace
pkgver=2.1
pkgrel=2
pkgdesc='A terminal multiplexer (patched with support for fullwidth backspace'
url='http://tmux.github.io/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('ncurses' 'libevent' 'libutempter')
source=(https://github.com/tmux/tmux/releases/download/$pkgver/tmux-$pkgver.tar.gz
	LICENSE fullwidth-backspace.patch)
provides=('tmux')
conflicts=('tmux')
md5sums=('74a2855695bccb51b6e301383ad4818c'
         '71601bc37fa44e4395580b321963018e'
         'b9ff3b7e4f214d13aaaea0629dae4689')

prepare() {
	patch -p1 < ../fullwidth-backspace.patch
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

	install -dm755 "$pkgdir/usr/share/tmux/" "$pkgdir/usr/share/vim/vimfiles/syntax/"
	install -m644 examples/* "$pkgdir/usr/share/tmux/"
	ln -s /usr/share/tmux/tmux.vim "$pkgdir/usr/share/vim/vimfiles/syntax/tmux.vim"

	install -d $pkgdir/usr/share/bash-completion/completions/
	mv $pkgdir/usr/share/tmux/bash_completion_tmux.sh $pkgdir/usr/share/bash-completion/completions/tmux
}
