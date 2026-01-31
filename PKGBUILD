# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname="python-xeddsa"
pkgver=1.2.0
pkgrel=1
pkgdesc="Python bindings to libxeddsa."
arch=("x86_64" "aarch64")
url="https://github.com/Syndace/python-xeddsa"
license=("MIT")
depends=(
    "glibc"
    "libxeddsa"
    "python"
)
makedepends=(
    "python-build"
    "python-cffi"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=("python-pytest")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Syndace/python-xeddsa/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("1880e0432953cb5580cd32fcde8be221f61c6d5d5d821992cb69f82a4cb509fd")

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}-${pkgver}"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest -o addopts=""
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
