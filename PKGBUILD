# Maintainer: taotieren <admin@taotieren.com>

pkgname=sdbusplus-git
pkgver=r891.663b7b7
pkgrel=2
pkgdesc="C++ bindings for systemd dbus APIs"
url="https://github.com/openbmc/sdbusplus"
arch=($CARCH)
license=('Apache-2.0')
depends=(
    "sh"
    "gcc-libs"
    "glibc"
    "nlohmann-json"
    "python"
    "python-inflection"
    "python-jsonschema"
    "python-mako"
    "python-yaml"
    "systemd-libs"
    # AUR
    stdexec
)
makedepends=(
    "boost"
    "boost-libs"
    "cmake"
    "git"
    "gtest"
    "meson"
    "ninja"
    "pkgconf"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
source=("${pkgname}::git+https://github.com/openbmc/sdbusplus.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    arch-meson ${pkgname} build
    meson compile -C build

    # Python tools
    cd "${pkgname}/tools"
    python -m build --wheel --no-isolation
}

package() {
    meson install -C build --destdir "$pkgdir"
    cd "${pkgname}/tools"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
