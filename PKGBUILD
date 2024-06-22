# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
_verbump=9ac5aeeaf0ab0fc5d21025465c29b808684c4c47
pkgver=2.3.11
pkgrel=1
pkgdesc="Python CLI and API for talking to Meshtastic devices"
arch=('any')
url="https://github.com/meshtastic/python/"

# https://github.com/meshtastic/python/issues/422
license=(GPL-3.0-only Apache-2.0)

makedepends=(python-build python-installer python-wheel)
depends=(python-bleak python-dotmap python-protobuf python-pexpect python-pypubsub python-pyqrcode python-pyserial python-pyyaml python-requests python-setuptools python-tabulate python-timeago)
optdepends=('python-pytap2: TUN tunnel support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/meshtastic/python/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/meshtastic/python/commit/${_verbump}.patch"
)
sha256sums=('3f8fad28480dd913cb473fb162f768a0701d789f6cc90812f66a264bdd16c49b'
            '25add067f2090e963ad76513536199d0bdca6cc46c28d18ff0ae8ef8cb0b8dc2')

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
