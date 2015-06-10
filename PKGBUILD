# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-ois
pkgver=1.3
_oisver=${pkgver/./-}
pkgrel=4
pkgdesc="Object Oriented Input System (mingw-w64)"
arch=('any')
url="http://sourceforge.net/projects/wgois"
license=('custom:zlib/libpng')
depends=('mingw-w64-crt')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('autoconf' 'automake' 'libtool' 'mingw-w64-gcc' 'mingw-w64-configure')
source=("http://downloads.sourceforge.net/project/wgois/Source%20Release/${pkgver}/ois_v${_oisver}.tar.gz"
        "gcc47.patch"
        "configure.patch"
        "demos.patch"
        "win32joystick.patch"
        "win32forcefeedback.patch"
        "win32keyboard.patch"
        "win32mouse.patch"
        "win32prereqs.patch")
md5sums=('9697fead17eac6025151cd2e1fca1518'
         '5c9d151b7068cb0c25e584d7753831ff'
         'fe72ba6773e176e6c709bafba54cdf91'
         '2543d3590ce90e14bc2e6c669da7db85'
         'a0c4a08962228791d23e2b5165ae328c'
         '0da3976ebf45df2adedbfcbd1685fc03'
         '987e2b7ae04740c7ecfc1b2b0b108640'
         '1d43a765417fcdeff3594a5f7800669d'
         'f1a2ba866b2f19d3d51f76a53f515457')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/ois-v${_oisver}

  patch -Np1 < ${srcdir}/gcc47.patch
  patch -Np1 < ${srcdir}/configure.patch
  patch -Np1 < ${srcdir}/demos.patch
  patch -Np1 < ${srcdir}/win32joystick.patch
  patch -Np1 < ${srcdir}/win32forcefeedback.patch
  patch -Np1 < ${srcdir}/win32keyboard.patch
  patch -Np1 < ${srcdir}/win32mouse.patch
  patch -Np1 < ${srcdir}/win32prereqs.patch

  chmod +x bootstrap

  ./bootstrap
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/ois-v${_oisver}/build-${_arch} && cd ${srcdir}/ois-v${_oisver}/build-${_arch}

    unset LDFLAGS CPPFLAGS
    ${_arch}-configure --prefix=/usr/${_arch} --host=${_arch} --enable-shared=yes --enable-static=yes
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/ois-v${_oisver}/build-${_arch}
    make DESTDIR=${pkgdir} install

  	${_arch}-strip -x -g "${pkgdir}/usr/${_arch}/bin/"*.dll
  	${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
