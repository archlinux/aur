# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
pkgver=2.0.12
pkgrel=1
pkgdesc="Python CLI and API for talking to Meshtastic devices"
arch=('any')
url="https://github.com/meshtastic/python/"

# https://github.com/meshtastic/python/issues/422
license=('GPL3')

depends=('python-protobuf' 'python-pypubsub' 'python-dotmap' 'python-pyqrcode' 'python-tabulate' 'python-timeago' 'python-pyyaml' 'python-pygatt' 'python-setuptools' 'python-enum-compat')
optdepends=('python-pytap2: TUN tunnel support')
source=("https://github.com/meshtastic/python/archive/refs/tags/${pkgver}.tar.gz"
        "version_bump.patch::https://github.com/meshtastic/python/commit/19b4cd65ce8822bd236d2959ab61e1269df137fe.patch")
sha256sums=('0012c60c7915411515bb69c6c43ccf0f185929f61d7487b2558ab1e3de9b1a0e'
            '2085eeafa827ec287a5cc1eb6f98c00bef01b77f5ad8109eb1dfb7e9776f3a7c')

prepare() {
    cd "$_name-$pkgver"

    # The tagged commits unfortuantely miss the version bump performed in the
    # release script, so we manually backport that change.
    patch -p1 < "${srcdir}"/version_bump.patch
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
