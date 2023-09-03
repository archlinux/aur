# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
_verbump=b2f3ba11aef3c28bd73b96a881fb5a248c2672d5
pkgver=2.2.2
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
sha256sums=('81800a77ac72f9f8939159c512f86379dc363873b0f4898186537ff92026e71d'
            '6a9e75a5f53762fdaa8b1827c74d95eb605b14ff223bbab12bcf0cdb621e5826')

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
