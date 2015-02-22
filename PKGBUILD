# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=devkitarm
pkgver=r44
pkgrel=1
pkgdesc="An ARM toolchain for GP32, Nintendo DS and GBA homebrew development"
arch=('i686' 'x86_64')
url="http://www.devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
depends=('freeimage' 'python' 'flex' 'libmpc' 'libusb' 'guile')
install=devkitarm.install
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/buildscripts-20150216.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/binutils-2.25.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gcc-4.9.2.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/newlib-2.2.0.tar.gz"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gdb-7.8.2.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gbatools-1.0.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gp32tools-1.0.1.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dstools-1.0.2.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/grit-0.8.12.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/ndstool-1.50.3.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/general-tools-1.0.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dlditool-1.24.0.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/mmutil-1.8.6.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/dfu-util-0.8.1.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/stlink-0.5.8.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/3dstools-1.0.3.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/3dslink-0.5.0.tar.bz2"
        "devkitarm-skip-libs.patch"
        "devkitarm.sh")
sha256sums=('d1516ffb657ceaea7f0b0279adeed9b02489904cf0e922f8e42a20efdc2e0733'
            '22defc65cfa3ef2a3395faaea75d6331c6e62ea5dfacfed3e2ec17b08c882923'
            '2020c98295856aa13fda0f2f3a4794490757fc24bcca918d52cc8b4917b972dd'
            'f8add263b0737591aff451b12a00c262c2efac4fa87d741fa1c318fc3bb335be'
            '20e15ee7dab713fee26eccc29e02eccc744d9e13d875cc136a473b6a94aaab58'
            '5e39c58f610410f19312d3fd4380418929912d2173dfa79fb7fe36a192988632'
            '6724bed8e8767956d571b0f334652bdfe07e52ab3dafe2a8292a1d6c4134f413'
            '96af20e6a352e741e8127579a6d64d10ff6d829dc757dfb157f7fb60c6d1abd2'
            '6fedae3c9737a8aa81a898aff52f775ee199befa4eea238adea5029f85f73929'
            '674984065e3ab5f0321c024a5c88808c4f3651a9e054ddcb408121d93fcab862'
            '09474dfc1537e1008ee95b1a39a53715b8a740ee5ee37f4376607d6b110343c4'
            '5ecf67bcd5e2088ad31cd27fa14db575001388abc19510c4297aae42e9cd5d2f'
            '5b9182accb99abc03c1a31c39c003fbc5cb0d4af65a44102ede6098828cd045e'
            '2b56d91b86743f2ff09d818e0f2bd6704f154db5703b49c36b0a6d7da4e381e1'
            'f528cdaf328b74e1814e88f0fcbe04f4ee221d45c740dc1456de4e4036047bb9'
            '106d38f6d55e3190a133150bd8a5e1eb4f89b181f5c634bb060e69fe489b94f0'
            '66eb27c09406dcc59fa129ba7c01ac80059c1102622f70175f65492cb7442052'
            '169d9f31f4ef24309f2a752daf2506762077b09849c983116e71fbc8710be814'
            'fc5489fab5ee4ce5cd53c2e1549fd2958872a6777324920b89e03b88584072db')
noextract=('binutils-2.25.tar.bz2' 'gcc-4.9.2.tar.bz2' 'newlib-2.2.0.tar.gz'
           'gdb-7.8.2.tar.bz2' 'gbatools-1.0.0.tar.bz2' 'gp32tools-1.0.1.tar.bz2'
           'dstools-1.0.2.tar.bz2' 'grit-0.8.12.tar.bz2' 'ndstool-1.50.3.tar.bz2'
           'general-tools-1.0.0.tar.bz2' 'dlditool-1.24.0.tar.bz2' 'mmutil-1.8.6.tar.bz2'
           'dfu-util-0.8.1.tar.bz2' 'stlink-0.5.8.tar.bz2' '3dstools-1.0.3.tar.bz2'
           '3dslink-0.5.0.tar.bz2')

prepare() {
  # reset build dir
  rm -rf build

  # generate config file for automatic build
  cat << END > buildscripts/config.sh
#!bin/sh
BUILD_DKPRO_PACKAGE=1
BUILD_DKPRO_INSTALLDIR=$PWD/build
BUILD_DKPRO_SRCDIR=$PWD
BUILD_DKPRO_AUTOMATED=1
END

  # fix install of newlib, this is an arch specific bug, that also happens with
  # other arm cross toolchains + newlib. solution is to do the install again.
  sed 's/Error installing newlib"; exit 1; }/newlib, second try"; $MAKE install || { echo "& }/' \
    -i buildscripts/dkarm-eabi/scripts/build-gcc.sh

  # fix search path to use correct tools
  sed 's|$PATH:$TOOLPATH/$package/bin|$TOOLPATH/$package/bin:$PATH|' -i \
    buildscripts/build-devkit.sh

  # disable building of libraries, we have separate packages
  patch -Np0 < devkitarm-skip-libs.patch
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
