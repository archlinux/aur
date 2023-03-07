# Maintainer: Eric Woudstra <ericwouds AT gmail DOT com>
pkgname=bpir64-mkimage
pkgver=2023.01
pkgrel=2
pkgdesc='Mkimage tool modified to stretch the image leaving empty space on sectors 2 through 34, so a GPT table can be used without problems.'
arch=(aarch64)
url='https://github.com/u-boot/u-boot'
license=(GPL3)
depends=()
makedepends=()
source=("https://github.com/u-boot/u-boot/archive/refs/tags/v${pkgver}.tar.gz"
        'mtkimage-gpt-expand.patch')
sha256sums=(SKIP SKIP)

build() {
  cd "${srcdir}/u-boot-${pkgver}"
  cp -vf configs/mt7622_rfb_defconfig configs/my_defconfig
  # No libcrypto (openssl)
  echo "CONFIG_TOOLS_LIBCRYPTO=n" | tee -a configs/my_defconfig
  # kwbimage needs libcrypto, so remove it from build
  sed -i '/kwbimage.o \\/d' ./tools/Makefile
  sed -i 's/FIT_OBJS-y :=.*/FIT_OBJS-y := fit_common.o boot\/image-fit.o/' ./tools/Makefile
  ARCH=arm64 make clean
  ARCH=arm64 make my_defconfig
  ARCH=arm64 make tools-only
  mv -vf tools/mkimage bpir3-mkimage
  patch -p1 -N -r - < "${srcdir}/mtkimage-gpt-expand.patch"
  ARCH=arm64 make tools-only
  mv -vf tools/mkimage bpir64-mkimage
}

package() {
  cd "${srcdir}/u-boot-${pkgver}"
  install -m755 -vDt $pkgdir/usr/bin bpir*-mkimage
  install -m644 -vDT doc/mkimage.1 $pkgdir/usr/share/man/man1/bpir64-mkimage.1
}
