# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Grigorios Bouzakis <grbzks[at]gmail[dot]com>
# Contributor: Justin Wong <justin.w.xd[at]gmail[dot]com>

pkgname=tmux-truecolor-git
_pkgname=tmux
_branch=master
pkgver=2.1_284_gca29dc9
pkgrel=1
pkgdesc='A terminal multiplexer, with true color support'
url='http://tmux.github.io/'
arch=('i686' 'x86_64')
license=('BSD')
conflicts=('tmux' 'tmux-truecolor' 'tmux-24bit-color' 'tmux-true_colors')
provides=('tmux')
depends=('ncurses' 'libevent' 'libutempter')
source=("git://github.com/tmux/${_pkgname}.git#branch=$_branch"
	'LICENSE'
	'tmux-24.patch::https://github.com/tmux/tmux/pull/112.patch'
	)
sha256sums=('SKIP'
            'b5de80619e4884ced2dfe0a96020e85dcfb715a831ecdfdd7ce8c97b5a6ff2cc'
            'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/-/_/g'
}

build() {
    cd "${srcdir}/${_pkgname}"
	patch -p1 < "${srcdir}/tmux-24.patch"
    sh autogen.sh
	./configure --prefix=/usr
	make
}

package() {
    cd "${srcdir}/${_pkgname}"
	make install DESTDIR=$pkgdir
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/tmux/LICENSE"

	install -dm755 "$pkgdir/usr/share/tmux/"
	install -m644 examples/* "$pkgdir/usr/share/tmux/"

	install -d $pkgdir/usr/share/bash-completion/completions/
	install -m644 $pkgdir/usr/share/tmux/bash_completion_tmux.sh $pkgdir/usr/share/bash-completion/completions/tmux
}
