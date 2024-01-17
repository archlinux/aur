# Maintainer: Danila Kiver <danila.kiver@mail.ru>
# Contributor: Tavian Barnes <tavianator@tavianator.com>

pkgname=java21-openjdk-hsdis
_major_ver=21
_minor_ver=0
_patch_ver=2
_update_ver=13
_git_tag=jdk-${_major_ver}.${_minor_ver}.${_patch_ver}+${_update_ver}
_binutils_ver=2.34
pkgver=${_major_ver}.${_minor_ver}.${_patch_ver}.u${_update_ver}
pkgrel=1
pkgdesc="Disassembler for HotSpot"
arch=('x86_64')
url='http://openjdk.java.net/'
license=('GPL2')
source=(https://github.com/openjdk/jdk${_major_ver}u/archive/${_git_tag}.tar.gz
        http://ftp.gnu.org/gnu/binutils/binutils-${_binutils_ver}.tar.bz2)
sha256sums=('4d8c8dd00164df0e344ed343d4ac20c1f30133f1029a83ff2c66c3557ed13a26'
            '89f010078b6cf69c23c27897d686055ab89b198dddf819efb0a4f2c38a0b36e6')

_jdk_src_root=jdk${_major_ver}u-jdk-${_major_ver}.${_minor_ver}.${_patch_ver}-${_update_ver}

prepare() {
    cd "${srcdir}/binutils-${_binutils_ver}"

    # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
    sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
    cd "${srcdir}/${_jdk_src_root}"

    bash configure \
        --with-hsdis=binutils \
        --with-binutils-src=${srcdir}/binutils-${_binutils_ver} \
        --disable-warnings-as-errors

    make build-hsdis
}

package() {
    cd "${srcdir}/${_jdk_src_root}"

    install -D -m755 \
        build/linux-x86_64-server-release/support/hsdis/hsdis-amd64.so \
        "${pkgdir}/usr/lib/jvm/java-21-openjdk/lib/hsdis-amd64.so"
}
