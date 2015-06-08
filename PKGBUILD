# $Id: PKGBUILD 128356 2015-02-27 12:53:19Z spupykin $
# Maintainer regnat <regnat+arch@regnat.ovh>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Original Maintainer:  TDY <tdy@gmx.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>


pkgname=tmux-true_colors
_pkgname=tmux
pkgver=1.9_a
pkgrel=2
pkgdesc='A terminal multiplexer - true colors patch'
url='http://tmux.sourceforge.net/'
provides=('tmux')
conflicts=('tmux')
arch=('i686' 'x86_64')
license=('BSD')
depends=('ncurses' 'libevent' 'libutempter')
source=(http://downloads.sourceforge.net/tmux/tmux-${pkgver/_/}.tar.gz
	LICENSE
	crash-fix.patch
        https://gist.githubusercontent.com/choppsv1/dd00858d4f7f356ce2cf/raw/b66c1726b7d38b9a43d0e199f5b874e5f9d08526/tmux-24.diff)
md5sums=('b07601711f96f1d260b390513b509a2d'
         '71601bc37fa44e4395580b321963018e'
         'd2e0ccb68edaccaf5ffd0e0c21d1776b'
         'ea781186f33c24ebf87e6a0d05c4f725')

prepare() {
	cd "$srcdir/$_pkgname-${pkgver/_/}"
	patch -p1 <$srcdir/crash-fix.patch
        patch -p1 <$srcdir/tmux-24.diff
}

build() {
	cd "$srcdir/$_pkgname-${pkgver/_/}"
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
