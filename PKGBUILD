# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=httpx
pkgname=python-httpx
pkgver=0.13.3
pkgrel=5
pkgdesc="A next generation HTTP client for Python"
arch=('any')
url="https://github.com/encode/${_pkgname}"
license=('BSD')
depends=('python-chardet' 'python-hstspreload' 'python-httpcore' 'python-idna' 'python-rfc3986' 'python-sniffio')
optdepends=('python-brotli: for brotli response decompression')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio' 'python-pytest-trio' 'python-brotli' 'python-trustme' 'uvicorn')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "0001-Do-not-override-the-system-SSL-certificates-with-the.patch")
sha512sums=('54cdee16e8253c221c3298817ccf63a4a0d6755a86feea2aa5a2efe9af44eb1eb0a578b21f593fe28fceace17b0a0badb52a66965c35bf456ea57dd3b905ebbe'
            '9affdf1c41fc9660b0374d2adae8115aa01e31fa13d396a682593ff24248bf4b70fa1266d01a95281fab760265292c0d97f329f71b00e723ad71ae809c4e6235')
b2sums=('d3a56c2386841909668e34eaa78d202f91ad900230b9d1d4254bfa08312312d020e081aea2839dbb57d85fa26ccfc3f093404801c4dd5c47051f3c9fd2746552'
        'b96027d611901e65f90969f796c244acb8605243e2fd23eb2ea946b895464e6e89a39c9886de479f8561a4d55154e2a80dc21f6f29c201a36f7ca429c6962f9f')

prepare() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    # do not run coverage in unittests!
    sed -i '/^addopts/d' setup.cfg

    # bad certifi
    patch -p1 -i ../0001-Do-not-override-the-system-SSL-certificates-with-the.patch
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
