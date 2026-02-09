# Maintainer: AlphaLynx <alphaLynx at alphalynx dot dev>

pkgname=python-borgstore
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=1
pkgdesc='A experimental key/value store implementation, supporting multiple backends'
arch=(any)
url="https://github.com/borgbackup/$_name"
license=(BSD-3-Clause)
depends=(python python-requests)
makedepends=(git python-build python-installer python-setuptools python-setuptools-scm)
checkdepends=(python-pytest)
optdepends=('python-boto3: S3 backend'
            'python-paramiko: sftp backend')
source=("git+$url.git#tag=$pkgver?signed")
validpgpkeys=('6D5BEF9ADD2075805747B70F9F88FB52FAF7B393') # Thomas Waldmann <tw@waldmann-edv.de>
b2sums=('73afcd7ebde48fcf25710cfdd04803c5e6e16f9c5c913ded8e9e33ad0d76db5fb4b6b268da367f349fd0487233d04ee01a2d0f587578ba766c0b981ed695b531')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 CHANGES.rst -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}
