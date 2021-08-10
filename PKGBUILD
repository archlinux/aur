# Maintainer: Ruijie Yu <ruijie.yu@outlook.com>

pkgname=emacs-xr
_pkgname=xr
pkgver=1.21
pkgrel=1
pkgdesc='Inverse of rx: convert Emacs string regexps to rx form'
url='https://github.com/mattiase/xr'
license=(GPL)
arch=(any)
depends=(emacs)
# no release tag, extract hash from git commit
GIT_HASH='2889b88cab47109f8ddadf1d2c67cac6a46c9420'
source=("$pkgname-$pkgver.tar.gz::$url/archive/$GIT_HASH.tar.gz")
sha512sums=('d679f1fb67fbe164db0ff1b2327cef7272d364d38f36bf07c8cb5ef0d8529864bc243468f0db272df637fae72aae86cddc75dc2e1964daa233d270a6324dc571')
b2sums=('2eec47e3d1c8e7f512030f784a2f9e7ecb70c2b20187a95ad524a19242ea36c628f5106c2d31a85d978df1d9827122b59f165c42c058ef3f1ef0db2fc89df5ef')

CD_DIR="$_pkgname-$GIT_HASH"
build() {
    cd "$srcdir/$CD_DIR"
    EMACSFLAGS=(-batch -q --no-site-file)
    EMACSCOMPFLAGS=(-L .)
    emacs "${EMACSFLAGS[@]}" \
	  "${EMACSCOMPFLAGS[@]}" \
	  -f batch-byte-compile \
	  *.el
}

check() {
    # not sure how to "check", but I will remove the check files here
    # future-proof: check() should require emacs package 'ert'
    cd "$srcdir/$CD_DIR"
    rm *-test.el{,c}
}

package() {
    cd "$srcdir/$CD_DIR"
    # install elisp files
    install -Dm0644 \
	    *.el{,c} \
	    -t "$pkgdir/usr/share/emacs/site-lisp/"
    # install doc files
    install -Dm0644 \
	    README \
	    -t "$pkgdir/usr/share/emacs-xr/"
}
