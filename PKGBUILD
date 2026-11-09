# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgbase=btrsync
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.3.1
pkgrel=1
pkgdesc="btrfs replication made easy"
arch=('any')
url="https://github.com/andreittr/btrsync"
license=('GPL-3.0-or-later')
depends=('python>=3.9')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-sphinx'
)
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}")
b2sums=('06a83f42e59bfcd86a44596a9e16a3d44aacd35586e3f42c9c91c1c5745acf6149b400017cb22368e3ff10e7af75aa4ae45de07d2f4e0b1639fb1bdb6741e686')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
    make doc
}

check() {
    cd $pkgname-$pkgver
    python -m unittest
}

package_btrsync() {
    cd $pkgbase-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

package_btrsync-docs() {
    pkgdesc="HTML Documentation for $pkgbase"
    depends=()
    provides=()

    cd $pkgbase-$pkgver/doc/build/html

    find . -! -type d -exec \
	 install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/html/{}" \;
}
