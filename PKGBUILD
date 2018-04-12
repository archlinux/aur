# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=musepack-tools-svn
pkgname=('libreplaygain-svn'
         'libmpcdec-svn'
         'musepack-tools-svn'
         )
pkgver=495
pkgrel=1
pkgdesc="Musepack sv8 decoder/encoder tools and libs (SVN Version)"
arch=('x86_64')
url='http://www.musepack.net'
license=('LGPL')
makedepends=('subversion'
             'cmake'
             'glibc'
             'libcue'
             )
source=('libreplaygain::svn+http://svn.musepack.net/libreplaygain'
        'libmpc::svn+http://svn.musepack.net/libmpc/trunk'
        'cuetools_to_cue_mpcchap.patch'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            )

pkgver() {
  cd libmpc
  echo "$(svnversion)"
}

prepare() {
  mkdir -p build-{libreplaygain,libmpc}
}

build() {
  cd "${srcdir}/build-libreplaygain"
  cmake  ../libreplaygain \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd "${srcdir}/libmpc/mpcchap"
  patch -p1 -i "${srcdir}/cuetools_to_cue_mpcchap.patch"

  cd "${srcdir}/build-libmpc"
  cmake  ../libmpc \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DREPLAY_GAIN_LIBRARY:FILEPATH="${srcdir}/build-libreplaygain/src/libreplaygain.so" \
    -DCUEFILE_LIBRARY:FILEPATH=/usr/lib/libcue.so \
    -DCUEFILE_INCLUDE_DIR:FILEPATH=/usr/include/libcue

  make
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
  optdepends=('libcue: for Musepack (MPC) sv8 chapter editor'
              'libreplaygain-svn: for Musepack (MPC) ReplayGain calculator')

  make -C build-libmpc DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/bin"
}

package_musepack-tools-svn() {
  pkgdesc="Musepack decoder/encoder tools. (SVN Version)"
  provides=('musepack-tools')
  conflicts=('musepack-tools')
  depends=('glibc'
           'libmpcdec-svn'
           )
  optdepends=('libcue: for Musepack (MPC) sv8 chapter editor'
              'libreplaygain-svn: for Musepack (MPC) ReplayGain calculator')

  make -C build-libmpc DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib"
}
