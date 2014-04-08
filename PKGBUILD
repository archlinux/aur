# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Aaron <aaron@aaronlindsay.com>
# Contributor: TheGuy <lowelink26381@gmail.com>

pkgname=devkitarm
pkgver=r42
pkgrel=1
pkgdesc="An ARM toolchain for GP32, Nintendo DS and GBA homebrew development"
arch=('i686' 'x86_64')
url="http://www.devkitpro.org/"
license=('GPL')
options=(!strip libtool staticlibs)
depends=('xz' 'freeimage' 'python' 'cloog' 'flex' 'libmpc' 'libusb')
install=devkitarm.install
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/buildscripts-20140402.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/binutils-2.24.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gcc-4.8.2.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/newlib-2.1.0.tar.gz"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gdb-7.7.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gbatools-1.0.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dstools-1.0.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/grit-0.8.12.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/ndstool-1.50.1.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/general-tools-1.0.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dlditool-1.24.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/mmutil-1.8.6.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dfu-util-0.7.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/stlink-0.5.7.tar.bz2"
        "devkitarm.sh")
sha256sums=('f272442812d44ae22bae8597c9325cb0035a901c59b4a62140dbedc7c31cbaec'
            'e5e8c5be9664e7f7f96e0d09919110ab5ad597794f5b1809871177a0f0f14137'
            '09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8'
            '3e4d5ab9f0508942b6231b8ade4f8e5048cf92c96ed574c2bd6bd3320a599a48'
            '0404d1c6ee6b3ddd811722b5197944758d37b4591c216030effbac204f5a6c23'
            '5e39c58f610410f19312d3fd4380418929912d2173dfa79fb7fe36a192988632'
            '478ebf21f5b63fda920118370f14bf4057c93617e281a2f2901f6405f9d58220'
            '6fedae3c9737a8aa81a898aff52f775ee199befa4eea238adea5029f85f73929'
            'bfdc13d3b9917886da239b7e3cb2c7c3bc063475252f16a2d761f943ae289169'
            '09474dfc1537e1008ee95b1a39a53715b8a740ee5ee37f4376607d6b110343c4'
            '5ecf67bcd5e2088ad31cd27fa14db575001388abc19510c4297aae42e9cd5d2f'
            '5b9182accb99abc03c1a31c39c003fbc5cb0d4af65a44102ede6098828cd045e'
            '33a1922cf7fb57c3d80e873dc20cabd550d1285476ab5a0efa4d910aceafd2f0'
            '8ac33627490158ba32c4b18bd8ceba1ac083658c6005c3cbae077045af9f1033'
            'a6f33eaf2d89493f5bb557ef82c6286793c7e69dd3f6de6be85733835b193bd7')
noextract=('binutils-2.24.tar.bz2' 'gcc-4.8.2.tar.bz2' 'newlib-2.1.0.tar.gz'
           'gdb-7.7.tar.bz2' 'gbatools-1.0.0.tar.bz2' 'dstools-1.0.0.tar.bz2'
           'grit-0.8.12.tar.bz2' 'ndstool-1.50.1.tar.bz2' 'general-tools-1.0.0.tar.bz2'
           'dlditool-1.24.0.tar.bz2' 'mmutil-1.8.6.tar.bz2' 'dfu-util-0.7.tar.bz2'
           'stlink-0.5.7.tar.bz2')

prepare() {
  # reset build dir
  rm -rf build

  # generate config file for automatic build
  cat << END > buildscripts/config.sh
#!bin/sh
BUILD_DKPRO_PACKAGE=1
BUILD_DKPRO_DOWNLOAD=2
BUILD_DKPRO_INSTALLDIR=$PWD/build
BUILD_DKPRO_SRCDIR=$PWD
BUILD_DKPRO_AUTOMATED=1
END

  # fix install of newlib, this is an arch specific bug, that also happens with
  # other arm cross toolchains + newlib. solution is to do the install again.
  sed 's/Error installing newlib"; exit 1; }/newlib, second try"; $MAKE install || { echo "& }/' \
    -i buildscripts/dkarm-eabi/scripts/build-gcc.sh

  # disable building of libraries, we have seperate packages
  sed '25,$d' -i buildscripts/dkarm-eabi/scripts/build-crtls.sh
  sed '239,247d;s|$targetarchives ||' -i buildscripts/build-devkit.sh
}

build() {
  cd buildscripts

  # disable conflicting build flags
  unset CPPFLAGS
  ./build-devkit.sh
}

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r build/devkitARM "$pkgdir"/opt/devkitpro
  # export environment variables
  install -Dm755 devkitarm.sh "$pkgdir"/etc/profile.d/devkitarm.sh
}
