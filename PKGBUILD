# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>
# Maintainer: taotieren <admin@taotieren.com>

pkgbase=can-utils-git
pkgname=can-utils-git
pkgver=2023.03.r90.g31432ae
pkgrel=1
groups=()
pkgdesc="Linux-CAN / SocketCAN user space applications"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/linux-can/can-utils"
license=('GPLv2')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(glibc)
makedepends=(git
    cmake
    ninja)
optdepends=("can-isotp-dkms: Kernel modules for isotp")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//g' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    sed -i "s|sbin|bin|g" mcp251xfd/99-devcoredump.rules

    cmake -D CMAKE_BUILD_TYPE=None \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_INSTALL_LIBDIR=lib \
        -B build \
        -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install

    install -Dm0755 "${srcdir}/${pkgname}/mcp251xfd/devcoredump" -t "${pkgdir}/usr/bin/"
    install -Dm0644 "${srcdir}/${pkgname}/mcp251xfd/99-devcoredump.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"
    install -Dm0644 "${srcdir}/${pkgname}"/*.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}/"
}
