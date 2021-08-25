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
    'python<3.12' 		# depend on distutils, deprecated in
				# 3.10, removed in 3.12. Ref:
				# https://www.python.org/dev/peps/pep-0632/
)
optdepends=(
    'python-pylint: pylint checker'
    'flake8: flake8 checker'
    'autopep8: pep8 checker'
    'python-pyflakes: pyflakes checker'
    'mypy: mypy checker'
    'bandit: bandit checker'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
       'fix-pychecker-executable-path.patch')
sha512sums=('74bf24f228167f7fafa4d3beacf7b7a226468029d8667b8b9a5fdb496cfb34587fc499a30b596c641b23adbb12ac1507be115eedc27b6b1e78a9c8609a3b33e4'
            '5f82a5eb963e8b66daa8bfab04e9619fd850e716fea63652a2fe8bc0382114c20b8421a8055518bce11f521fd5d40cad20885536b7f7c15d30b8d4ea65963200')
b2sums=('7fc54c35bf71a63bcb9640f1e46303c9e070c1eb66c0644edf7f9183ad5f546df82ef2038a57c6a041ac0aa0d78cef432364e6223e3c57f8aa1935631b2b5cab'
        '779ed5d117e408bb9b0cdf5df6347983d4a3abc424a95b0347ed1fb688edeb667b4462445523342aa6c67d032e3feb1d7734d4b60d92d6a388e77c00f13de9a6')

CD_DIR="$_pkgname-$pkgver"
prepare() {
    cd "$srcdir"
    # patch the files
    patch -p1 < "${source[1]}"
}

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

    # install executable file
    install -Dm0755 \
	    bin/pycheckers.py \
	    "$pkgdir/usr/bin/pycheckers"
    
    ## there are two files under /docs, a GIF and a PNG, won't install
    ## them here
    install -Dm0644 \
	    LICENSE README.md *-EXAMPLE \
	    -t "$pkgdir/usr/share/$pkgname/"
}
