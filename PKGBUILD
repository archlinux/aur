# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=musepack-tools-svn
pkgname=('libcuefile-svn'
         'libreplaygain-svn'
         'libmpcdec-svn'
         'musepack-tools-svn'
         )
pkgver=481
pkgrel=1
pkgdesc="Musepack sv8 decoder/encoder tools and libs (SVN Version)"
arch=('i686' 'x86_64')
url='http://www.musepack.net'
license=('LGPL')
makedepends=('subversion'
             'cmake'
             'glibc'
             )
source=('libcuefile::svn+http://svn.musepack.net/libcuefile/trunk'
        'libreplaygain::svn+http://svn.musepack.net/libreplaygain'
        'libmpc::svn+http://svn.musepack.net/libmpc/trunk'
        )
sha1sums=('SKIP'
          'SKIP'
          'SKIP')

prepare() {
  mkdir -p build-{libcuefile,libreplaygain,libmpc}
}

build() {
  cd "${srcdir}/build-libcuefile"
  cmake ../libcuefile \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd "${srcdir}/build-libreplaygain"
  cmake  ../libreplaygain \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd "${srcdir}/build-libmpc"
  cmake  ../libmpc \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DREPLAY_GAIN_LIBRARY:FILEPATH="${srcdir}"/build-libreplaygain/src/libreplaygain.so \
    -DCUEFILE_LIBRARY:FILEPATH="${srcdir}"/build-libcuefile/src/libcuefile.so
  make
}

package_libcuefile-svn() {
  pkgdesc="A library to work with CUE files. (SVN Version)"
  depends=('glibc')
  provides=('libcuefile' 'libcuefile.so')
  conflicts=('libcuefile')

  make -C build-libcuefile DESTDIR="${pkgdir}" install
  (cd libcuefile/include/cuetools; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/include/cuetools/${i}"; done)
}

package_libreplaygain-svn() {
  pkgdesc="A library to adjust audio gain. (SVN Version)"
  depends=('glibc')
  provides=('libreplaygain' 'libreplaygain.so')
  conflicts=('libreplaygain')

  make -C build-libreplaygain DESTDIR="${pkgdir}" install
  (cd libreplaygain/include/replaygain; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/include/replaygain/${i}"; done)
}

package_libmpcdec-svn(){
  pkgdesc="Musepack decoder/encoder lib. (SVN Version)"
  provides=('libmpcdec' 'libmpcdec.so')
  conflicts=('libmpcdec')
  depends=('glibc')
  optdepends=('libcuefile-svn: for Musepack (MPC) sv8 chapter editor'
              'libreplaygain-svn: for Musepack (MPC) ReplayGain calculator')

  make -C build-libmpc DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin"
}

package_musepack-tools-svn() {
  pkgdesc="Musepack decoder/encoder tools and libs. (SVN Version)"
  provides=('musepack-tools')
  conflicts=('musepack-tools')
  depends=('glibc'
           'libmpcdec-svn'
           )
  optdepends=('libcuefile-svn: for Musepack (MPC) sv8 chapter editor'
              'libreplaygain-svn: for Musepack (MPC) ReplayGain calculator')

  make -C build-libmpc DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib"
}
