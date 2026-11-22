# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=panda-re
pkgver=1.8.85
pkgrel=2
pkgdesc='Platform for Architecture-Neutral Dynamic Analysis'
arch=('x86_64')
url='https://github.com/panda-re/panda'
license=('GPL-2.0-only' 'LGPL-2.1-only')
depends=('glib2' 'zlib' 'libpng' 'pixman' 'ncurses' 'gnutls' 'nettle'
         'protobuf' 'protobuf-c' 'z3' 'capstone' 'libslirp' 'libnfs' 'dtc'
         'libaio' 'libiscsi' 'openssl' 'libarchive' 'libsasl' 'libcap-ng'
         'libcap' 'spice' 'libcacard' 'usbredir' 'brltty' 'rdma-core' 'mesa'
         'libepoxy' 'libjpeg-turbo' 'libssh2' 'libseccomp' 'vde2'
         'wireshark-cli' 'libosi-bin' 'gcc-libs' 'libatomic' 'systemd-libs' 'abseil-cpp' 'acl'
         'at-spi2-core' 'bluez-libs' 'bzip2' 'cairo' 'curl' 'gdk-pixbuf2'
         'glusterfs' 'gtk3' 'harfbuzz' 'jsoncpp' 'libusb' 'libx11' 'lzo'
         'pango' 'sdl2' 'snappy' 'util-linux-libs' 'vte3')
makedepends=('cmake' 'ninja' 'pkgconf' 'python' 'cargo' 'chrpath'
             'llvm14-bin' 'glib2' 'pixman' 'libslirp' 'dtc' 'capstone'
             'protobuf' 'protobuf-c' 'z3' 'rapidjson' 'libnfs'
             'wireshark-cli' 'libarchive' 'openssl' 'libaio' 'libiscsi'
             'spice' 'libcacard' 'usbredir' 'brltty' 'rdma-core' 'mesa'
             'libepoxy' 'libjpeg-turbo' 'libssh2' 'libseccomp' 'vde2'
             'libosi-bin' 'libatomic' 'systemd-libs' 'abseil-cpp' 'acl' 'at-spi2-core' 'bluez-libs'
             'bzip2' 'cairo' 'curl' 'gdk-pixbuf2' 'glusterfs' 'gtk3'
             'harfbuzz' 'jsoncpp' 'libusb' 'libx11' 'lzo' 'pango' 'sdl2'
             'snappy' 'util-linux-libs' 'vte3')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/panda-re/panda/archive/refs/tags/v${pkgver}.tar.gz"
        'panda-arch.patch')
sha256sums=('0d5eb59a900a792de250297dda4cc6e900b6a73c425915aa92c625bcfde8427a'
            'c6f187cb57ec611031e19af64dd0fc055561231da83a6f8e3c55d08519219cf9')

_targets='x86_64-softmmu,i386-softmmu,arm-softmmu,aarch64-softmmu,ppc-softmmu,mips-softmmu,mipsel-softmmu,mips64-softmmu,mips64el-softmmu'

latestver() {
    curl -fsSL https://api.github.com/repos/panda-re/panda/releases/latest |
        jq -r '.tag_name // empty' | sed 's/^v//'
}

prepare() {
    cd "panda-${pkgver}"
    patch -Np1 -i ../panda-arch.patch
}

build() {
    # PANDA's LLVM pass manager code requires LLVM 14; newer LLVM removed those APIs.
    export CFLAGS='-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2'
    export CXXFLAGS="$CFLAGS"
    export LDFLAGS=''
    unset PKG_CONFIG_PATH

    cd "panda-${pkgver}"
    mkdir -p build
    cd build
    ../configure \
        --target-list="$_targets" \
        --prefix=/usr \
        --enable-llvm \
        --with-llvm=/usr/lib/llvm14 \
        --extra-cflags='-std=gnu11 -DLIBNFS_API_V2 -Wno-error' \
        --extra-cxxflags='-Wno-error' \
        --disable-docs
    make
}

check() {
    cd "panda-${pkgver}/build"
    ./i386-softmmu/panda-system-i386 --version
}

package() {
    cd "panda-${pkgver}/build"
    make -o all DESTDIR="$pkgdir" install

    # PANDA does not own the generic QEMU utilities or their translations.
    rm -f "$pkgdir/usr/bin/qemu-img" "$pkgdir/usr/bin/qemu-io" \
        "$pkgdir/usr/bin/qemu-nbd"
    find "$pkgdir/usr/share/locale" -type f -name 'qemu.mo' -delete 2>/dev/null || true
    rm -f "$pkgdir/usr/share/panda/s390-ccw.img"

    find "$pkgdir/usr/lib/panda" -type f -name '*_dso_info_*.so' -exec chrpath -d {} +

    install -Dm644 "$srcdir/panda-${pkgver}/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 "$srcdir/panda-${pkgver}/COPYING.LIB" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING.LIB"
}
