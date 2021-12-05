# Maintainer: Ilya Basin <basinilya at gmail dot com>
# https://github.com/msys2/MINGW-packages/tree/master/mingw-w64-sqlite3
# Contributor: Alexey Pavlov <alexpux@gmail.com>
# Contributor: Renato Silva <br.renatosilva@gmail.com>
# Contributor: Brisingr Aerowing <ztgreve@live.com>

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
MINGW_PACKAGE_PREFIX=mingw-w64
_adapt_msys2() {
  MINGW_CHOST=${_arch:?}
  MINGW_PREFIX=/usr/${_arch:?}
}

_realname=sqlite3
pkgbase=mingw-w64-${_realname}
pkgname="${MINGW_PACKAGE_PREFIX}-${_realname}"
_sqlite_year=2021
_amalgamationver=3370000
_docver=${_amalgamationver}
pkgver=3.37.0
pkgrel=1
pkgdesc="A C library that implements an SQL database engine (mingw-w64)"
arch=('any')
mingw_arch=('mingw32' 'mingw64' 'ucrt64' 'clang64' 'clang32' 'clangarm64')
license=(PublicDomain)
url="https://www.sqlite.org"
provides=(${MINGW_PACKAGE_PREFIX}-sqlite=${pkgver}
          ${MINGW_PACKAGE_PREFIX}-sqlite-analyzer=${pkgver}
          ${MINGW_PACKAGE_PREFIX}-sqlite-docs=${pkgver})
conflicts=(${MINGW_PACKAGE_PREFIX}-sqlite-analyzer)
replaces=(${MINGW_PACKAGE_PREFIX}-sqlite-analyzer)
depends=(
  #"${MINGW_PACKAGE_PREFIX}-gcc-libs"
         "${MINGW_PACKAGE_PREFIX}-readline"
         "${MINGW_PACKAGE_PREFIX}-tcl")
makedepends=("${MINGW_PACKAGE_PREFIX}-gcc")
source=(https://www.sqlite.org/${_sqlite_year}/sqlite-src-${_amalgamationver}.zip
        https://www.sqlite.org/${_sqlite_year}/sqlite-doc-${_docver}.zip
        Makefile.ext.in
        README.md.in
        configure-cross.patch
        configure-linemacros.patch
        LICENSE)
sha256sums=('70977fb3942187d4627413afde9a9492fa02b954850812b53974b6a31ece8faf'
            '8af0c6a3e0850ecd5003d3318f28f0f15d3386d4e67c09eae6358a7b159a47d8'
            '4a8a87289253529cf04c916e5743c8727a5506b5185bc9bd4070b42037e8ae20'
            '5ca42f1f92abfb61bacc9ff60f5836cc56e2ce2af52264f918cb06c3d566d562'
            SKIP
            SKIP
            '0b76663a90e034f3d7f2af5bfada4cedec5ebc275361899eccc5c18e6f01ff1f')
options=('!strip' 'staticlibs' '!buildflags')

sqlite_tools="sqlite3_analyzer.exe dbhash.exe sqldiff.exe"

prepare() {
  cd "${srcdir}/sqlite-src-${_amalgamationver}"
  patch -Np1 -i ../configure-cross.patch
  patch -Np1 -i ../configure-linemacros.patch
  autoconf
}

build() {

  for _arch in ${_architectures}; do
  _adapt_msys2
  pushd .

  test -d ${srcdir}/build-${_amalgamationver}-${MINGW_CHOST} && \
    rm -rf ${srcdir}/build-${_amalgamationver}-${MINGW_CHOST}
  mkdir -p ${srcdir}/build-${_amalgamationver}-${MINGW_CHOST} && \
    cd ${srcdir}/build-${_amalgamationver}-${MINGW_CHOST}

  export lt_cv_deplibs_check_method='pass_all'

  SQLITE_OPTIONS="\
            -DSQLITE_ENABLE_COLUMN_METADATA=1 \
            -DSQLITE_USE_MALLOC_H=1 \
            -DSQLITE_USE_MSIZE=1 \
            -DSQLITE_DISABLE_DIRSYNC=1 \
            -DSQLITE_ENABLE_DBSTAT_VTAB=1 \
            -DSQLITE_SOUNDEX=1 \
            -DSQLITE_ENABLE_MATH_FUNCTIONS=1 \
  "

  CFLAGS+=" -fexceptions -fno-strict-aliasing ${SQLITE_OPTIONS}"
  LDFLAGS+=" -lssp"

  ${_arch}-configure \
    -C \
    --enable-threadsafe \
    --disable-editline \
    --enable-readline \
    --enable-all \
    --enable-session \
    --with-readline-inc=-I${MINGW_PREFIX}/include \
    --with-tcl=${MINGW_PREFIX}/lib \
    TCLLIBDIR=${MINGW_PREFIX}/lib/sqlite${pkgver} \
    ../sqlite-src-${_amalgamationver}

#    BUILD_EXEEXT=
#    TARGET_EXEEXT=.exe \

  make

  # build additional tools
  make $sqlite_tools

  # build extensions
  ./config.status --file=ext/misc/Makefile:../Makefile.ext.in
  make -C ext/misc

  popd
  done

}

check() {
  return 0
  cd "${srcdir}/build-${_amalgamationver}-${MINGW_CHOST}"
  # This test run lasts very loooong ... despite the target name
  make quicktest || true
}

package() {

  for _arch in ${_architectures}; do
  _adapt_msys2
  pushd .

  cd ${srcdir}/build-${_amalgamationver}-${MINGW_CHOST}
  make DESTDIR="${pkgdir}" install

  for t in $sqlite_tools; do
    install -Dm755 .libs/$t "${pkgdir}${MINGW_PREFIX}/bin/$t"
  done
  mv ${pkgdir}${MINGW_PREFIX}/lib/bin/*.* ${pkgdir}${MINGW_PREFIX}/lib/sqlite${pkgver}/
  rm -rf ${pkgdir}${MINGW_PREFIX}/lib/bin

  # Install extensions
  make -C ext/misc DESTDIR="${pkgdir}" install
  cat "${srcdir}/README.md.in" | sed        \
    -e "s|@MINGW_PREFIX@|${MINGW_PREFIX}|g" \
    -e "s|@MSYSTEM@|${MSYSTEM}|g;"          \
    -e "s|@VERSION@|${pkgver}|g;"           \
    > "${pkgdir}${MINGW_PREFIX}/share/sqlite/extensions/README.md"

  # Install docs
  cd ${srcdir}/sqlite-doc-${_docver}
  mkdir -p ${pkgdir}${MINGW_PREFIX}/share/doc/${_realname}
  cp -R *  ${pkgdir}${MINGW_PREFIX}/share/doc/${_realname}/

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}${MINGW_PREFIX}/share/licenses/${_realname}/LICENSE"

  popd
  done

}
