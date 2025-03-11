# Maintainer: cirlo <cirlo_ca at łøđ dot com>
# Contributor: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: demian <mikar Î±Ï„ gmx Î´Î¿Ï„ de>
pkgname=blockify-git
_name=blockify
pkgver=4.1.0.r1.g7ec5460
pkgrel=2
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/carlocastoldi/blockify"
license=("MIT")
depends=("spotify" "alsa-utils" "python-gobject" "dbus-python" "python-docopt")
makedepends=("python-build" "python-installer" "python-wheel" "python-poetry-core")
optdepends=("libpulse: allows muting Spotify instead of all system sound")
conflicts=("blockify")
provides=("blockify")
source=("${pkgname}::git+https://github.com/carlocastoldi/blockify")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/[_-]/./g;s/^v//'
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm644 "${srcdir}/${pkgname}/blockify/data/blockify.service" "${pkgdir}/usr/lib/systemd/user/blockify.service"
}
