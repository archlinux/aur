# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
_verbump=236d30f7c1e20a11eb85c27a89d96abdd8d42fc2
pkgver=2.2.10
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
sha256sums=('e865c6599ee0161efa476d218a941ebd753e093fe8505571c041e45e7d39bd04'
            '8945002de32b1d00305cc9be2826c1db51b6b4fd6b0e53aee61187e057a794fe')

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
