# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

## Release site to check for new versions: https://rpl2.systella.fr/telechargements.php

_pkgname=rpl-2
pkgname="${_pkgname}"
pkgver=4.1.37
pkgrel=3
arch=(
  'x86_64'
  'i686'
  'armv7h'
  'armv6h'
  'aarch64'
  'pentium4'
  'riscv64'
)
license=(
  'CECILL-2.0'
  'GPL-3.0-or-later'
)
pkgdesc="RPL/2 ('Reverse Polish Lisp 2'), a programming language designed for scientific computations, inspired by RPL from HP calculators like HP28S, HP48, and others."
groups=()
url='https://rpl2.systella.fr/anglais.php'
depends=(
  'glibc'
  'libbz2.so'       # bzip2
  'libcrypto.so'    # openssl
  'libgcc_s.so'     # libgcc
  'libgfortran.so'  # libgfortran
  'liblzma.so'      # xz
  'libpq.so'        # postgresql-libs
  'libssl.so'       # openssl
  'libstdc++.so'    # libstdc++
  'libreadline.so'  # readline
  'libseccomp.so'   # libseccomp
  'libz.so'         # zlib
  'libzstd.so'      # zstd
  'lzlib'
  'mariadb-libs'
  #'giac'
  #'libao.so'
)
optdepends=(
  "bash:           For 'rplcc', 'rpllink', 'mkrplso'."
  'gnuplot:        For advanced graphical capabilities.'
  'texlive-bin:    To use printer commands.'
  'gv:             To use printer commands (view output).'
  "rpl-2-compiler: To compile RPL/2 code to standalone binary. ('rplc', See https://rpl2.systella.fr/produits.php#compilateur.)"
  'vim:            For vim support.'
)
makedepends=(
  'autoconf'
  'automake>=1.17'
  'awk'
  'make'
  'gcc>=4.3'
  'gcc-fortran>=4.3'
  # 'xorg-util-macros'  # Needed for 'autoreconf -fi' with '--enable-motif'.

  'bzip2'
  'expat'
  'glibc'
  'libgcc'
  'libstdc++'
  'libgomp'
  'libgfortran'
  'libseccomp'
  'libxmu'
  'libxt'
  'lzlib'
  'mariadb-libs'
  'postgresql-libs'
  'readline'
  'xz'
  'zlib'
  'zstd'
  # 'xbitmaps'  # Needed with '--enable-motif'.
  #'giac'
  #'gnuplot'
  #'libao'
)
checkdepends=()
provides=(
  "rpl-2-docs"
  # Provided tools, see https://rpl2.systella.fr/documentation.php
  "mkrplso=${pkgver}"
  "rplcc=${pkgver}"
  "rpllink=${pkgver}"
  "rplpp=${pkgver}"
  "rpltags=${pkgver}"
  "rplawk"
  "rplconvert"
  "rplfile"
  "rpliconv=${pkgver}"
)
conflicts=(
  "rpl"  # Actually, there just another package called 'rpl' which also installs '/usr/bin/rpl'. (https://aur.archlinux.org/packages/rpl | https://github.com/rrthomas/rpl)
  "rpl-2-docs"
  # Provided tools, see https://rpl2.systella.fr/documentation.php
  "mkrplso"
  "rplcc"
  "rpllink"
  "rplpp"
  "rpltags"
  "rplawk"
  "rplconvert"
  "rplfile"
  "rpliconv"
)
replaces=()
source=(
  "https://rpl2.systella.fr/download/rpl-${pkgver}.tar.bz2"
  "https://rpl2.systella.fr/download/reference_rpl_french.ps.bz2"
)
noextract=(
  "reference_rpl_french.ps.bz2"
)
sha256sums=(
  'd31be7d86aba19090994bfffe2f72cafb0417989076f08b559a5124d712a39e3'  # rpl-${pkgver}.tar.bz2
  'def1a0405b863fda0a07215a8eda63be56e21ba7b46d1f8c2b57df9b55465b48'  # reference_rpl_french.ps.bz2
)
validpgpkeys=()
options=('staticlibs')

prepare() {
  cd "${srcdir}/rpl-${pkgver}"

  local _config_opts=(
    --prefix=/usr
    --enable-recursive
    --enable-native
    # --enable-rplcas
    --disable-rplcas  # Currently (version 4.1.37), fails to built 'rplcas/giac-2.0.0'.
    --enable-optimization
    --enable-tex
    --enable-vim
    --disable-embedded-gnuplot
    --enable-gnuplot
    # --enable-motif
    --disable-motif   # Currently Segmentation Faults when building hellomotif.
    --disable-experimental  # Don't use --enable-experimental. When author uses experimental code sections, code in theses sections is very very experimental.
    --with-x
  )

  ./configure "${_config_opts[@]}"

  ## Enable the following when building with `--enable-motif`:
  #pushd tools/libXpm-3.5.16 2>/dev/null
  #autoreconf -f -i
  #popd 2>/dev/null
}

build() {
  cd "${srcdir}/rpl-${pkgver}"

  ## Silence some compiler warnings
  local _NOWARNINGS _warning _CFLAGSADDITIONS
  _NOWARNINGS=("unused-value" "unused-but-set-variable" "unused-label" "unused-function" "maybe-uninitialized" "misleading-indentation" "free-nonheap-object" "stringop-overread")
  _CFLAGSADDITIONS=" -fno-strict-overflow -std=gnu17 -malign-double -funsigned-char" # From default 'CFLAGS' in 'Makefile'.
  for _warning in "${_NOWARNINGS[@]}"; do
    _CFLAGSADDITIONS+=" -Wno-${_warning} -Wno-error=${_warning}"
  done
  CFLAGS+="${_CFLAGSADDITIONS} -Wno-incompatible-pointer-types -Wno-pointer-sign" # Additions that are only valid for '$CFLAGS' but not '$CXXFLAGS' go here.
  CXXFLAGS+="${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  FCFLAGS+=" -malign-double -fno-f2c" # From default 'FCFLAGS' in 'Makefile'.
  FFLAGS+="  -malign-double -fno-f2c" # From default 'FFLAGS' in 'Makefile'.
  export FCFLAGS
  export FFLAGS

  LDFLAGS+=" -pthread" # From default 'LDFLAGS' in 'Makefile'.
  export LDFLAGS

  make CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" FCFLAGS="${FCFLAGS}" FFLAGS="${FFLAGS}" LDFLAGS="${LDFLAGS}"
}

check() {
  cd "${srcdir}/rpl-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/rpl-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"           AUTHORS ChangeLog INSTALL LIMITATIONS NEWS README "${srcdir}/reference_rpl_french.ps.bz2"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/doc"       doc/README
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/examples"  examples/*
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"       COPYING Licence_CeCILL_V2-en.txt Licence_CeCILL_V2-fr.txt
}
