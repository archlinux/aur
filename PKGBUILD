# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname="python-xeddsa-git"
pkgver=r152.adc9409
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
    "git"
    "python-build"
    "python-cffi"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=("python-pytest")
provides=("python-xeddsa")
conflicts=("python-xeddsa")
source=("${pkgname}::git+https://github.com/Syndace/python-xeddsa.git")
sha256sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    git clean -dfx
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest -o addopts=""
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
