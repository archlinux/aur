pkgname=esp-open-sdk-git
pkgver=20181127203314
pkgrel=1
pkgdesc="Free and open (as much as possible) integrated SDK for ESP8266 chips"
arch=("i686" "x86_64")
url="https://github.com/pfalcon/esp-open-sdk"
makedepends=("git" "gperf" "help2man" "unzip" "wget" "guile2.0")
depends=("python" "python-pyserial" "esptool")
provides=("esp-open-sdk")
conflicts=("esp-open-sdk")
options=("!strip" "!buildflags" "!makeflags")

source=("git+https://github.com/pfalcon/esp-open-sdk.git"
	"https://raw.githubusercontent.com/thierer/esp-open-sdk/master/1000-gdb-python-3-7.patch")
md5sums=("SKIP"
	"133effcb81ac2ac8190388af00fe631f")

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
    patch crosstool-NG/configure.ac < "$startdir"/crosstool_NG_configure.patch
    patch crosstool-NG/scripts/build/companion_libs/121-isl.sh < "$startdir"/crosstool_NG_isl_url.patch
    patch crosstool-NG/config/companion_libs/expat.in <"$startdir"/crosstool_NG_expat_ver.patch
    patch crosstool-NG/scripts/build/companion_libs/210-expat.sh <"$startdir"/crosstool_NG_expat_url.patch
    mkdir -p crosstool-NG/local-patches/gdb/7.10
    cp "$srcdir"/1000-gdb-python-3-7.patch crosstool-NG/local-patches/gdb/7.10
}

build() {
    cd "$srcdir"/esp-open-sdk
    LD_LIBRARY_PATH= make
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

    ln -s /opt/esp-open-sdk/sdk/driver_lib/include/driver/ \
        "$pkgdir"/opt/esp-open-sdk/xtensa-lx106-elf/xtensa-lx106-elf/include/
}
