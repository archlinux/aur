# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgname=fcitx5-vmk-git
pkgver=0.9.r3.ge8548b3
pkgrel=6
pkgdesc="VMK (Vietnamese Micro Key) for Fcitx5 - Bộ gõ tiếng Việt mô phỏng UniKey"
arch=('x86_64')
url="https://github.com/thanhpy2009/VMK"
license=('GPL-3.0-or-later')
depends=('fcitx5' 'acl' 'fltk' 'bash')
makedepends=('cmake' 'go' 'extra-cmake-modules' 'gcc' 'git')
provides=('fcitx5-vmk')
conflicts=('fcitx5-vmk')
source=(
	'git+https://github.com/thanhpy2009/VMK.git'
	'setup.sh'
)
sha256sums=(
	'SKIP'
	'd19a27d40ded993a086a1e6b21c5a0fea2a9149d529179bd02055547e63c189b'
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

    g++ fcitx5_uinput_server.cpp -o fcitx5_vmk_server ${LDFLAGS} -lpthread

    g++ -Os main6.cpp \
        -o sconfig \
        -lpthread \
        ${LDFLAGS} \
        -Wl,--as-needed \
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

    install -Dm644 "$srcdir/VMK/src-full/fcitx5-vmk/data/vietnamese.cm.dict" \
    			 "$pkgdir/usr/share/fcitx5/bamboo/vietnamese.cm.dict"

    install -Dm644 "$srcdir/VMK/src-full/fcitx5-vmk/data/scalable/apps/fcitx-vmk.svg" \
    			 "$pkgdir/usr/share/icons/hicolor/scalable/apps/fcitx-vmk.svg"

    install -Dm644 "$srcdir/VMK/src-full/fcitx5-vmk/data/scalable/apps/org.fcitx.Fcitx5.fcitx-vmk.svg" \
    			 "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-vmk.svg"

    install -Dm444 "$srcdir/VMK/LICENSE" \
    			"$pkgdir/usr/share/licenses/fcitx5-vmk/LICENSE"
}
