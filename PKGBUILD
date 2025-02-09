# Maintainer: kharovtobi <tugboat_khatov at outlook dot com>

pkgname=qemu-3dfx
_pkgver=8.2.1
pkgver=8.2.1.r458.e5562fa
pkgrel=1
pkgdesc="MESA GL/3Dfx Glide pass-through for QEMU"
arch=('x86_64')
url="https://github.com/kjliew/qemu-3dfx"
license=('GPL-2.0')
depends=('qemu-base' 'seabios')
makedepends=(
    "alsa-lib"
    "brltty"
    "bzip2"
    "cairo"
    "capstone"
    "cdrtools"
    "coreutils"
    "curl"
    "djgpp-binutils"
    "djgpp-djcrx"
    "djgpp-gcc"
    "dos2unix"
    "dtc"
    "fuse3"
    "gcc-libs"
    "gdk-pixbuf2"
    "git"
    "glib2"
    "glibc"
    "glib2-devel"
    "glusterfs"
    "gnutls"
    "gtk3"
    "jack"
    "keyutils"
    "libaio"
    "libbpf"
    "libcacard"
    "libcap-ng"
    "libepoxy"
    "libiscsi"
#   "libnfs" \ # may cause issues compiling
    "libpipewire"
    "libpng"
    "libpulse"
    "libsasl"
    "libseccomp"
    "libslirp"
    "libssh"
    "liburing"
    "libusb"
    "libx11"
    "libxdp"
    "libxkbcommon"
    "libxml2"
    "lzo"
    "mesa"
    "meson"
    "multipath-tools"
    "mingw-w64-binutils"
    "mingw-w64-gcc"
    "mingw-w64-tools"
    "ncurses"
    "ninja"
    "ndctl"
    "openwatcom-v2"
    "numactl"
    "patch"
    "pam"
    "pcre2"
    "python"
    "python-setuptools"
    "python-distlib"
    "python-pip"
    "python-sphinx"
    "python-sphinx_rtd_theme"
    "pixman"
    "rsync"
    "sdl2"
    "sdl2_image"
    "snappy"
    "spice"
    "spice-protocol"
    "systemd"
    "usbredir"
    "vde2"
    "virglrenderer"
    "vte3"
    "xxd"
    "zlib"
    "zstd"
)
optdepends=(
    "qemu-docs: for documentation and learning invocation"
    "openglide-3dfx: for host openglide support"
)

provides=('qemu-3dfx')
conflicts=('qemu-3dfx')
source=(
    "git+https://github.com/kjliew/qemu-3dfx.git"
    "https://download.qemu.org/qemu-${_pkgver}.tar.xz"
    "${pkgname}.install"
)
noextract=("qemu-${_pkgver}.tar.xz")
sha256sums=(
    'SKIP'
    '8562751158175f9d187c5f22b57555abe3c870f0325c8ced12c34c6d987729be'
    'b94ec59a18f2fc8c0eda31860d2eeed2bf92fe66db773b917de311dece796bf0'
)
install=${pkgname}.install

pkgver() {
    cd "$srcdir"/"$pkgname"
    echo ${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)
}

prepare() {
    cd "$srcdir"/
    tar xf qemu-${_pkgver}.tar.xz -C "$pkgname"
    cd "$pkgname"/qemu-${_pkgver}
    rsync -r ../qemu-0/hw/3dfx ../qemu-1/hw/mesa ./hw/
    patch -p0 -i  ../00-qemu82x-mesa-glide.patch
    bash ../scripts/sign_commit
    rm -rf "$srcdir"/"$pkgname"/build
    mkdir -p "$srcdir"/"$pkgname"/build
}

build() {
    # Build QEMU
    cd "$srcdir"/"$pkgname"/build
    ../qemu-${_pkgver}/configure --target-list="i386-softmmu" --prefix=/usr --disable-xen --disable-libnfs --extra-cflags="-march=native -mtune=native -O3 -flto=auto"
    make clean
    make -j$(nproc) qemu-system-i386

    # Build Wrappers
    source /opt/watcom/owsetenv.sh
    cd ../wrappers/3dfx
    rm -rf build && mkdir build && cd build
    bash ../../../scripts/conf_wrapper
    sed -i 's/^DXEGEN=dxe3gen$/DXEGEN=i686-pc-msdosdjgpp-dxe3gen/' ../dxe/Makefile
    make && make clean
    cd ../../mesa
    rm -rf build && mkdir build && cd build
    bash ../../../scripts/conf_wrapper

    # Add wglinfo.exe to makefile
    sed -i 's/^TOOLS=$/TOOLS=wglinfo.exe/' Makefile
    make && make clean

    # Package Wrappers
    cd ../../
    rm -rf iso && mkdir iso && cd iso
    mkdir wrapfx wrapgl
    cp -f ../3dfx/build/*.{vxd,sys,dll,dxe,ovl,exe} ./wrapfx/
    cp -f ../mesa/build/*.{dll,exe} ./wrapgl/
    cp -r ../../LICENSE license.txt
    echo ${pkgver} > commit\ id.txt
    unix2dos commit\ id.txt license.txt
    mkisofs -JR -V "VMWRAPPER-$(git log --format="%h" -n 1)" -o ../wrappers.iso ../iso
}

package() {
    install -Dm644 "$srcdir"/"$pkgname"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
    install -Dm644 "$srcdir"/"$pkgname"/wrappers/wrappers.iso "$pkgdir"/usr/share/"$pkgname"/wrappers.iso
    install -Dm755 "$srcdir"/"$pkgname"/build/qemu-system-i386 "$pkgdir"/usr/bin/qemu-3dfx-system-i386
    mkdir -p "$pkgdir"/usr/share/man/man1/
    ln -sf /usr/share/man/man1/qemu.1.gz "$pkgdir"/usr/share/man/man1/qemu-3dfx-system-i386.1.gz
}
