# Maintainer: Dobroslaw Kijowski <dobo90_at_gmail.com>

pkgname=relayd
pkgver=20230121
pkgrel=1
pkgdesc="Transparent routing / relay daemon (taken from OpenWrt)"
arch=(x86_64 armv7h)
url="https://git.openwrt.org/project/relayd.git"
license=(GPL)
depends=(glibc)
makedepends=(git cmake)
backup=("etc/conf.d/relayd")
_repo_commit="f646ba40489371e69f624f2dee2fc4e19ceec00e"
source=("relayd::git+https://git.openwrt.org/project/relayd.git#commit=${_repo_commit}"
        "0001-libubox-import-list-uloop-utils-.h-uloop-epoll-.c.patch"
        "0002-CMakeLists.txt-adjust-to-compile-with-inline-uloop.patch"
        "0003-relayd.h-fix-includes.patch"
        "relayd.conf"
        "relayd.service")
sha256sums=('SKIP'
            'affd8c2900e7cd213251df6976b200591baa5d5a3f64e568e732fffd3a0045f4'
            '5ecf7f910084b0f4c58211a4a2ebb690717ddfda4714aadc59f62caf9455a163'
            'f35c687efb2a21ca2bc6d65a2472ebece6e490205e08d3e46051056780a5e2a0'
            '58c84f0f6c335e05c281d9f2eeb144839a5e0e2021bac9073872a4634739fd1f'
            '91a601ba5080851ecba276ad8ba11bcd1c4ed97715e631fc8e3c58fa86962b62')

prepare() {
    cd "${pkgname}"

    patch -p1 -i "${srcdir}/0001-libubox-import-list-uloop-utils-.h-uloop-epoll-.c.patch"
    patch -p1 -i "${srcdir}/0002-CMakeLists.txt-adjust-to-compile-with-inline-uloop.patch"
    patch -p1 -i "${srcdir}/0003-relayd.h-fix-includes.patch"
}

build() {
    cd "${pkgname}"

    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    make -C build
}

package() {
    cd "${pkgname}"

    make -C build DESTDIR="${pkgdir}" install
    mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"

    install -Dm644 "${srcdir}/relayd.conf" "${pkgdir}/etc/conf.d/relayd"
    install -Dm644 "${srcdir}/relayd.service" "${pkgdir}/usr/lib/systemd/system/relayd.service"
}
