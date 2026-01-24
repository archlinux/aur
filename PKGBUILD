# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-vmk-git
pkgver=0.9.r10.g79ea9f8
pkgrel=1
pkgdesc="VMK (Vietnamese Micro Key) for Fcitx5 - Bộ gõ tiếng Việt mô phỏng UniKey"
arch=('x86_64')
url="https://github.com/nhktmdzhg/VMK"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'fcitx5-bamboo' 'libinput' 'hicolor-icon-theme' 'glibc' 'gcc-libs' 'systemd-libs')
makedepends=('cmake' 'go' 'extra-cmake-modules' 'gcc' 'git')
provides=('fcitx5-vmk')
conflicts=('fcitx5-vmk')
source=('git+https://github.com/nhktmdzhg/VMK.git')
sha256sums=('SKIP')
install='fcitx5-vmk.install'

pkgver() {
    cd "$srcdir/VMK"
    local version=$(grep "^project(fcitx5-vmk VERSION" fcitx5-vmk/CMakeLists.txt | \
    sed 's/.*VERSION \([0-9.]*\).*/\1/')
    
    local count=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)
    
    echo "${version}.r${count}.g${hash}"
}

build() {
    mkdir "$srcdir/VMK/fcitx5-vmk/build"
    cd "$srcdir/VMK/fcitx5-vmk/build"
    
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DFCITX_INSTALL_PKGDATADIR=/usr/share/fcitx5 \
    ..
    
    make
    
    cd "$srcdir/VMK"
    
    g++ fcitx5-vmk-server.cpp -o fcitx5-vmk-server ${LDFLAGS} -linput -ludev
}

package() {
    install -Dm755 "$srcdir/VMK/fcitx5-vmk/build/src/libvmk.so" \
    "$pkgdir/usr/lib/fcitx5/libvmk.so"
    
    install -Dm644 "$srcdir/VMK/fcitx5-vmk/src/vmk.conf.in" \
    "$pkgdir/usr/share/fcitx5/inputmethod/vmk.conf"
    
    install -Dm644 "$srcdir/VMK/fcitx5-vmk/src/vmk-addon.conf.in.in" \
    "$pkgdir/usr/share/fcitx5/addon/vmk.conf"
    
    install -Dm644 "$srcdir/VMK/fcitx5-vmk/org.fcitx.Fcitx5.Addon.VMK.metainfo.xml.in" \
    "$pkgdir/usr/share/metainfo/org.fcitx.Fcitx5.Addon.VMK.metainfo.xml"
    
    install -Dm644 "$srcdir/VMK/docs/fcitx5-vmk-server@.service" \
    "$pkgdir/usr/lib/systemd/system/fcitx5-vmk-server@.service"
    
    install -Dm644 "$srcdir/VMK/docs/99-vmk.rules" \
    "$pkgdir/usr/lib/udev/rules.d/99-vmk.rules"
    
    install -Dm644 "$srcdir/VMK/docs/module-fcitx5-vmk.conf" \
    "$pkgdir/usr/lib/modules-load.d/fcitx5-vmk.conf"
    
    install -Dm755 "$srcdir/VMK/fcitx5-vmk-server" \
    "$pkgdir/usr/bin/fcitx5-vmk-server"

    install -Dm644 "$srcdir/VMK/docs/user-vmk.conf" \
    "$pkgdir/usr/lib/sysusers.d/vmk.conf"
    
    install -Dm644 "$srcdir/VMK/fcitx5-vmk/data/scalable/apps/fcitx-vmk.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/fcitx-vmk.svg"
    
    install -Dm644 "$srcdir/VMK/fcitx5-vmk/data/scalable/apps/org.fcitx.Fcitx5.fcitx-vmk.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-vmk.svg"
    
    install -Dm444 "$srcdir/VMK/LICENSE" \
    "$pkgdir/usr/share/licenses/fcitx5-vmk/LICENSE"
}
