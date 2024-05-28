# Contributor: Auerhuhn
# Maintainer: Strykar <strykar@hotmail.com>

_gitpkgname=RouterOS-api
pkgname="python-${_gitpkgname,,}"
pkgver=0.18.0
pkgrel=1
pkgdesc="Python API to Mikrotik RouterBoard devices"
arch=('any')
url="https://github.com/socialwifi/RouterOS-api"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/socialwifi/RouterOS-api/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6b014ec96b7d35d07112cbfc6ff9ed2e21f088a1085674e56eef3b3d1ac63931')

prepare() {
    cd "${_gitpkgname}-${pkgver}"
    sed -i "s/\(find_packages\)()/\1(exclude=['tests'])/" setup.py
    sed -i 's/\(re\.compile(b\)/\1r/' routeros_api/sentence.py
}

build() {
    cd "${_gitpkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_gitpkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
