# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-vmk-git
pkgver=0.9.r3.ge8548b3
pkgrel=4
pkgdesc="VMK (Vietnamese Micro Key) for Fcitx5 - Bộ gõ tiếng Việt mô phỏng UniKey"
arch=('x86_64')
url="https://github.com/thanhpy2009/VMK"
license=('GPLv3')
depends=('fcitx5' 'acl')
makedepends=('cmake' 'go' 'extra-cmake-modules' 'fltk' 'gcc')
provides=('fcitx5-vmk')
conflicts=('fcitx5-vmk')
source=(
	'git+https://github.com/thanhpy2009/VMK.git'
	'setup.sh'
)
sha256sums=(
	'SKIP'
	'5178cfee7333cd6c081b99af772df85e0b76f7708898121ac51e8679b8686dfa'
)
install='fcitx5-vmk.install'

pkgver() {
    cd "$srcdir/VMK"
    local version=$(grep "^project(fcitx5-vmk VERSION" src-full/fcitx5-vmk/CMakeLists.txt | \
                   sed 's/.*VERSION \([0-9.]*\).*/\1/')

    local count=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)

    echo "${version}.r${count}.g${hash}"
}

build() {
	mkdir "$srcdir/VMK/src-full/fcitx5-vmk/build"
    cd "$srcdir/VMK/src-full/fcitx5-vmk/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DFCITX_INSTALL_PKGDATADIR=/usr/share/fcitx5 \
          ..

    make

    cd "$srcdir/VMK/src-full"

    g++ fcitx5_uinput_server.cpp -o fcitx5_vmk_server -lpthread

    g++ -Os main6.cpp \
        -o sconfig \
        -lpthread \
        $(pkg-config --cflags --libs x11) \
        $(fltk-config --cflags --ldflags --use-images) \
        -static-libgcc -static-libstdc++
}

package() {
    install -Dm755 "$srcdir/VMK/src-full/fcitx5-vmk/build/src/libvmk.so" \
                 "$pkgdir/usr/lib/fcitx5/libvmk.so"

    install -Dm644 "$srcdir/VMK/src-full/fcitx5-vmk/src/vmk.conf.in" \
                 "$pkgdir/usr/share/fcitx5/inputmethod/vmk.conf"

    install -Dm644 "$srcdir/VMK/src-full/fcitx5-vmk/src/vmk-addon.conf.in.in" \
                 "$pkgdir/usr/share/fcitx5/addon/vmk.conf"

    install -Dm644 "$srcdir/VMK/src-full/fcitx5-vmk/org.fcitx.Fcitx5.Addon.VMK.metainfo.xml.in" \
                 "$pkgdir/usr/share/metainfo/org.fcitx.Fcitx5.Addon.VMK.metainfo.xml"

    install -Dm755 "$srcdir/VMK/src-full/fcitx5_vmk_server" \
                 "$pkgdir/usr/bin/fcitx5_vmk_server"

    install -Dm755 "$srcdir/VMK/src-full/sconfig" \
                 "$pkgdir/usr/bin/vmk-sconfig"

    install -Dm755 "$srcdir/setup.sh" \
                 "$pkgdir/usr/share/fcitx5-vmk/create_fcitx5_service.sh"
}
