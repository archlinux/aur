# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=weechat-matrix
pkgver=0.3.0
pkgrel=18
pkgdesc='WeeChat Matrix protocol script written in Python'
arch=('any')
url='https://github.com/poljar/weechat-matrix'
license=('ISC')
depends=(
    'python'
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
    'weechat'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
)
checkdepends=(
    'python-hypothesis'
    'python-pytest'
)
optdepends=(
    'python-aiohttp: matrix_sso_helper support'
    'python-magic: matrix_upload support'
    'python-requests: matrix_decrypt and matrix_upload support'
    'xdg-utils: default plumber for matrix_decrypt'
)
install='weechat-matrix.install'
source=(
    "$pkgname-$pkgver.tar.gz::https://api.github.com/repos/poljar/$pkgname/tarball/refs/tags/$pkgver"
    "0001-Switch-to-correct-build-system-definition.patch"
    "0002-Fix-compatibility-with-matrix-nio-0.21.patch"
    "0003-server-remove-set_npn_protocols.patch"
    "0004-fix-tests-module-webcolors-has-no-attribute-HTML4_HE.patch"
    "0005-pyproject.toml-only-require-future-for-python-3.2.patch"
    "0006-Drop-python-future-as-all-dependent-py-vers-are-EOL.patch"
)
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('fd4252ed0601d6daf22177bb5e3a3958ddad34191d05ec24cae074c16112c27e3825654f4ab3045c2676de465e409cbd6b1f7dac1957c57149ee5a7ee4e8c82c'
        'e3a713a111505564d1ff7c34645b35a3f3aea2dde9bfac430beb4b28e60fc5557a40d4feafa28db3da7d66f55468570131b439256d8625dc98545dd15af7d7b9'
        'c44468b5ef4f1a399d5d8b1c5e33809eb0bf8e5fdea17fd1ff3432c39ed557c2f73a557cd91bd0f552b48bd2a8244883905b1746e6d03dfd66545ee7cbb5f2c4'
        '8df9cb35e43218b00a1c3e936b8dcc526c9b4bbc7c58c14ee2998b1e0365f3463946183fedd1abc2d5297cfd3903f38b469bf3d2e541f376d4b7dca5d10ac3d3'
        '71070625d3687500b5b7a624a85936f30192d4a6afb69c82e02168f35c6f5bdc81afeecb62231432c8bd345bd9912246e1e9d18d1c2d115e21c433efc2e0e8ec'
        'a5bfdca7cfc740f2c9ddd1f62c758ac4a409360b782a1cbc62535079b317f36c43b88369c2cda7f3fc4bea6e08f3c0c19894e270d2be3520525c2ffca8071036'
        '5bc3c8849f986011d5b04100e2804296a46a13883dbd9576d8dd14fd7712e5c0a575de518126b04df8e66a72d01eb49529a9b991c32f6dd61ae674057d450543')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
    cd "$pkgname-$pkgver" || exit
    patch --forward --strip 1 --input ../0001-Switch-to-correct-build-system-definition.patch
    patch --forward --strip 1 --input ../0002-Fix-compatibility-with-matrix-nio-0.21.patch
    patch --forward --strip 1 --input ../0003-server-remove-set_npn_protocols.patch
    patch --forward --strip 1 --input ../0004-fix-tests-module-webcolors-has-no-attribute-HTML4_HE.patch
    patch --forward --strip 1 --input ../0005-pyproject.toml-only-require-future-for-python-3.2.patch
    patch --forward --strip 1 --input ../0006-Drop-python-future-as-all-dependent-py-vers-are-EOL.patch
}

build() {
    cd "$pkgname-$pkgver" || exit
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver" || exit
    python -m pytest
}

package() {
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm755 main.py "$pkgdir/usr/share/weechat/python/weechat-matrix.py"
    install -Dm755 contrib/matrix_upload.py "$pkgdir/usr/bin/matrix_upload.py"
    install -Dm755 contrib/matrix_decrypt.py "$pkgdir/usr/bin/matrix_decrypt.py"
    install -Dm755 contrib/matrix_sso_helper.py "$pkgdir/usr/bin/matrix_sso_helper.py"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
