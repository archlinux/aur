# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-cloudpathlib
_pkg="${pkgname#python-}"
pkgver=0.25.0
pkgrel=1
pkgdesc="Python pathlib-style classes for cloud storage services such as Amazon S3, Azure Blob Storage, and Google Cloud Storage."
url="https://github.com/drivendataorg/cloudpathlib"
depends=(python-{typing_extensions,pydantic-core,importlib-metadata})
optdepends=(python-{google-auth,boto3})
makedepends=(python-{build,installer,setuptools,wheel,flit-core})
license=("MIT")
arch=(any)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "flit-core.patch"
)
sha256sums=(
    "d1541fca967b2481cc79bc7f284829e05fbadfc643ae3057474f0130a4d71aec"
    "5c550bde1b1000db1d41b217b7b6d42587bb929d38d49fd419d057d20f70a328"
)

prepare() {
    patch -d ${_pkg}-${pkgver} -Np1 -i ../flit-core.patch
}

build() {
    cd ${_pkg}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkg}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
