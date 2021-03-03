# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='0.7.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-tags'
_repo='zulip/python-zulip-api'


pkgname='python-zulip-api'
pkgver="${_upstreamver}"
pkgrel=2
pkgdesc="Pyhton bindings for Zulip API."
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/${_repo}"
license=('GPL')
depends=(
    'python'
    'python-requests'
    'python-pyopenssl'
    'python-six')
optdepends=(
    'python-matrix-client-git: For zulip matrix bridge')
makedepends=('cython' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('72c4825ed03f19f1e9640748e69f2d08f68ae447d093a5e614d97dd95f7419f1')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    # Remove typing dependency check
    # - typing module is included in system python
    # - zulip-api does not see version of this module => crash
    sed -i "/typing>=/d" setup.py
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    python setup.py install --root="${pkgdir}"
}
