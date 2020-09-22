# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=httpcore
pkgname=python-httpcore
pkgver=0.10.2
pkgrel=1
pkgdesc="A minimal HTTP client"
arch=('any')
url="https://github.com/encode/${_pkgname}"
license=('BSD')
depends=('python-h11' 'python-sniffio')
optdepends=('python-h2: for HTTP/2 support')
makedepends=('python-setuptools' 'python-h2')
checkdepends=('python-pytest-asyncio' 'python-pytest-trio' 'python-trustme' 'uvicorn' 'mitmproxy')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('714ae548d194f5eb71447d13669b32ae9b37deee5791e0e171e04c721eb99f21c55996cc06cf82f115d9e11d806c1d6c0b54fe61922bb419d90c94cd93e374ce')
b2sums=('ad5615b6a45dc5cd1a0128a6a6a48b0b29a4f56b753869c55018913a9047d712a028ed74a8fa2fcee36cc851f1c0f85a9f4ddf7c7aa1f5e3b28b09761c511aea')

prepare() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    # do not run coverage in unittests!
    sed -i '/^addopts/d' setup.cfg
}

build() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py build
}

check() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python -m pytest
}

package() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
