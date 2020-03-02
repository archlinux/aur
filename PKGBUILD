# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
pkgname=walt-client
pkgver=4
pkgrel=1
pkgdesc="WalT control tool"
arch=(any)
url="https://walt-project.liglab.fr"
license=('BSD')
depends=(walt-common python2-commonmark python2-pygments)
source=("https://files.pythonhosted.org/packages/source/w/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "drop_bash_completion.patch"
        "LICENSE")
sha256sums=('42f122680702ca5a7679ff204effa48f4cea2a2663722829453e3998565399cb'
            'eb8d702bff8e5b26327ae3021a295aa273109eb0f953be51c8fe0be62768bc87'
            '49e4de7e7679bb97dd8bf5363c87da852ef1e00d8a1263d2fe4855d7b47fd401')

prepare() {
    cd "$pkgname-$pkgver"

    patch -p0 < "${srcdir}/drop_bash_completion.patch"

    # Force python2 in sheebang
    find . -name \*.py | xargs sed -i '1s|^#!/usr/bin/env python$|\02|'
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "$pkgname-$pkgver"
    python2 setup.py install --root "$pkgdir"
    # These files are already provided by walt-common
    rm "${pkgdir}/usr/lib/python2.7/site-packages/walt/__init__.py"*
}
