# Maintainer: Jason Khanlar <jason.khanlar@gmail.com>
pkgname=wofftools-git
pkgver=r138.964fe63
pkgrel=1
pkgdesc="A library for working with WOFF files."
arch=('any')
url="https://github.com/typesupply/woffTools"
license=('MIT')
depends=('python2-fonttools' 'python2-numpy')
makedepends=('git')
provides=("wofftools=${pkgver}")
conflicts=('wofftools')
source=('git://github.com/typesupply/woffTools.git')
md5sums=('SKIP')
prepare() {
    sed -i 's|^#!/usr/bin/env python|#!/usr/bin/python2|' woffTools/setup.py
    sed -i '5 i\from setuptools.command import bdist_egg, egg_info' woffTools/setup.py
}
build() {
    cd "woffTools"
    python2 setup.py build
    python2 setup.py bdist_egg
}
package() {
    cd "woffTools"
    install -Dm755 "woff-all" "$pkgdir/usr/bin/woff-all"
    install -Dm755 "woff-css" "$pkgdir/usr/bin/woff-css"
    install -Dm755 "woff-info" "$pkgdir/usr/bin/woff-info"
    install -Dm755 "woff-proof" "$pkgdir/usr/bin/woff-proof"
    install -Dm755 "woff-validate" "$pkgdir/usr/bin/woff-validate"
    sed -i 's|^#! \?/usr/bin/env python|#!/usr/bin/python2|' $pkgdir/usr/bin/woff-*

    mkdir -p "$pkgdir/usr/lib/python2.7/site-packages/woffTools/test"
    mkdir "$pkgdir/usr/lib/python2.7/site-packages/woffTools/tools"
    install -D Lib/woffTools/*.py "$pkgdir/usr/lib/python2.7/site-packages/woffTools"
    install -D Lib/woffTools/test/*.py "$pkgdir/usr/lib/python2.7/site-packages/woffTools/test"
    install -D Lib/woffTools/tools/*.py "$pkgdir/usr/lib/python2.7/site-packages/woffTools/tools"
    /usr/bin/python2 -m compileall "$pkgdir/usr/lib/python2.7/site-packages/woffTools"
    install -Dm644 Lib/woffTools.egg-info/PKG-INFO "$pkgdir/usr/lib/python2.7/site-packages/woffTools-0.1beta-py2.7.egg-info"
}
pkgver() {
    # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver()_function
    cd "woffTools"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}