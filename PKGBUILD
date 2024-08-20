# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Filip Brcic < brcha at gna dot org >

# Thanks to the patch from the MXE project <mxe.cc>

_android_arch=aarch64

_basever=8.2
_patchlevel=013

pkgname=android-${_android_arch}-readline
pkgver=${_basever}.${_patchlevel}
pkgrel=1
pkgdesc="GNU readline library (Android ${_android_arch})"
arch=('any')
url="https://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL-3.0-only')
groups=('android-readline')
depends=('android-ndk'
         "android-${_android_arch}-ncurses")
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://ftp.gnu.org/gnu/readline/readline-${_basever}.tar.gz"{,.sig}
        '0001-Disable-lib-symlinks.patch'
        '0002-Unversioned-libs.patch')

if [ ${_patchlevel} -gt 00 ]; then
    for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
        source=(${source[@]} "https://ftp.gnu.org/gnu/readline/readline-${_basever}-patches/readline${_basever//./}-$(printf "%03d" ${_p})"{,.sig})
    done
fi

sha256sums=('3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35'
            'SKIP'
            'a280f097aced0cbaca164f54ef5c7d3784e394b0386deaabbf3d33a9ed949f76'
            'f8561d3e3947c9cea4541b81a7cf0d88df0f9b2e7b13048086b1c458b25cb268'
            'bbf97f1ec40a929edab5aa81998c1e2ef435436c597754916e6a5868f273aff7'
            'SKIP'
            'e06503822c62f7bc0d9f387d4c78c09e0ce56e53872011363c74786c7cd4c053'
            'SKIP'
            '24f587ba46b46ed2b1868ccaf9947504feba154bb8faabd4adaea63ef7e6acb0'
            'SKIP'
            '79572eeaeb82afdc6869d7ad4cba9d4f519b1218070e17fa90bbecd49bd525ac'
            'SKIP'
            '622ba387dae5c185afb4b9b20634804e5f6c1c6e5e87ebee7c35a8f065114c99'
            'SKIP'
            'c7b45ff8c0d24d81482e6e0677e81563d13c74241f7b86c4de00d239bc81f5a1'
            'SKIP'
            '5911a5b980d7900aabdbee483f86dab7056851e6400efb002776a0a4a1bab6f6'
            'SKIP'
            'a177edc9d8c9f82e8c19d0630ab351f3fd1b201d655a1ddb5d51c4cee197b26a'
            'SKIP'
            '3d9885e692e1998523fd5c61f558cecd2aafd67a07bd3bfe1d7ad5a31777a116'
            'SKIP'
            '758e2ec65a0c214cfe6161f5cde3c5af4377c67d820ea01d13de3ca165f67b4c'
            'SKIP'
            'e0013d907f3a9e6482cc0934de1bd82ee3c3c4fd07a9646aa9899af237544dd7'
            'SKIP'
            '6c8adf8ed4a2ca629f7fd11301ed6293a6248c9da0c674f86217df715efccbd3'
            'SKIP'
            '1ea434957d6ec3a7b61763f1f3552dad0ebdd6754d65888b5cd6d80db3a788a8'
            'SKIP')
validpgpkeys=('7C0135FB088AAF6C66C650B9BB5869F064EA74AB') # Chet Ramey <chet@cwru.edu>

prepare() {
    cd "${srcdir}/readline-${_basever}"

    for (( _p=1; _p<=$((10#${_patchlevel})); _p++ )); do
        msg "applying patch readline${_basever//./}-$(printf "%03d" ${_p})"
        patch -Np0 -i ${srcdir}/readline${_basever//./}-$(printf "%03d" ${_p})
    done

    patch -Np1 -i ../0001-Disable-lib-symlinks.patch
    patch -Np1 -i ../0002-Unversioned-libs.patch
}

build() {
    cd "${srcdir}/readline-${_basever}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --enable-multibyte \
        --disable-install-examples \
        --without-purify \
        --with-curses
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/readline-${_basever}"
    android-${_android_arch}-configure \

    make install DESTDIR="${pkgdir}"
    rm -r "${pkgdir}/${ANDROID_PREFIX_BIN}"
    rm -r "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
