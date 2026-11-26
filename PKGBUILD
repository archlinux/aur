# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=panda-re
pkgver=1.8.85
pkgrel=5
pkgdesc='Platform for Architecture-Neutral Dynamic Analysis'
arch=('x86_64')
url='https://github.com/panda-re/panda'
license=('GPL-2.0-only' 'LGPL-2.1-only')
depends=('glib2' 'zlib' 'libpng' 'pixman' 'ncurses' 'gnutls' 'nettle'
         'protobuf' 'protobuf-c' 'z3' 'capstone' 'libslirp' 'libnfs' 'dtc'
         'libaio' 'libiscsi' 'openssl' 'libarchive' 'libsasl' 'libcap-ng'
         'libcap' 'spice' 'libcacard' 'usbredir' 'brltty' 'rdma-core' 'mesa'
         'libepoxy' 'libjpeg-turbo' 'libssh2' 'libseccomp' 'vde2'
         'wireshark-cli' 'libosi-bin' 'libdwarf' 'gcc-libs' 'libatomic' 'systemd-libs' 'abseil-cpp' 'acl'
         'at-spi2-core' 'bluez-libs' 'bzip2' 'cairo' 'curl' 'gdk-pixbuf2'
         'llvm14' 'virglrenderer'
         'glusterfs' 'gtk3' 'harfbuzz' 'jsoncpp' 'libusb' 'libx11' 'lzo'
         'pango' 'sdl2' 'snappy' 'util-linux-libs' 'vte3')
makedepends=('clang' 'cmake' 'ninja' 'pkgconf' 'python' 'cargo' 'chrpath'
             'llvm14' 'glib2' 'pixman' 'libslirp' 'dtc' 'capstone'
             'protobuf' 'protobuf-c' 'z3' 'rapidjson' 'libnfs'
             'wireshark-cli' 'libarchive' 'openssl' 'libaio' 'libiscsi'
             'spice' 'libcacard' 'usbredir' 'brltty' 'rdma-core' 'mesa'
             'libepoxy' 'libjpeg-turbo' 'libssh2' 'libseccomp' 'vde2'
             'libosi-bin' 'libdwarf' 'libatomic' 'systemd-libs' 'abseil-cpp' 'acl' 'at-spi2-core' 'bluez-libs'
             'bzip2' 'cairo' 'curl' 'gdk-pixbuf2' 'glusterfs' 'gtk3'
             'harfbuzz' 'jsoncpp' 'libusb' 'libx11' 'lzo' 'pango' 'sdl2'
             'snappy' 'util-linux-libs' 'vte3')

optdepends=('python-numpy: PLOG analysis scripts'
            'python-pycparser: plugin API generation script'
            'python-protobuf: PLOG scripts'
            'python-pandare: Python API and PLOG scripts'
            'python-pyqt5: coverage GUI scripts'
            'python-colorama: run_guest.py'
            'ipython: interactive analysis scripts'
            'python-psutil: diverge.py')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/panda-re/panda/archive/refs/tags/v${pkgver}.tar.gz"
        'panda-arch.patch')
sha256sums=('0d5eb59a900a792de250297dda4cc6e900b6a73c425915aa92c625bcfde8427a'
            '7be6685f70d39abd9d1114da342099355b2172089b98f609ecb8940fa15972c7')

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
    # A source-built llvm14 exposes one shared libLLVM, which core and plugins share.
    # The binary llvm14-bin exposes only static component libraries and its plugins
    # cannot be loaded into the same process as the core; that provider still builds.
    /usr/lib/llvm14/bin/llvm-config --shared-mode || true
    # Keep the build directory out of binary strings and debug metadata.
    export CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -ffile-prefix-map=${srcdir}/="
    export CXXFLAGS="$CFLAGS"
    export LDFLAGS=''
    unset PKG_CONFIG_PATH
    # Arch installs libdwarf headers in a versioned include directory.
    _libdwarf_cflags=$(pkg-config --cflags libdwarf)

    cd "panda-${pkgver}"
    mkdir -p build
    cd build
    ../configure \
        --target-list="$_targets" \
        --prefix=/usr \
        --enable-llvm \
        --with-llvm=/usr/lib/llvm14 \
        --extra-cflags="-std=gnu11 -DLIBNFS_API_V2 -Wno-error $_libdwarf_cflags" \
        --extra-cxxflags="-Wno-error $_libdwarf_cflags" \
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

    # Generated helpers embed the build path; keep it out of the package.
    find "$pkgdir/usr/lib/panda" -type f -name root-output -delete
    _srcdir_mask=${srcdir//?/x}
    grep -RlZ -- "$srcdir" "$pkgdir" | xargs -0 -r sed -i "s|${srcdir//./\\.}|$_srcdir_mask|g"

    install -Dm644 "$srcdir/panda-${pkgver}/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 "$srcdir/panda-${pkgver}/COPYING.LIB" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING.LIB"
}
