# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=DPYProxy
pkgname=dpyproxy
pkgver=2.0.0
pkgrel=1
pkgdesc='Python Proxy that implements DPI evasion mechanisms '
arch=('any')
url='https://github.com/UPB-SysSec/DPYProxy'
license=('Apache-2.0')

# https://github.com/UPB-SysSec/DPYProxy/blob/master/pyproject.toml
depends=(
        'python-aioquic'
        'python-anyio'
        'python-cryptography'
        'python-dnspython'
        'python-h2'
        'python-httpx'
        'python-service-identity'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
provides=('python-dpyproxy')
replaces=('python-dpyproxy')
conflicts=('python-dpyproxy')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"https://raw.githubusercontent.com/aminvakil/DPYProxy/refs/heads/initial_pyproject/pyproject.toml"
	"https://raw.githubusercontent.com/aminvakil/DPYProxy/refs/heads/initial_pyproject/dpyproxy/__init__.py")
sha256sums=('ff92cc1efd2b354da4a21207abbe42733153c008d06d63e06a26c19fc914a6d0'
            '954b699932e0e42b62a2ab48459b1be33c3e8b3286956f2ba2f6d690948eebd1'
            'd4f9373c216046562cba97729845209728921797e2f74b13b1f777488522c406')

prepare() {
        cd ${_pkgname}-${pkgver}
	cp ../pyproject.toml .
	mkdir -p dpyproxy
	cp ../__init__.py dpyproxy/
}

# Document: https://wiki.archlinux.org/title/Python_package_guidelines
build() {
        cd ${_pkgname}-${pkgver}
        python -m build --wheel --no-isolation
}

package() {
        cd ${_pkgname}-${pkgver}
        python -m installer --destdir="$pkgdir" dist/*.whl
        install -vDm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

