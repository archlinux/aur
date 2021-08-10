# Maintainer: Ruijie Yu <ruijie.yu@outlook.com>

pkgname=emacs-pyim-basedict
_pkgname=pyim-basedict
pkgver=0.5.0
pkgrel=1
pkgdesc='The default pyim dict.'
url='https://github.com/tumashu/pyim-basedict'
license=(GPL)
arch=(any)
depends=(
    emacs
    emacs-pyim
)
# release commit hash
GIT_HASH='7495c974ada99f9fed96d8e85d8b97dabce9532c'
source=("$pkgname-pkgver.tar.gz::$url/archive/$GIT_HASH.tar.gz")

sha512sums=('297adb1eebbfa11e31f499815bbfa765b6f3cc1f250669b74a80f368f9c08b44d614a3c5dc1f47d8ba296db7ce4ff9e813331d20bd56ccc5136f456d858a1ca5')
b2sums=('f7d94f5f05dcef8cb9437273afb1919ff5dc5413ac3a787b86974e03b02d897abdfa8cab921e6e8c89b92f3f05f1933acc7326d269a5c499b0caa584dad76497')

CD_DIR="$_pkgname-$GIT_HASH"
build() {
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
    cd "$srcdir/$CD_DIR"
    # also need the pyim file somewhere, put it in emacs site-lisp for
    # now. Maybe patch the code to move the pyim file elsewhere?
    install -Dm0644 \
	    *.el{,c} \
	    *.pyim \
	    -t "$pkgdir/usr/share/emacs/site-lisp/"
    # doc files
    install -Dm0644 \
	    COPYING README.md \
	    -t "$pkgdir/usr/share/$pkgname/"
}
