# Maintainer: ResRipper <resripper at connective dot link>
# Contributor: Will Price <will.price94@gmail.com>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

# shellcheck shell=bash disable=SC2034,SC2148,SC2154,SC2164

pkgname=python-migen-git
epoch=1
pkgver=0.9.2.r118.g44e5627
pkgrel=1
pkgdesc="A Python toolbox for building complex digital hardware "
arch=(any)
url="https://git.m-labs.hk/M-Labs/migen"
license=('BSD')

makedepends=(
    'git'
    'python-build'
    'python-setuptools'
    'python-installer'
)
depends=('python-colorama')
checkdepends=('python-pytest')
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
replaces=('migen-git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/migen"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/migen"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/migen"
    PYTHONPATH=. python -m pytest
}

package() {
    cd "${srcdir}/migen"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
