# Maintainer: Anatolii Sakhnik <sakhnik at gmail dot com>
pkgname=kerberosio-machinery
pkgver=2.4.0
pkgrel=1
_revision=v${pkgver}
pkgdesc="An image processing framework, which uses your USB-, IP- or RPi-camera to recognize events (e.g. motion)."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/kerberos-io/machinery"
license=('CC-NC-ND')
depends=()
makedepends=('cmake' 'autoconf' 'automake')
source=(${url}/archive/${_revision}.tar.gz
        0001-Avoid-using-TLS.patch
        0002-Use-distcc-in-external-projects.patch)
sha1sums=('08a4a99af75152055696aecae9d09c083d2c1c98'
          '79502d1498b507064e7485c743d9f2dc8b5062c4'
          'd31aaef7ffba9daf3df9b7ed1a802c45c198e38d')

prepare()
{
    cd ${srcdir}/machinery-${pkgver}
    patch -Np1 -i "${srcdir}/0001-Avoid-using-TLS.patch"
    patch -Np1 -i "${srcdir}/0002-Use-distcc-in-external-projects.patch"
}

build()
{
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
