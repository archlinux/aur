# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="cmake-language-server-git-isolated"
pkgver="0.1.7.r1.gcd7ba40"
pkgrel="1"
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
    python -m venv "${pkgdir}/opt/cmake-language-server" && \
    "${pkgdir}/opt/cmake-language-server/bin/pip" install dist/*.whl "pygls==1.0.0" && \
    mkdir -p "${pkgdir}/usr/bin" && \
    ln -s "/opt/cmake-language-server/bin/cmake-language-server" "${pkgdir}/usr/bin"
}
