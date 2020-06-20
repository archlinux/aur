# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

_gitname=axoloti-runtime
pkgname=${_gitname}-git
pkgver=2.0.0.r6.g46f6e4b3
pkgrel=2
pkgdesc="runtime for axoloti"
arch=(x86_64)
url="http://www.axoloti.com"
license=(GPL)
depends=(systemd libsystemd python2 lib32-bzip2 lib32-ncurses lib32-zlib)
makedepends=(git libtool automake autoconf unzip)
provides=(axoloti-runtime=$pkgver)
conflicts=(axoloti-runtime)
options=('!strip')
install="$pkgname.install"

_chibios_version=2.6.9
_chibios=ChibiOS-ver${_chibios_version}
_chibios_archive=${_chibios}.zip
_toolchain=gcc-arm-none-eabi-4_9-2015q2
_toolchain_archive=${_toolchain}-20150609-linux.tar.bz2
_libusb=libusb-1.0.19
_libusb_archive=${_libusb}.tar.bz2
_dfu_util=dfu-util-0.8
_dfu_util_archive=${_dfu_util}.tar.gz

source=(
  "${_gitname}::git+https://github.com/axoloti/axoloti.git"
  "https://github.com/ChibiOS/ChibiOS/archive/ver${_chibios_version}.zip"
  "https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q2-update/+download/${_toolchain_archive}"
  "${_libusb_archive}::http://sourceforge.net/projects/libusb/files/libusb-1.0/${_libusb}/${_libusb_archive}/download"
  "http://dfu-util.sourceforge.net/releases/${_dfu_util_archive}"
)

sha512sums=(
    SKIP
    d3e936d85315a2184e2a13d60265d2a6487079d4c5fca54888510f38a068476ea729b574b53fcd9d3d22f6c3421275834fbdddc09ff58552bf94615da43d78f6
    73fbd6c2ba6350422b8b708456e2344d785344aa57777bcd7b5a4d9b8524eeed13d5b10eb47e1c13513519e1e670db726e7f969c4ca9124f33c9dfe04e6e7a8a
    f42f0187bfec16ebabad64efef7a7651ee85dcf2af1b7cbe543b7de615f9c6432f7eea5fcc6b23335591dcad287c905eb9bd56199cc5d3b47435027ad678f2c1
    a192019654a03f816c8270257785d504bd88ca279844d7d01082b1b1eb219a87135691ccb7cec5de951a87e0864fc39b55f1774c78b4c851940ba467412bee6e
)

build() {
    mkdir -p "$srcdir/$_gitname/"{platform_linux/{bin,lib,src},chibios}
    cp -r "$srcdir/$_chibios"/* "$srcdir/$_gitname/chibios/"
    unzip -q -o "$srcdir/$_gitname/chibios/ext/fatfs-0.9-patched.zip" \
        -d "$srcdir/$_gitname/chibios/ext"
    cp -r "$srcdir/$_toolchain"/* "$srcdir/$_gitname/platform_linux/"
    cd "$srcdir/$_libusb"
    patch -N -p1 < "$srcdir/$_gitname/platform_linux/src/libusb.stdfu.patch"
    ./configure --prefix="$srcdir/$_gitname/platform_linux"
    make
    make install
    cd "$srcdir/$_dfu_util"
    ./configure --prefix="$srcdir/$_gitname/platform_linux" \
        USB_LIBS="$srcdir/$_gitname/platform_linux/lib/libusb-1.0.a -ludev -pthread" \
        USB_CFLAGS="-I$srcdir/$_gitname/platform_linux/include/libusb-1.0/"
    make
    make install
    make clean
    ldd "$srcdir/$_gitname/platform_linux/bin/dfu-util"
}

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    mkdir -p "$pkgdir/opt/$_gitname/platform_linux"
    cp -r "$srcdir/$_gitname/platform_linux/"{arm-none-eabi,bin,include,lib} "$pkgdir/opt/$_gitname/platform_linux/"
    cp -r "$srcdir/$_gitname/firmware" "$pkgdir/opt/$_gitname/"
    cp -r "$srcdir/$_gitname/chibios" "$pkgdir/opt/$_gitname/chibios/"
    cp -r "$srcdir/$_gitname/api" "$pkgdir/opt/$_gitname/api"
    rm -rf "$pkgdir/opt/$_gitname/platform_linux/arm-none-eabi/lib/"{armv6-m,armv7-ar,armv7-m}
    rm -rf "$pkgdir/opt/$_gitname/platform_linux/lib/gcc/arm-none-eabi/4.9.3/"{armv6-m,armv7-ar,armv7-m}
    install -Dm755 "$srcdir/$_gitname/platform_linux/compile_firmware.sh" "$pkgdir/opt/$_gitname/platform_linux/compile_firmware.sh"
}
