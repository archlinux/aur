# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-matrix-nio
pkgver=0.25.2
pkgrel=7
pkgdesc="Python Matrix client library, designed according to sans I/O principles"
arch=("any")
url="https://github.com/matrix-nio/matrix-nio"
license=("ISC")
depends=(
    'python'
    'python-aiohttp'
    'python-aiofiles'
    'python-h11'
    'python-h2'
    'python-jsonschema'
    'python-unpaddedbase64'
    'python-pycryptodome'
    'python-aiohttp-socks'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-sphinx'
    'python-setuptools'
    'python-wheel'
    'python-poetry-core'
    'git'
)
checkdepends=(
    'python-aioresponses'
    'python-hpack'
    'python-hyperframe'
    'python-hypothesis'
    'python-faker'
    'mypy'
    'python-mypy_extensions'
    'pre-commit'
    'python-pytest'
    'python-pytest-asyncio'
    'python-pytest-aiohttp'
    'python-pytest-benchmark'
    'python-pytest-cov'
    'python-atomicwrites'
    'python-cachetools'
    'python-peewee'
    'python-olm'
)
optdepends=(
    'python-atomicwrites: end-to-end encryption support'
    'python-cachetools: end-to-end encryption support'
    'python-peewee: end-to-end encryption support'
    'python-olm: end-to-end encryption support'
)
source=(
    "$pkgname::git+$url.git#tag=$pkgver"
    "0001-Fix-get_openid_token-the-endpoint-needs-an-empty-jso.patch"
    "0002-Add-unread_thread_notifications-to-SyncResponse-540.patch"
    "0003-Fix-print-for-FileResponse-when-download-is-saved-to.patch"
    "0004-Port-to-new-pytest-asyncio.patch"
    "0005-fix-tests-Temporary-disable-ssl-verification.patch"
)
b2sums=('1b89406dbfc81c7b27fb4d651e48b1699c95ddc5993da65c364cf307b63b606c6cb7ebbc31fc7d8e7ca48f8299acd244eb767b4bcd4821e1c68ea43e9a89a8f8'
        'c0f93ab6f14d779f411b2b15b80f675c2cc1aefcad78016fc3ed864bedddff2fb7d652726563741e28e97030a5ae573b03826444b9aacfab7c185fe0de687c0c'
        'e4bda35c261d79e4ea8eb6bc856969f0c59fa88a4f7b700cf94f871daf11fb6a04a29c97be2dd6f1cae1dc89b100f01679092e713ae01e9074ad8eedf3d0b7fb'
        '9f3f7b55ffe5460a47e33d77910a72add63489bb4937ca9857f909995e6e1002a8c58d119873679e5804f43f1fee6036913f2f07f1a30fd033d25875e3217c9d'
        '9786322aa90ecd4c92735626ae5976ffb1dd5e775c866d0800563a506e34cd967f3c1e3136fd5942f57621e9b9398687ea37e5a7ca4deb4b596b37fb93cf4657'
        '721e4f6f08e2151c2537623f94b8594ca90a6b92bbd58e5d8950e6d5aa0db9f6b481a7385fc6c237b88b57db34b73086bdf667ac9b551c208042300c5ebceccf')

prepare() {
    cd "$pkgname"
    patch --forward --strip 1 --input ../0001-Fix-get_openid_token-the-endpoint-needs-an-empty-jso.patch
    patch --forward --strip 1 --input ../0002-Add-unread_thread_notifications-to-SyncResponse-540.patch
    patch --forward --strip 1 --input ../0003-Fix-print-for-FileResponse-when-download-is-saved-to.patch
    patch --forward --strip 1 --input ../0004-Port-to-new-pytest-asyncio.patch
    patch --forward --strip 1 --input ../0005-fix-tests-Temporary-disable-ssl-verification.patch
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    PYTHONPATH="$PWD/src" pytest --benchmark-disable
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 README.md -t "$pkgdir/usr/share/$pkgname/"
    install -vDm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
