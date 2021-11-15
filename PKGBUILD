# Maintainer: Lukas Werling <lukas@lwrl.de>
pkgname=txr
pkgver=272
pkgrel=1
pkgdesc="A data munging language."
arch=('i686' 'x86_64')
url="http://nongnu.org/txr/"
license=('BSD')
depends=('libffi')
makedepends=()
source=(
	"http://www.kylheku.com/cgit/txr/snapshot/txr-${pkgver}.tar.bz2"
	"ftdetect.vim"
)
sha256sums=('86e9bdc590c4882ae365e3425f920bbb23440c5395023990bc0f534fee92b0f5'
            'b884b3d595bcc45514d4a200ad11017d54506bcb9952497c5feaa2cf87871113')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	# Tests have to run sequentially.
	make -j1 tests
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	# txr installs licenses to /usr/share/txr. Add symlinks from Arch's
	# usual license directory.
	mkdir -p "$pkgdir/usr/share/licenses/txr"
	ln -s -t "$pkgdir/usr/share/licenses/txr" ../../txr/LICENSE ../../txr/METALICENSE
	# install vim syntax files
	install -m644 -D -t "$pkgdir/usr/share/vim/vimfiles/syntax" txr.vim tl.vim
	install -m644 -D ../ftdetect.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/txr.vim"
}
