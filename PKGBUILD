# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="cmake-language-server-git-isolated"
pkgver="0.1.7.r1.gcd7ba40"
pkgrel="2"
pkgdesc="Python based cmake language server"
arch=("any")
url="https://github.com/regen100/cmake-language-server"
license=("MIT")
depends=("python" "cmake" "cmake-format")
makedepends=("python-build" "python-virtualenv" "git")
provides=("cmake-language-server=${pkgver}")
conflicts=("cmake-language-server" "cmake-language-server-git")
source=("cmake-language-server::git+https://github.com/regen100/cmake-language-server.git#branch=master")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/cmake-language-server" || return
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/cmake-language-server" || return
    python -m build --wheel
}

package() {
    cd "${srcdir}/cmake-language-server" || return
    python -m venv pkg_venv && \
    pkg_venv/bin/pip install dist/*.whl "pygls==1.0.0" && \
    python -m venv venv_pack && \
    venv_pack/bin/pip install venv-pack2 && \
    venv_pack/bin/venv-pack -p pkg_venv -o pkg_venv.tar && \
    mkdir -p "${pkgdir}/opt/cmake-language-server" && \
    tar -C "${pkgdir}/opt/cmake-language-server" -xf pkg_venv.tar && \
    mkdir -p "${pkgdir}/usr/bin" && \
    ln -s "/opt/cmake-language-server/bin/cmake-language-server" "${pkgdir}/usr/bin"
}
