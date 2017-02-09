# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: Nicolas Pouillard [https://nicolaspouillard.fr]
# Contributor: seschwar -- contact via Arch Linux forum or AUR
# Maintainer: Ian Denhardt <ian@zenhack.net>

pkgname=alot
pkgver=0.5.1
pkgrel=2
pkgdesc="terminal-based MUA for the notmuch mail system"
arch=(any)
url="https://github.com/pazz/alot"
license=(GPL)
depends=(notmuch
         python2-pygpgme
         python2-magic
         python2-configobj
         python2-urwid
         python2-urwidtrees
         python2-twisted)
makedepends=(python2-sphinx)
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/pazz/$pkgname/archive/$pkgver.tar.gz
	fix-test-packaging.patch)

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # The archlinux package python2-magic's egg calls itself "file-magic",
    # as opposed to the python-magic on pypi. The result is that the alot
    # executable can't find the module, so we patch setup.py to fix the
    # dependency:
    sed -i -e 's/python-magic/file-magic/' setup.py

    # Without this, the tests get picked up as part of the final package;
    # see https://github.com/pazz/alot/pull/1030
    patch -p1 < ../fix-test-packaging.patch

    python2 setup.py build
    make SPHINXBUILD=sphinx-build2 -C docs man html
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --optimize=1 --root="$pkgdir"
    install -Dm644 extra/completion/alot-completion.zsh \
        "$pkgdir/usr/share/zsh/functions/_alot"
    install -dm755 "$pkgdir/usr/share/alot/themes/examples"
    install -Dm644 extra/themes/{mutt,solarized,solarized_dark,sup,tomorrow} \
        "${pkgdir}/usr/share/alot/themes/examples"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -a docs/build/html/* "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 docs/build/man/alot.1 "$pkgdir/usr/share/man/man1/alot.1"
}
md5sums=('6669fa612518f807827ddeee5ed7f0e3'
         'f9404378ac53423e7eb965ddbec956a4')
