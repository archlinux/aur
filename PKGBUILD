# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
_verbump=70bb58b8ce50e7fe3d797b794d0005cf09c77818
pkgver=2.2.12
pkgrel=1
pkgdesc="Python CLI and API for talking to Meshtastic devices"
arch=('any')
url="https://github.com/meshtastic/python/"

# https://github.com/meshtastic/python/issues/422
license=('GPL3' 'Apache')

makedepends=(python-build python-installer python-wheel)
depends=('python-protobuf' 'python-pypubsub' 'python-dotmap' 'python-pyqrcode' 'python-tabulate' 'python-timeago' 'python-pyyaml' 'python-pygatt>=4.0.5-3' 'python-setuptools' 'python-requests')
optdepends=('python-pytap2: TUN tunnel support')
source=("${pkgname}-${pkgver}::https://github.com/meshtastic/python/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/meshtastic/python/commit/${_verbump}.patch")
sha256sums=('fb5ceab19180b71eb169fc3de14378f165c42cc188c3e1ec47bd7ed45c097bd9'
            '90f5d888fff714dfcfc62574b4862b0f943db721c8343f2c9a6158197cf253d6')

prepare() {
    cd "$_name-$pkgver"

    # The tagged commits unfortuantely miss the version bump performed in the
    # release script, so we manually backport that change.
    patch -p1 < "${srcdir}"/${_verbump}.patch
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
