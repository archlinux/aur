# Maintainer: Ruijie Yu <ruijie.yu@outlook.com>

pkgname=emacs-pyim
_pkgname=pyim
pkgver=3.8.2
pkgrel=1
pkgdesc='A Chinese input method in emacs supporting quanpin, shuangpin, wubi, cangjie, and rime.'
url='https://github.com/tumashu/pyim'
license=(GPL)
arch=(any)
optdepends=(
    'emacs-pyim-basedict: pinyin dictionary'
    'emacs-pyim-wubidict: wubi dictionary'
)
depends=(
    emacs
    emacs-async			# this is required because the code
				# always uses its functions, despite
				# being marked as optional in code
)
# git hash for release 3.8.2
GIT_HASH='3c13e24bc8703ee0854fcad1756b2b7b1827cda5'
source=("$pkgname-$pkgver.tar.gz::$url/archive/$GIT_HASH.tar.gz")
sha512sums=('4481a5fb53be65d72750ba6848d73b46abdaaa88cfddc1fb7d8ac01888ef9b231f409a2a61934c6e7f09986611f194b6b567eb3856f41716ad26fcd7ba07e5af')
b2sums=('ea2ae55fc997ac80c7c750563a64b8536c4b1d2a19a1bd8c3d9fe4969560bc623e31144b29cecb2464918f2b0665cab772c8f2481cb63bd22242f1f85fe7a58b')

CD_DIR="$_pkgname-$GIT_HASH"
build() {
    # byte-compile all *.el files
    cd "$srcdir/$CD_DIR"
    # ref: gentoo repo at /eclass/elisp-common.eclass
    EMACSFLAGS=(-batch -q --no-site-file)
    EMACSCOMPFLAGS=(-L .)
    emacs "${EMACSFLAGS[@]}" \
    	  "${EMACSCOMPFLAGS[@]}" \
	  -f batch-byte-compile \
	  *.el
}

package() {
    # install all *.el and *.elc files
    cd "$srcdir/$CD_DIR"
    install -Dm0644 \
    	    *.el{,c} \
	    -t "$pkgdir/usr/share/emacs/site-lisp/"
    # doc files
    install -Dm0644 \
	    *.org \
	    -t "$pkgdir/usr/share/$pkgname/"
}
