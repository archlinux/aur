# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=weechat-matrix
pkgver=0.3.0
pkgrel=13
pkgdesc='WeeChat Matrix protocol script written in Python'
arch=('any')
url='https://github.com/poljar/weechat-matrix'
license=('ISC')
depends=('python'
         'python-pyopenssl'
         'python-webcolors'
         'python-atomicwrites'
         'python-attrs'
         'python-logbook'
         'python-pygments'
         'python-matrix-nio'
         'python-cachetools'
         'python-olm'
         'python-peewee'
         'weechat')
makedepends=('python-build'
             'python-installer'
             'python-poetry-core')
checkdepends=('python-hypothesis'
              'python-pytest')
optdepends=('python-aiohttp: matrix_sso_helper support'
            'python-magic: matrix_upload support'
            'python-requests: matrix_decrypt and matrix_upload support'
            'xdg-utils: default plumber for matrix_decrypt')
install='weechat-matrix.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/poljar/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "0001-Switch-to-correct-build-system-definition.patch"
        "0002-Fix-compatibility-with-matrix-nio-0.21.patch"
        "0003-server-remove-set_npn_protocols.patch")
b2sums=('c77bb12c582ba0362531417a3f606a967e968b07e4306880b3904def93b71927da0361825e0b4ff951f2082820527295766357bea403959500da282047461960'
        'e3a713a111505564d1ff7c34645b35a3f3aea2dde9bfac430beb4b28e60fc5557a40d4feafa28db3da7d66f55468570131b439256d8625dc98545dd15af7d7b9'
        'c44468b5ef4f1a399d5d8b1c5e33809eb0bf8e5fdea17fd1ff3432c39ed557c2f73a557cd91bd0f552b48bd2a8244883905b1746e6d03dfd66545ee7cbb5f2c4'
        '85e20eb6a03815e52ec694f3fb2d1ebdb69df80d3546de4082271fd3969b2faffd7043a53d657d3d31830fcf796cf7519ae177a6f35103ed9cf03ca8ab92a362')

prepare() {
    cd "$pkgname-$pkgver"
    sed -ri 's|#!/usr/bin/env( -S)? python3|#!/usr/bin/python3|' contrib/*.py
    # Remove unnecessary dependency version pinning
    sed -i 's/= "^[0-9.]*"/= "*"/' pyproject.toml
    # fix PEP517 build-system definition: https://github.com/poljar/weechat-matrix/pull/340/files
    patch -Np1 -i ../0001-Switch-to-correct-build-system-definition.patch
    # update python-matrix-nio (0.20.1-1 -> 0.23.0-1) broke the plugin
    patch -Np1 -i ../0002-Fix-compatibility-with-matrix-nio-0.21.patch
    # SSLContext.set_npn_protocols broken in Python 3.10 (https://github.com/poljar/weechat-matrix/issues/308)
    patch -Np1 -i ../0003-server-remove-set_npn_protocols.patch
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    cd "$pkgname-$pkgver"
    python -m pytest
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm755 main.py "$pkgdir/usr/share/weechat/python/weechat-matrix.py"
    install -Dm755 contrib/matrix_upload.py "$pkgdir/usr/bin/matrix_upload.py"
    install -Dm755 contrib/matrix_decrypt.py "$pkgdir/usr/bin/matrix_decrypt.py"
    install -Dm755 contrib/matrix_sso_helper.py "$pkgdir/usr/bin/matrix_sso_helper.py"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
