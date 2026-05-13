# Maintainer: Strykar <strykar@hotmail.com>

_gitpkgname=mktxp
pkgname="python-${_gitpkgname,,}"
pkgver=1.2.17
pkgrel=2
pkgdesc="Prometheus Exporter for Mikrotik RouterOS devices"
arch=('any')
url="https://github.com/akpw/mktxp"
license=('GPL-2.0-or-later')
depends=('python' 'python-prometheus_client' 'python-routeros-api' 'python-configobj' 'python-humanize' 'python-texttable' 'speedtest-cli' 'python-waitress' 'python-packaging')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${_gitpkgname}-${pkgver}.tar.gz::https://github.com/akpw/mktxp/archive/refs/tags/v${pkgver}.tar.gz"
        '0001-router-connection-fresh-ssl-context-per-attempt.patch')
# Local patch builds a fresh SSLContext per connect attempt instead of once
# in __init__, to work around a glibc double-free SIGABRT observed against a
# MikroTik with intermittent mid-stream SSL record errors. Defensive, n=1.
# Upstream issue: https://github.com/akpw/mktxp/issues/318
sha256sums=('a4b1e96945d70810dee4d55df6c0867ae440b8d10e956c80dc93eff46a1535fa'
            '4e65f75821ab2a3c737baf56b49e07ad90256bc7a2d65678a1fcb81b41a27261')

prepare() {
    cd "${_gitpkgname}-${pkgver}"
    sed -i '25i\import re' mktxp/utils/utils.py
#    sed -i "69s/'/r'/" mktxp/utils/utils.py
    patch -p1 < "${srcdir}/0001-router-connection-fresh-ssl-context-per-attempt.patch"
}

build() {
    cd "${_gitpkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_gitpkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
