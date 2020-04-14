# Maintainer: osch <oliver@luced.de>
#             gato_lento <vukk.euob at gmail>
# Based on axoloti-git and axoloti-runtime-git PKGBUILDs by: Joakim Reinert <mail+aur@jreinert.com>

pkgname=axoloti
pkgver=1.0.12_2
pkgrel=2
pkgdesc='Firmware and GUI for the Axoloti Core'
arch=('x86_64')
url='http://www.axoloti.com'
license=('GPL')
depends=('jre8-openjdk' 'bash' 'udev' 'lib32-bzip2' 'lib32-zlib' 'lib32-ncurses')
makedepends=('apache-ant' 'git' 'jdk8-openjdk')
conflicts=('axoloti-git' 'axoloti-runtime-git')
options=('!strip')
install="$pkgname.install"

_chibios_version=2.6.9
_chibios=ChibiOS-ver${_chibios_version}
_chibios_archive=ver${_chibios_version}.zip
_toolchain=gcc-arm-none-eabi-4_9-2015q2
_toolchain_archive=${_toolchain}-20150609-linux.tar.bz2
_libusb=libusb-1.0.19
_libusb_archive=${_libusb}.tar.bz2
_dfu_util=dfu-util-0.8
_dfu_util_archive=${_dfu_util}.tar.gz

source=(
  "git+https://github.com/axoloti/axoloti.git"
  "axoloti.sh"
  "https://github.com/ChibiOS/ChibiOS/archive/${_chibios_archive}"
  "https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q2-update/+download/${_toolchain_archive}"
  "${_libusb_archive}::http://sourceforge.net/projects/libusb/files/libusb-1.0/${_libusb}/${_libusb_archive}/download"
  "http://dfu-util.sourceforge.net/releases/${_dfu_util_archive}"
)

sha512sums=('SKIP'
            'd3df8647a7adb5df40549fe8f81579df11cbe409527f42101d5a1948102895afbd764ee0b7dfb53f56694aea4ba0b1ffeadee012d7b36a9c032d686e1586a0b3'
            'd3e936d85315a2184e2a13d60265d2a6487079d4c5fca54888510f38a068476ea729b574b53fcd9d3d22f6c3421275834fbdddc09ff58552bf94615da43d78f6'
            '73fbd6c2ba6350422b8b708456e2344d785344aa57777bcd7b5a4d9b8524eeed13d5b10eb47e1c13513519e1e670db726e7f969c4ca9124f33c9dfe04e6e7a8a'
            'f42f0187bfec16ebabad64efef7a7651ee85dcf2af1b7cbe543b7de615f9c6432f7eea5fcc6b23335591dcad287c905eb9bd56199cc5d3b47435027ad678f2c1'
            'a192019654a03f816c8270257785d504bd88ca279844d7d01082b1b1eb219a87135691ccb7cec5de951a87e0864fc39b55f1774c78b4c851940ba467412bee6e')

build() {
    cd $pkgname
    git checkout ${pkgver//_/-}
    mkdir -p "$srcdir/${pkgname}-runtime/"{platform_linux/{bin,lib,src},chibios}
    cp -r "$srcdir/$_chibios"/* "$srcdir/${pkgname}-runtime/chibios/"
    bsdtar -xf "$srcdir/${pkgname}-runtime/chibios/ext/fatfs-0.9-patched.zip" -C "$srcdir/${pkgname}-runtime/chibios/ext"
    cp -r "$srcdir/$_toolchain"/* "$srcdir/${pkgname}-runtime/platform_linux/"
    cd "$srcdir/$_libusb"
    patch -N -p1 < "$srcdir/$pkgname/platform_linux/src/libusb.stdfu.patch"
    ./configure --prefix="$srcdir/${pkgname}-runtime/platform_linux"
    make
    make install
    cd "$srcdir/$_dfu_util"
    ./configure --prefix="$srcdir/${pkgname}-runtime/platform_linux" \
        USB_LIBS="$srcdir/${pkgname}-runtime/platform_linux/lib/libusb-1.0.a -ludev -pthread" \
        USB_CFLAGS="-I$srcdir/${pkgname}-runtime/platform_linux/include/libusb-1.0/"
    make
    sed -i -e 's/SPACE := */EMPTY :=/'                     "$srcdir/$pkgname"/firmware/Makefile.patch
    sed -i -e 's/SPACE += */SPACE := \$(EMPTY) \$(EMPTY)/' "$srcdir/$pkgname"/firmware/Makefile.patch
    make install
    make clean
    ldd "$srcdir/${pkgname}-runtime/platform_linux/bin/dfu-util"
    cd "$srcdir/$pkgname"
    sed -i "s,doc,/usr/share/doc/$pkgname," src/main/java/axoloti/menus/HelpMenu.java
    sed -i "s,file:doc,file:///usr/share/$pkgname," src/main/java/resources/about.html
    echo '##### Building GUI #####'
    ant
}

package() {
    mkdir -p "$pkgdir/opt/${pkgname}-runtime/platform_linux"
    cp -r "$srcdir/${pkgname}-runtime/platform_linux/"{arm-none-eabi,bin,include,lib} "$pkgdir/opt/${pkgname}-runtime/platform_linux/"
    cp -r "$srcdir/$pkgname/firmware" "$pkgdir/opt/${pkgname}-runtime/"
    cp -r "$srcdir/${pkgname}-runtime/chibios" "$pkgdir/opt/${pkgname}-runtime/chibios/"
    cp -r "$srcdir/$pkgname/CMSIS" "$pkgdir/opt/${pkgname}-runtime/CMSIS"
    rm -rf "$pkgdir/opt/${pkgname}-runtime/platform_linux/arm-none-eabi/lib/"{armv6-m,armv7-ar,armv7-m}
    rm -rf "$pkgdir/opt/${pkgname}-runtime/platform_linux/lib/gcc/arm-none-eabi/4.9.3/"{armv6-m,armv7-ar,armv7-m}
    install -Dm755 "$srcdir/$pkgname/platform_linux/compile_firmware.sh" "$pkgdir/opt/${pkgname}-runtime/platform_linux/compile_firmware.sh"
    install -Dm644 "$srcdir/$pkgname/platform_linux/49-axoloti.rules" "$pkgdir/usr/lib/udev/rules.d/49-axoloti.rules"
    install -Dm644 "$srcdir/$pkgname/dist/Axoloti.jar" "$pkgdir/usr/share/$pkgname/Axoloti.jar"
    install -Dm644 "$srcdir/$pkgname/doc/axoloti_icon.png" "$pkgdir/usr/share/$pkgname/axoloti_icon.png"
    install -Dm644 "$srcdir/$pkgname/doc/user guide.html" "$pkgdir/usr/share/doc/$pkgname/user guide.html"
    install -Dm755 "$srcdir/axoloti.sh" "$pkgdir/usr/bin/axoloti"
}
