# Maintainer: Anatolii Sakhnik <sakhnik at gmail dot com>
pkgname=kerberosio-machinery
pkgver=2.4.0
pkgrel=1
_revision=v${pkgver}
pkgdesc="An image processing framework, which uses your USB-, IP- or RPi-camera to recognize events (e.g. motion)."
arch=('x86_64' 'armv7h')
url="https://github.com/kerberos-io/machinery"
license=('CC-NC-ND')
depends=()
makedepends=('cmake' 'autoconf' 'automake')
source=(${url}/archive/${_revision}.tar.gz
        0001-Avoid-using-TLS.patch
        0002-Fix-for-distcc.patch)
sha1sums=('08a4a99af75152055696aecae9d09c083d2c1c98'
          '79502d1498b507064e7485c743d9f2dc8b5062c4'
          'b41c3ab8d1665584dac93b8dabab1ab3ed0a19ac')

prepare()
{
    cd ${srcdir}/machinery-${pkgver}
    patch -Np1 -i "${srcdir}/0001-Avoid-using-TLS.patch"
    patch -Np1 -i "${srcdir}/0002-Fix-for-distcc.patch"
}

build()
{
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
