# Maintainer: kharovtobi <tugboat_khatov at outlook dot com>

pkgname=qemu-3dfx
pkgver=8.2.1
pkgrel=1
pkgdesc="MESA GL/3Dfx Glide pass-through for QEMU"
arch=("x86_64")
url="https://github.com/kjliew/qemu-3dfx"
license=('GPL-2.0')
depends=("qemu-base" "seabios")
makedepends=(
                                "base"
                                "base-devel"
                                "rsync"
                                "patch"
                                "ninja"
                                "git"
                                "alsa-lib"
                                "brltty"
                                "bzip2"
                                "cairo"
                                "capstone"
                                "cdrtools"
                                "curl"
                                "dtc"
                                "fuse3"
                                "gcc-libs"
                                "gdk-pixbuf2"
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
                                "meson"
                                "multipath-tools"
                                "mingw-w64-binutils"
                                "mingw-w64-gcc"
                                "mingw-w64-tools"
                                "ncurses"
                                "ndctl"
                                "numactl"
                                "pam"
                                "pcre2"
                                "python"
                                "python-setuptools"
                                "python-distlib"
                                "python-sphinx"
                                "python-sphinx_rtd_theme"
                                "pixman"
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
provides=("qemu-3dfx")
conflicts=("qemu-3dfx" "qemu-3dfx-arch")
source=(
                "git+https://github.com/kjliew/qemu-3dfx.git"
                "https://download.qemu.org/qemu-${pkgver}.tar.xz"
                "https://github.com/andrewwutw/build-djgpp/releases/download/v3.4/djgpp-linux64-gcc1220.tar.bz2"
                "https://github.com/open-watcom/open-watcom-v2/releases/download/Current-build/ow-snapshot.tar.xz"
)
noextract=("qemu-${pkgver}.tar.xz" "djgpp-linux64-gcc1220.tar.bz2" "ow-snapshot.tar.xz")
sha256sums=(
                            'SKIP'
                            '8562751158175f9d187c5f22b57555abe3c870f0325c8ced12c34c6d987729be'
                            '8464f17017d6ab1b2bb2df4ed82357b5bf692e6e2b7fee37e315638f3d505f00'
                            '24d3e5a0760c691b5dcdd089e2aade1aad584ee1ec6bc7f37dc60c236b7323f5'
)
prepare() {
    rm -rf "$pkgname"/watcom
    mkdir "$srcdir"/"$pkgname"/watcom
    tar xf qemu-${pkgver}.tar.xz -C "$pkgname"
    tar xf djgpp-linux64-gcc1220.tar.bz2 -C "$pkgname"
    cp  "$srcdir"/"$pkgname"/djgpp/i586-pc-msdosdjgpp/bin/dxe* "$srcdir"/"$pkgname"/djgpp/bin
    tar xf ow-snapshot.tar.xz --directory "$pkgname"/watcom
    cd "$pkgname"/qemu-${pkgver}
    rsync -r ../qemu-0/hw/3dfx ../qemu-1/hw/mesa ./hw/
    patch -p0 -i  ../00-qemu82x-mesa-glide.patch
    bash ../scripts/sign_commit
    rm -rf "$srcdir"/"$pkgname"/build
    mkdir -p "$srcdir"/"$pkgname"/build
}
build() {
    cd "$srcdir"/"$pkgname"/build
    ../qemu-${pkgver}/configure --target-list="i386-softmmu" --prefix=/usr --enable-opengl --enable-gtk --enable-gtk-clipboard  --enable-sdl --enable-sdl-image --enable-libusb --disable-xen
    make clean
    make qemu-system-i386 man
    cd "$srcdir"/"$pkgname"/build/docs
	cp qemu.1 qemu-3dfx-system-i386.1
    gzip qemu-3dfx-system-i386.1
    export WATCOM="$srcdir"/"$pkgname"/watcom
    export PATH=$WATCOM/binl64:$WATCOM/binl:$PATH
    export EDPATH=$WATCOM/eddat
    export INCLUDE=$WATCOM/lh
    export PATH="$srcdir"/"$pkgname"/djgpp/bin:$PATH
    cd "$srcdir"/"$pkgname"/wrappers/3dfx
    rm -rf build && mkdir build && cd build
    bash ../../../scripts/conf_wrapper
    make && make clean
    cd ../../mesa
    rm -rf build && mkdir build && cd build
    bash ../../../scripts/conf_wrapper
    make && make clean
    cd ../../
    rm -rf "$srcdir"/"$pkgname"/wrappers/iso
    mkdir iso && cd iso
    mkdir wrapfx && mkdir wrapgl
    cp -r ../3dfx/build/* ./wrapfx/
    rm -r ./wrapfx/lib* ./wrapfx/Makefile
    cp -r ../mesa/build/* ./wrapgl/
    rm -r ./wrapgl/Makefile
    echo $(git rev-parse HEAD) > commit\ id.txt
    mkisofs -JR -V 3DFX-WRAPPERS -o ../wrappers.iso ../iso
}
package() {
	install -Dm644 "$srcdir"/"$pkgname"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
    install -Dm644 "$srcdir"/"$pkgname"/build/docs/qemu-3dfx-system-i386.1.gz "$pkgdir"/usr/share/man/man1/qemu-3dfx-system-i386.1.gz
    install -Dm644 "$srcdir"/"$pkgname"/wrappers/wrappers.iso "$pkgdir"/usr/share/"$pkgname"/wrappers.iso
	install -Dm755 "$srcdir"/"$pkgname"/build/qemu-system-i386 "$pkgdir"/usr/bin/qemu-3dfx-system-i386
	msg Copy\ the\ wrapper\ disk\ at\ /usr/share/qemu-3dfx\ to\ your\ home\ dir\ and\ run\ qemu-3dfx-system-i386!
}
