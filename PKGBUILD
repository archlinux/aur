# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: demian <mikar Î±Ï„ gmx Î´Î¿Ï„ de>

pkgname=blockify-git
pkgver=v3.6.3.r24.g370d321
pkgrel=3
pkgdesc="Mutes Spotify advertisements."
arch=("any")
url="https://github.com/carlocastoldi/blockify"
license=("MIT")
depends=("spotify" "pulseaudio" "alsa-utils" "wmctrl" "libwnck3" "gst-python"
    "gtk4" "python-dbus" "python-docopt" "gstreamer0.10")
makedepends=("git" "python-build" "python-installer" "python-wheel"
    "python-setuptools")
conflicts=("blockify")
provides=("blockify")
source=("${pkgname}::git+https://github.com/carlocastoldi/blockify#branch=pipewire"
    "1-${pkgver}.patch::https://patch-diff.githubusercontent.com/raw/txtsd/blockify/pull/1.patch")
sha256sums=('SKIP'
            '03d82625fe8acdc17600cb6a962e6724f879db1640f21d5dc52475f7845edad2')

pkgver() {
    cd ${pkgname}
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/[_-]/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 -i "${srcdir}/1-${pkgver}.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
