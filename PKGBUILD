# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
_verbump=70069323fce7ccb6b0ce7b3715bbab03b9f5f10f
pkgver=2.2.19
pkgrel=1
pkgdesc="Python CLI and API for talking to Meshtastic devices"
arch=('any')
url="https://github.com/meshtastic/python/"

# https://github.com/meshtastic/python/issues/422
license=('GPL3' 'Apache')

makedepends=(python-build python-installer python-wheel)
depends=(python-bleak python-dotmap python-protobuf python-pexpect python-pypubsub python-pyqrcode python-pyserial python-pyyaml python-requests python-setuptools python-tabulate python-timeago)
optdepends=('python-pytap2: TUN tunnel support')
source=("${pkgname}-${pkgver}::https://github.com/meshtastic/python/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/meshtastic/python/commit/${_verbump}.patch")
sha256sums=('d3cabc39c8a67c7f5277599ec905693c2d014073a6afe3775902697d9d9df91b'
            '44d94db399e355907a4216f50ef6ebee30afd2750b6a626672900573e52f918e')

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
