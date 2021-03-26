# Maintainer: Dobroslaw Kijowski <dobo90_at_gmail.com>

pkgname=relayd
pkgver=20200425
pkgrel=1
pkgdesc="Transparent routing / relay daemon (taken from OpenWrt)"
arch=(x86_64 armv7h)
url="https://git.openwrt.org/project/relayd.git"
license=(GPL)
depends=(glibc)
makedepends=(git)
backup=("etc/conf.d/relayd")
_repo_commit="f4d759be54ceb37714e9a6ca320d5b50c95e9ce9"
source=("relayd::git+https://git.openwrt.org/project/relayd.git#commit=${_repo_commit}"
        "0001-libubox-import-list-uloop-utils-.h-uloop-epoll-.c.patch"
        "0002-CMakeLists.txt-adjust-to-compile-with-inline-uloop.patch"
        "0003-relayd.h-fix-includes.patch"
        "relayd.conf"
        "relayd.service")
sha256sums=('SKIP'
            '3073ac119de2635eeb5affa6c8e46a6328179ffe568302a463f62d5e5b0ac4f5'
            'b002ab6bf4729984c630e3ef57caf2606e2a667cdd2fac1046d16475bd5cb98e'
            'b4fcb393e3567e61999d31734d45314e2cced8620d52146696f982437a978c75'
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

    CFLAGS="${CFLAGS} -Wno-unused-result"

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
