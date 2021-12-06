# Maintainer: Ilya Basin <basinilya at gmail dot com>
# https://github.com/msys2/MINGW-packages/tree/master/mingw-w64-meanwhile

# Contributor: Troy C < rstrox -ta yahoo -tod com >
# Contributor: Marek Skrobacki <skrobul@skrobul.com>
# Contributor: Alasdair Haswell <ali at arhaswell dot co dot uk>
# Maintainer: Zach Bacon <11doctorwhocanada@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
MINGW_PACKAGE_PREFIX=mingw-w64
_adapt_msys2() {
  MINGW_CHOST=${_arch:?}
  MINGW_PREFIX=/usr/${_arch:?}
  CARCH=${_arch%%-*}
}
options=(!strip !buildflags)

_realname=meanwhile
pkgbase=mingw-w64-${_realname}
pkgname=("${MINGW_PACKAGE_PREFIX}-${_realname}")
pkgver=1.0.2
pkgrel=1
pkgdesc="Meanwhile libraries (mingw64)"
arch=('any')
mingw_arch=('mingw32' 'mingw64' 'ucrt64' 'clang64' 'clang32')
url="https://sourceforge.net/projects/meanwhile"
license=(LGPL2)
depends=("${MINGW_PACKAGE_PREFIX}-glib2")
conflicts=("${MINGW_PACKAGE_PREFIX}-${_realname}-svn")
source=(https://downloads.sourceforge.net/sourceforge/meanwhile/${_realname}-${pkgver}.tar.gz
        format-security.patch
        broken-status.patch
        fix_glib_includes.patch
        fix_groupchat.patch)
sha256sums=('38a8059eaa549cbcb45ca0a5b453e9608ceadab360db2ae14581fb22ddabdf23'
            SKIP
            '9a60e2ca35d902d5dd9647254a20099ceb399a025f1b04c2676f90ffe2d276f0'
            'c3dc0e423f7f4ceee65e4c08c1daebee23c61c608b970185074d118ed0199c47'
            '90467c648c18086a3f7989b7bab8f21eb44631c19a7d531121e927a0a1e74e9c')

prepare() {
  cd ${srcdir}/${_realname}-${pkgver}
  patch -Np1 -i "${srcdir}/format-security.patch"

  cd ${srcdir}/${_realname}-${pkgver}/src
  patch -Np0 -i "${srcdir}/broken-status.patch"
  patch -Np2 -i "${srcdir}/fix_glib_includes.patch"
  patch -Np2 -i "${srcdir}/fix_groupchat.patch"

}
build() {

  for _arch in ${_architectures}; do
  _adapt_msys2
  pushd .

  [[ -d "${srcdir}"/build-${CARCH} ]] && rm -rf "${srcdir}"/build-${CARCH}
  mkdir -p "${srcdir}"/build-${CARCH} && cd "${srcdir}"/build-${CARCH}
  #CFLAGS+=" -fno-stack-protector --param=ssp-buffer-size=4"
  #CXXFLAGS+=" -fno-stack-protector --param=ssp-buffer-size=4"
  export lt_cv_deplibs_check_method='pass_all'

  (
  . mingw-env ${_arch}

  LDFLAGS+=" -lssp"

  ${_arch}-configure \
    --disable-doxygen \
    --disable-mailme \
    --enable-static \
    --enable-shared \
    "LDFLAGS=${LDFLAGS}" \
    ../${_realname}-${pkgver}
  )

  make

  popd
  done
}

package() {

  for _arch in ${_architectures}; do
  _adapt_msys2
  pushd .

  cd "${srcdir}"/build-${CARCH}
  make DESTDIR=${pkgdir} install
  install -Dm644 "${srcdir}/${_realname}-${pkgver}/LICENSE" "${pkgdir}${MINGW_PREFIX}/share/licenses/${_realname}/LICENSE"

  popd
  done
}
