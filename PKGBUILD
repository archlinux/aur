# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
_verbump=fa1a3d7901c9148779bef0f9161daa5a66b8f78a
pkgver=2.3.9
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
sha256sums=('33a370de0580be5c8921151f6941814871402474b85ae397a47289d019b0ac0b'
            '5b3f11022a71dcf85348b6e029ecead74f1ce191963771850535765a445a7363')

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
