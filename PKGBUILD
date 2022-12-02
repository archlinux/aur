# Maintainer: Eric Woudstra <ericwouds@gmail.com>
pkgname=bpir64-mkimage
pkgver=2021.10
pkgrel=2
pkgdesc='Mkimage tool modified to stretch the image leaving empty space on sectors 2 through 34, so a GPT table can be used without problems.'
arch=(aarch64)
url='https://github.com/u-boot/u-boot'
license=(GPL3)
depends=()
makedepends=()
source=("https://github.com/u-boot/u-boot/archive/refs/tags/v${pkgver}.tar.gz"
        'mtkimage-buffer-inc.patch'
        'mtkimage-gpt-expand.patch')
sha256sums=(SKIP SKIP SKIP)

build() {
    cd "${srcdir}/u-boot-${pkgver}"
    patch -p1 -N -r - < "${srcdir}/mtkimage-buffer-inc.patch"
    patch -p1 -N -r - < "${srcdir}/mtkimage-gpt-expand.patch"
    cp -vf configs/mt7622_rfb_defconfig configs/my_defconfig
    # No libcrypto (openssl)
    echo "CONFIG_TOOLS_LIBCRYPTO=n" | tee -a configs/my_defconfig
    # kwbimage needs libcrypto, so remove it from build
    sed -i '/kwbimage.o \\/d' ./tools/Makefile
    ARCH=arm64 make my_defconfig
    ARCH=arm64 make tools-only
    cp -vf tools/mkimage tools/bpir64-mkimage
}

package() {
  cd "${srcdir}/u-boot-${pkgver}/tools"
  install -m755 -vDt $pkgdir/usr/bin bpir64-mkimage
}
