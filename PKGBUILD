# Maintainer: Anatolii Sakhnik <sakhnik at gmail dot com>
pkgname=kerberosio-machinery
pkgver=2.6.1
pkgrel=3
_revision=v${pkgver}
pkgdesc="An image processing framework, which uses your USB-, IP- or RPi-camera to recognize events (e.g. motion)."
arch=('x86_64' 'armv7h' 'armv6h')
url="https://github.com/kerberos-io/machinery"
license=('CC-NC-ND')
depends=('ffmpeg2.8')
makedepends=('make' 'gcc' 'binutils' 'patch' 'cmake' 'autoconf' 'automake' 'git')
source=(${url}/archive/${_revision}.tar.gz
        0001-Avoid-using-TLS.patch
        0002-Fix-for-distcc.patch)
sha1sums=('db309f2a4a586f5cf679d5cf6a029cabe63c7d3a'
          'd05ed01303a09d103f703118126348b1402b3950'
          'b41c3ab8d1665584dac93b8dabab1ab3ed0a19ac')
backup=('etc/opt/kerberosio/config/algorithm.xml'
        'etc/opt/kerberosio/config/capture.xml'
        'etc/opt/kerberosio/config/cloud.xml'
        'etc/opt/kerberosio/config/condition.xml'
        'etc/opt/kerberosio/config/config.xml'
        'etc/opt/kerberosio/config/expositor.xml'
        'etc/opt/kerberosio/config/heuristic.xml'
        'etc/opt/kerberosio/config/io.xml'
        'etc/opt/kerberosio/config/stream.xml')

prepare()
{
    cd ${srcdir}/machinery-${pkgver}
    patch -Np1 -i "${srcdir}/0001-Avoid-using-TLS.patch"
    patch -Np1 -i "${srcdir}/0002-Fix-for-distcc.patch"
}

build()
{
    ffmpeg_path=/usr/lib/ffmpeg2.8
    export LD_LIBRARY_PATH=${ffmpeg_path}${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
    export PKG_CONFIG_PATH=${ffmpeg_path}/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}
    export PKG_CONFIG_LIBDIR=${ffmpeg_path}${PKG_CONFIG_LIBDIR:+:$PKG_CONFIG_LIBDIR}
    if [[ $CARCH == armv7h ]]; then
        echo "Requested LDFLAGS: $LDFLAGS"
        echo "Removing --as-needed because it breaks the build for RPI"
        export LDFLAGS=${LDFLAGS/,--as-needed/}
        echo "New LDFLAGS: $LDFLAGS"
    fi
    cd ${srcdir}/machinery-${pkgver}
    mkdir -p BUILD
    cd BUILD
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
    make ${MAKEFLAGS}
    LANG=C CTEST_OUTPUT_ON_FAILURE=1 make test
}

package()
{
    cd ${srcdir}/machinery-${pkgver}/BUILD
    make DESTDIR=${pkgdir} install ${MAKEFLAGS}
}
