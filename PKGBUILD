# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=python-dbussy-git
_pkgname=${pkgname%-git}
pkgver=1.3.r26.g35726d2
pkgrel=1
pkgdesc="Python binding for D-Bus using asyncio"
arch=(any)
url=https://gitlab.com/ldo/dbussy
license=(LGPL)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools git)
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+https://gitlab.com/ldo/dbussy.git")
b2sums=(SKIP)

pkgver() {
    cd ${_pkgname}
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd $_pkgname
    sed -i 's/python-tag/python_tag/' setup.cfg  # Address setuptools deprecation
    python -m build --wheel --no-isolation
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
