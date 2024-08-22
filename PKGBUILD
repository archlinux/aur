# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
_verbump=3335b3d6514f4f52eb7004abfcc66d30bc4172aa
pkgver=2.4.0
pkgrel=1
pkgdesc="Python CLI and API for talking to Meshtastic devices"
arch=('any')
url="https://github.com/meshtastic/python/"

# https://github.com/meshtastic/python/issues/422
license=(GPL-3.0-only Apache-2.0)

makedepends=(python-build python-installer python-poetry-core python-wheel)
depends=(python-bleak python-dotmap python-protobuf python-pexpect python-print-color python-pypubsub python-pyqrcode python-pyserial python-pyyaml python-requests python-setuptools python-tabulate python-timeago)
optdepends=('python-pytap2: TUN tunnel support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/meshtastic/python/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/meshtastic/python/commit/${_verbump}.patch"
)
sha256sums=('afd2952124a0a9514254f8cda95a0fd45e798fe8b4e1d8f281162cdd9ebcbc51'
            'a438836efb3367d61f603dc9588f795555f6cc5e2796c274acfecc0d2419bacb')

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
