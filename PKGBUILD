# Maintainer: Ruijie Yu <ruijie.yu@outlook.com>

pkgname=emacs-flycheck-pycheckers
_pkgname=flycheck-pycheckers
pkgver=0.15
pkgrel=1
pkgdesc='Multiple syntax checker for Python in Emacs, using Flycheck.'
url='https://github.com/msherry/flycheck-pycheckers'
license=(GPL)
arch=(any)
depends=(
    emacs
    flycheck
)
optdepends=(
    'python-pylint: pylint checker'
    'flake8: flake8 checker'
    'autopep8: pep8 checker'
    'python-pyflakes: pyflakes checker'
    'mypy: mypy checker'
    'bandit: bandit checker'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('74bf24f228167f7fafa4d3beacf7b7a226468029d8667b8b9a5fdb496cfb34587fc499a30b596c641b23adbb12ac1507be115eedc27b6b1e78a9c8609a3b33e4')
b2sums=('7fc54c35bf71a63bcb9640f1e46303c9e070c1eb66c0644edf7f9183ad5f546df82ef2038a57c6a041ac0aa0d78cef432364e6223e3c57f8aa1935631b2b5cab')

CD_DIR="$_pkgname-$pkgver"
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

    ## there are two files under /docs, a GIF and a PNG, won't install
    ## them here
    install -Dm0644 \
	    LICENSE README.md *-EXAMPLE \
	    -t "$pkgdir/usr/share/$pkgname/"
}
