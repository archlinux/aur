# Maintainer: kharovtobi <tugboat_khatov at outlook dot com>

pkgname=qemu-3dfx
_pkgver=9.2.2
pkgver=9.2.2.r466.a2d25b3
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
    "libnfs"
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
    '752eaeeb772923a73d536b231e05bcc09c9b1f51690a41ad9973d900e4ec9fbf'
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

    # Change patch per major release
    patch -p0 -i  ../00-qemu92x-mesa-glide.patch

    bash ../scripts/sign_commit
    rm -rf "$srcdir"/"$pkgname"/build
    mkdir -p "$srcdir"/"$pkgname"/build
}

build() {
    # Build QEMU
    cd "$srcdir"/"$pkgname"/build
    ../qemu-${_pkgver}/configure --target-list="i386-softmmu" --prefix=/usr --disable-xen --extra-cflags="-march=native -mtune=native -O3 -flto=auto"
    make clean
    make qemu-system-i386

    # Build Wrappers
    source /opt/watcom/owsetenv.sh
    cd ../wrappers/3dfx
    rm -rf build && mkdir build && cd build
    bash ../../../scripts/conf_wrapper
    sed -i 's/^DXEGEN=dxe3gen$/DXEGEN=i686-pc-msdosdjgpp-dxe3gen/' ../dxe/Makefile
    sed -i '/CFLAGS=/s/-mfpmath=sse /-mfpmath=sse -msse2 /' Makefile
    make && make clean
    cd ../../mesa
    rm -rf build && mkdir build && cd build
    bash ../../../scripts/conf_wrapper

    # Add wglinfo.exe to makefile (and fix sse2 problem)
    sed -i 's/^TOOLS=$/TOOLS=wglinfo.exe/' Makefile
    sed -i '/CFLAGS=/s/-mfpmath=sse /-mfpmath=sse -msse2 /' Makefile
    make && make clean

    # Package Wrappers
    cd ../../
    rm -rf iso && mkdir iso && cd iso
    mkdir wrapfx wrapgl
    cp -rf ../3dfx/build/*.{vxd,sys,dll,dxe,ovl,exe} ./wrapfx/
    cp -rf ../mesa/build/*.{dll,exe} ./wrapgl/
    cp ../../LICENSE license.txt
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
