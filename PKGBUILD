# U-Boot: ODROID-C4
# Maintainer: Ricardo Band <email@ricardo.band>

# Note: must be built on x86 with an old cross toolchain

buildarch=8
noautobuild=1

pkgname=uboot-odroid-c4
pkgver=2015.01
pkgrel=1
pkgdesc="U-Boot for ODROID-C4"
arch=('aarch64')
url="https://github.com/hardkernel/u-boot"
license=('GPL')
install=$pkgname.install
depends=('uboot-tools')
makedepends=('git' 'bc')
backup=('boot/boot.ini')
_commit=e0725c1dce0c3dbbae47478c13d968c41014fac8
source=("https://github.com/hardkernel/u-boot/archive/${_commit}.tar.gz"
        'boot.ini'
        '0001-sd_fusing-tweaks.patch'
        '0002-arch-linux-arm-modifications.patch'
        '91-uboot-uimg.hook'
        'https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz'
        'https://releases.linaro.org/archive/14.04/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz')
md5sums=('e395576d9a8364112b1d9aa70e3f3533'
         'ee6b8c0d7dab64b1e4f4df239794c09b'
         '131999d66dafbd06b0299d96787387e9'
         '6a052fbc29065391291e3b87310fe26f'
         '1931c8dfde7088530f173ca59fdb8989'
         '5fd777bee04a79435a0861efd473ec0e'
         '12d6e8a0cbd2d8e130cc8f55389a95c3')

prepare() {
  cd u-boot-${_commit}

  git apply ../0001-sd_fusing-tweaks.patch
  git apply ../0002-arch-linux-arm-modifications.patch
}

build() {
  cd u-boot-${_commit}

  unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS

  export PATH="${srcdir}/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:${srcdir}/gcc-linaro-arm-none-eabi-4.8-2014.04_linux/bin:$PATH"
  export ARCH=arm64
  export CROSS_COMPILE=aarch64-none-elf-

  make distclean mrproper
  make odroidc4_defconfig
  make -j1 EXTRAVERSION=-${pkgrel}
}

package() {
  cd u-boot-${_commit}/sd_fuse

  mkdir -p "${pkgdir}"/boot
  cp sd_fusing.sh u-boot.bin "${pkgdir}"/boot
  cp "${srcdir}"/boot.ini "${pkgdir}"/boot
  install -Dm644 "${srcdir}/91-uboot-uimg.hook" "${pkgdir}/usr/share/libalpm/hooks/91-uboot-uimg.hook"
}

