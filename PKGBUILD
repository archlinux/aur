# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-libxau
pkgver=1.0.11
pkgrel=1
pkgdesc="X11 authorisation library (android)"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=("android-${_android_arch}-xorgproto")
options=(!strip !buildflags staticlibs !emptydirs)
source=(${url}/releases/individual/lib/libXau-${pkgver}.tar.xz{,.sig})
sha512sums=('f56abba3bef3fdd4739dfa69367a4251b5fab7c89194c9aece9efa66b9ebbf0736690cc9bd654aab19d9db377e4b9a5268c9c020b3d293bb5351bff5fe75a4dd'
            'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

build() {
    cd "libXau-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-configure \
        --sysconfdir=${ANDROID_PREFIX_ETC}
    make $MAKEFLAGS
#
#     mkdir -p .libs
#
#     for file in $(ls *.c); do
#         b=$(basename --suffix=.c "${file}")
#         echo "${ANDROID_CC} -I./include -I${ANDROID_PREFIX_INCLUDE} -c -o ${b}.o $file"
#         ${ANDROID_CC} -I./include -I${ANDROID_PREFIX_INCLUDE} -c -o "${b}.o" "$file"
#         echo "${ANDROID_CC} -I./include -I${ANDROID_PREFIX_INCLUDE} -fPIC -c -o .libs/${b}.o $file"
#         ${ANDROID_CC} -I./include -I${ANDROID_PREFIX_INCLUDE} -fPIC -c -o ".libs/${b}.o" "$file"
#     done
#
#     of=$(ls *.o | tr '\n' ' ')
#     echo "ar rcs .libs/libXau.a ${of}"
#     ar rcs .libs/libXau.a ${of}
#     of=$(ls .libs/*.o | tr '\n' ' ')
#     echo "${ANDROID_CC} -g -fPIC -shared -o .libs/libXau.so ${of}"
#     ${ANDROID_CC} -g -fPIC -shared -o .libs/libXau.so ${of}
#
#     cp -vf xau.pc.in xau.pc
#     sed -i "s|@prefix@|${ANDROID_PREFIX}|g" xau.pc
#     sed -i "s|@exec_prefix@|\${prefix}|g" xau.pc
#     sed -i "s|@libdir@|${ANDROID_PREFIX_LIB}|g" xau.pc
#     sed -i "s|@includedir@|${ANDROID_PREFIX_INCLUDE}|g" xau.pc
#     sed -i "s|@PACKAGE_VERSION@|${pkgver}|g" xau.pc
}

package() {
    cd "libXau-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install

#     install -v -d "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/X11"
#     install -v include/X11/*.h "${pkgdir}/${ANDROID_PREFIX_INCLUDE}/X11"
#     install -v -d "${pkgdir}/${ANDROID_PREFIX_LIB}"
#     install -v .libs/*.a "${pkgdir}/${ANDROID_PREFIX_LIB}"
#     install -v .libs/*.so "${pkgdir}/${ANDROID_PREFIX_LIB}"
#     install -v -d "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig"
#     install -v *.pc "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig"
    rm -rf "${pkgdir}"/${ANDROID_PREFIX_SHARE}
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
