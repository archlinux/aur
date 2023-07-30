# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=python
_verbump=8e39a00c30fb97019c03b5f94ab598949d256af5
pkgver=2.1.11
pkgrel=2
pkgdesc="Python CLI and API for talking to Meshtastic devices"
arch=('any')
url="https://github.com/meshtastic/python/"

# https://github.com/meshtastic/python/issues/422
license=('GPL3' 'Apache')

depends=('python-protobuf' 'python-pypubsub' 'python-dotmap' 'python-pyqrcode' 'python-tabulate' 'python-timeago' 'python-pyyaml' 'python-pygatt>=4.0.5-3' 'python-setuptools' 'python-requests')
optdepends=('python-pytap2: TUN tunnel support')
source=("https://github.com/meshtastic/python/archive/refs/tags/${pkgver}.tar.gz"
        "https://github.com/meshtastic/python/commit/${_verbump}.patch")
sha256sums=('3ed60131716b93c4afb852c888620f588ed7f48da5ab259b76f7c5e1dc4d0a62'
            'd84fe7ae94b7691fa0cda1c16200a6dcb5a7a36483bfa224b0663f0ca4018658')

prepare() {
    cd "$_name-$pkgver"

    # The tagged commits unfortuantely miss the version bump performed in the
    # release script, so we manually backport that change.
    patch -p1 < "${srcdir}"/${_verbump}.patch
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
