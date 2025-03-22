# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_name="jbigkit"
pkgname="lib32-${_name}"
pkgver=2.1
pkgrel=5
pkgdesc="Data compression library/utilities for bi-level high-resolution images (32-bit)"
arch=('x86_64')
url="https://www.cl.cam.ac.uk/~mgk25/jbigkit"
license=('GPL-2.0-or-later')
depends=("${_name}>=${pkgver}" 'lib32-glibc')
makedepends=('lib32-gcc-libs')
provides=('libjbig.so' 'libjbig85.so')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://www.cl.cam.ac.uk/~mgk25/jbigkit/download/${_pkgsrc}.tar.gz"
        'jbigkit-2.1-shared_lib.patch'
        'jbigkit-2.1-build_warnings.patch'
        'jbigkit-2.1-ldflags.patch'
        'jbigkit-2.1-coverity.patch'
        '0013-new-jbig.c-limit-s-maxmem-maximum-decoded-image-size.patch'
        '0015-jbg_newlen-check-for-end-of-file-within-MARKER_NEWLE.patch')
b2sums=('7bd82f0e10a2d3794739ee85b77c5407d58753a00e014e937735f9af3043347de88a6e567609bc26de488887a6d61b0a162387fb72732b9be7e550e3f9b9539e'
        '52c5f7384f499e15a636b8e0089153750ac02da4ac850260a3243ee06d1194133f1264abc3457e52c5a15ee1a4bfad0b31042975d80273bf741b75e634845745'
        '6114609e5186e5fae1678de00f8c7336970c18923d3d3c01fbc431e95387bfe5696fe7914947ea3903c972eb54dfd24efe0d9ac3c7f4512de26f6ab138ce590c'
        'a8e36381543c0f701a589c115577da2509f02f3002926ab86b62e29e9f8a12db65b5d56387a61aa7a053e49d59e79e968c477ce096c73aa24ad3f94e28dff6b5'
        '2650020ba8ef433a3b935917297c034f01f0296a2a7c9c23c47521b823cc79ac32df8a3695f57e885b91604b138fedc1fcfea1cda8d2a79e9fd3c9680f0c06a8'
        'e1deb611727db51a72c5b7cef0155832198e5575b3e5ea50eedc7fa52f40114d8443302d6df593d87307b6e3c4333390c12d2278ca088ca5f8e7bb47196e6540'
        'b6b624cb5601dc6694bc9d6b5807f3efa0b9aa8eb8b50749c59a890e951fce6d86da0370ce7b7ecad549e207aec5d68c8abcb8b1946f02a427ebbc38008d4918')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # instead of a static library, create a shared library
  patch -Np1 -i "${srcdir}/jbigkit-2.1-shared_lib.patch"
  # fix build warnings
  patch -Np1 -i "${srcdir}/jbigkit-2.1-build_warnings.patch"
  # apply distribution LDFLAGS
  patch -Np1 -i "${srcdir}/jbigkit-2.1-ldflags.patch"
  # fix coverity issues
  patch -Np1 -i "${srcdir}/jbigkit-2.1-coverity.patch"
  # security fixes from upstream
  patch -Np1 -i "${srcdir}/0013-new-jbig.c-limit-s-maxmem-maximum-decoded-image-size.patch"
  patch -Np1 -i "${srcdir}/0015-jbg_newlen-check-for-end-of-file-within-MARKER_NEWLE.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  make EXTRA_CFLAGS="${CFLAGS}" lib
}

check() {
  cd "${srcdir}/${_pkgsrc}/libjbig"
  make test
}

package() {
  cd "${srcdir}/${_pkgsrc}/libjbig"
  for lib in "${provides[@]}"; do
    install -vDm644 "${lib}" "${pkgdir}/usr/lib32/${lib}.${pkgver}"
    ln -vsf "${lib}.${pkgver}" "${pkgdir}/usr/lib32/${lib}"
  done
}
