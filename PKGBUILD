# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: Nicolas Pouillard [https://nicolaspouillard.fr]
# Contributor: seschwar -- contact via Arch Linux forum or AUR
# Maintainer: Ian Denhardt <ian@zenhack.net>

pkgname=alot
pkgver=0.7
pkgrel=1
pkgdesc="terminal-based MUA for the notmuch mail system"
arch=(any)
url="https://github.com/pazz/alot"
license=(GPL)
depends=(notmuch
         python2-gpg
         python2-magic
         python2-configobj
         python2-urwid
         python2-urwidtrees
         python2-twisted)
makedepends=(python2-sphinx)
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://github.com/pazz/$pkgname/archive/$pkgver.tar.gz)

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # The archlinux package python2-magic's egg calls itself "file-magic",
    # as opposed to the python-magic on pypi. The result is that the alot
    # executable can't find the module, so we patch setup.py to fix the
    # dependency:
    sed -i -e 's/python-magic/file-magic/' setup.py

    python2 setup.py build

    # The makefile is not actually concurrency-safe; the different calls to
    # sphinx will trample on each other if we try to parallelize the build.
    # So we pass --jobs=1.
    make SPHINXBUILD=sphinx-build2 --jobs=1 -C docs man html
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --optimize=1 --root="$pkgdir"
    install -Dm644 extra/completion/alot-completion.zsh \
        "$pkgdir/usr/share/zsh/functions/_alot"
    install -dm755 "$pkgdir/usr/share/alot/themes/examples"
    install -Dm644 extra/themes/{mutt,solarized_light,solarized_dark,sup,tomorrow} \
        "${pkgdir}/usr/share/alot/themes/examples"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -a docs/build/html/* "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 docs/build/man/alot.1 "$pkgdir/usr/share/man/man1/alot.1"
    install -Dm644 extra/alot.desktop "$pkgdir/usr/share/applications/alot.desktop"
}
sha256sums=('2d49a7d61241cfadc993a8456076605b2cfe264c51f5e3f18f337bad58f29a1c')
