#Maintainer: Sam Bazley <samb1999@hotmail.co.uk>
pkgname=esp-open-sdk-git
pkgver=1
pkgrel=7
pkgdesc="Free and open (as much as possible) integrated SDK for ESP8266 chips"
arch=("i686" "x86_64")
url="https://github.com/pfalcon/esp-open-sdk"
makedepends=("git" "gperf" "help2man" "unzip")
depends=("python" "python2" "python-pyserial" "python2-pyserial" "esptool")
provides=("esp-open-sdk")
conflicts=("esp-open-sdk")
options=("!strip")

source=("git+https://github.com/pfalcon/esp-open-sdk.git")
md5sums=("SKIP")

pkgver() {
    cd esp-open-sdk
    git show -s --format=%ci HEAD | cut -d ' ' -f1-2 | sed -r 's/[^0-9]//g'
}

prepare() {
    cd "$srcdir"/esp-open-sdk
    git submodule init
    git submodule deinit esptool
    git submodule update
    patch Makefile < "$startdir"/Makefile.patch
    patch crosstool-config-overrides \
        < "$startdir"/crosstool-config-overrides.patch
    patch examples/blinky/Makefile < "$startdir"/blinky_Makefile.patch
}

build() {
    cd "$srcdir"/esp-open-sdk
    CPPFLAGS= CFLAGS= CXXFLAGS= LDFLAGS= LD_LIBRARY_PATH= make
    cp sdk/lib/libgcc.a xtensa-lx106-elf/lib/gcc/xtensa-lx106-elf/4.8.5
}

package() {
    cd "$startdir"
    mkdir -p "$pkgdir"/etc/profile.d
    install -m755 esp-open-sdk-git.sh "$pkgdir"/etc/profile.d

    mkdir -p "$pkgdir"/opt/esp-open-sdk
    cd "$srcdir"/esp-open-sdk/

    ver=$(find -maxdepth 1 -type d -name "ESP8266_*" | cut -c 3-)

    cp -dpr --no-preserve=ownership sdk "$pkgdir"/opt/esp-open-sdk
    cp -dpr --no-preserve=ownership "$ver" "$pkgdir"/opt/esp-open-sdk
    cp -dpr --no-preserve=ownership xtensa-lx106-elf "$pkgdir"/opt/esp-open-sdk

    cp -dpr --no-preserve=ownership examples/blinky \
        "$pkgdir"/opt/esp-open-sdk/sdk/examples

    ln -s "$pkgdir/opt/esp-open-sdk/$ver/driver_lib/include/driver/" \
        "$pkgdir"/opt/esp-open-sdk/xtensa-lx106-elf/xtensa-lx106-elf/include/
}
