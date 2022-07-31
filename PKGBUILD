# Maintainer: DonKeyPWN
pkgname=dkp-devkitppc
pkgver=r41
pkgrel=1
pkgdesc='Toolchain for Nintendo Gamecube & Wii homebrew development'
arch=('x86_64')
url='https://github.com/devkitpro/buildscripts'
license=('Various')
groups=(
    'gamecube-dev'
    'wii-dev'
    'wiiu-dev'
)
depends=('devkitppc-rules')
makedepends=('git')

conflicts=('devkitPPC')
provides=('devkitPPC')

GCC_VER=12.1.0 # Update with GCC_VER from buildscripts-devkitPPC_r41/select_toolchain.sh

source=("https://github.com/devkitPro/buildscripts/archive/refs/tags/devkitPPC_${pkgver}.tar.gz"
        'config.sh'
        "ftp://ftp.gnu.org/gnu/gcc/gcc-${GCC_VER}/gcc-${GCC_VER}.tar.xz")
noextract=("gcc-${GCC_VER}.tar.xz")
sha256sums=('04417ff6b88cb8ef3225de456c71bb7470adc1a3c3ce8c795c79876e690c8d8a'
            '3baa66fca7b71b21edac06ae7bdc3125e0b872878957eb40a4e7cd1d8ccf2c87'
            '62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b')

prepare() {
    cp config.sh "buildscripts-devkitPPC_${pkgver}/"
    cp "gcc-${GCC_VER}.tar.xz" "buildscripts-devkitPPC_${pkgver}/"
}

build() {
    cd "buildscripts-devkitPPC_${pkgver}"
    CFLAGS=${CFLAGS/-Werror=format-security/}
    CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
    BUILD_DKPRO_INSTALLDIR="${srcdir}/opt/devkitpro" ./build-devkit.sh
}

package() {
    cp -r "${srcdir}/opt" "${pkgdir}/"
    rm "${pkgdir}/opt/devkitpro/devkitPPC/share/info/dir"
}
