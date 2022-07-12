# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

_name=docutils
pkgname=python-docutils1
pkgver=0.18.1
pkgrel=1
epoch=1
pkgdesc='Set of tools for processing plaintext docs into formats such as HTML, XML, or LaTeX'
arch=('any')
url='http://docutils.sourceforge.net'
license=('custom')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-docutils')
provides=("python-docutils=${pkgver}")
source=("https://downloads.sourceforge.net/$_name/$_name-$pkgver.tar.gz")
sha512sums=('44404a6cc9d4c1e79c73a6ffee2898e459c9925ab9661e5d41394e13b3d861334cf0c5efcd18e87eb03041374e326cfd00539a6b2ec5979678889e8a536c9542')

build() {
    cd $_name-$pkgver
    python setup.py build
}

check() {
    cd $_name-$pkgver
    # we need utf locale to valid utf8 tests
    export LANG=en_US.UTF-8
    PYTHONPATH="$PWD/build/python/" python test/alltests.py
}

package() {
    cd $_name-$pkgver
    python setup.py build install --root="$pkgdir" --optimize=1
    # symlink without .py
    for f in "$pkgdir"/usr/bin/*.py; do
        ln -s "$(basename $f)" "$pkgdir/usr/bin/$(basename $f .py)"
    done
    # setup license
    install -D -m644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
    install -D -m644 licenses/python* "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=4 sw=4 et:
