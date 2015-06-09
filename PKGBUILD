# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: Justin Wong <justin.w.xd[at]gmail[dot]com>

pkgname=tmux-truecolor
_pkgname=tmux
pkgver=2.0
pkgrel=1
pkgdesc='A terminal multiplexer, with true color support'
url='http://tmux.sourceforge.net/'
arch=('i686' 'x86_64')
license=('BSD')
conflicts=('tmux')
provides=('tmux')
depends=('ncurses' 'libevent' 'libutempter')
source=(https://github.com/tmux/tmux/releases/download/${pkgver}/tmux-${pkgver}.tar.gz
	LICENSE
	tmux-24.diff
	)

md5sums=('9fb6b443392c3978da5d599f1e814eaa'
	 '71601bc37fa44e4395580b321963018e'
	 '8283636f62fbefa1bd3ce41a8ea6e426')

build() {
	cd "$srcdir/$_pkgname-${pkgver/_/}"
	patch -p1 < ../tmux-24.diff
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname-${pkgver/_/}"
	make install DESTDIR=$pkgdir
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/tmux/LICENSE"

	install -dm755 "$pkgdir/usr/share/tmux/"
	install -m644 examples/* "$pkgdir/usr/share/tmux/"
	install -Dm644 examples/tmux.vim "$pkgdir/usr/share/vim/vimfiles/syntax/tmux.vim"

	install -d $pkgdir/usr/share/bash-completion/completions/
	mv $pkgdir/usr/share/tmux/bash_completion_tmux.sh $pkgdir/usr/share/bash-completion/completions/tmux
}
