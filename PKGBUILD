# Maintainer: xiota / aur.chaotic.cx

## options
: ${_build_avx:=false}
: ${_build_git:=false}

[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="fairy-stockfish"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=14.0.1
pkgrel=4
pkgdesc="A chess engine derived from Stockfish with support for fairy chess and other variants"
url="https://github.com/ianfab/Fairy-Stockfish"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL-3.0-only')

# main package
_main_package() {
  optdepends+=(
    'polyglot-winboard: For xboard support'
  )

  if [[ "${_build_git::1}" == "t" ]] || [[ "${_build_avx::1}" == "t" ]] ; then
    provides+=(stockfish="${pkgver%%.r*}")
    conflicts+=(stockfish)
  fi

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _tag="fairy_sf_${pkgver//./_}_xq"
  _pkgsrc="Fairy-Stockfish-$_tag"
  _pkgext="tar.gz"
  source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/$_tag.$_pkgext")
  sha256sums=('53914fc89d89afca7cfcfd20660ccdda125f1751f59a68b1f3ed1d4eb6cfe805')
}

# git package
_main_git() {
  makedepends+=('git')

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"

    git describe --long --tags --abbrev=8 --match="fairy_sf_[0-9]*" \
      | sed -E 's/^[^0-9]*//;s/_[a-z]+$//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

## common functions
prepare() {
  sed -e 's/^EXE = stockfish$/EXE = fairy-stockfish/' \
    -i "$_pkgsrc/src/Makefile"

  sed -E -e 's/^(\s*  ss <<) " XQ";$/\1 " LB";/' \
    -i "$_pkgsrc/src/misc.cpp"
}

build() {
  if [ "${_build_avx::1}" == "t" ] ; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
  fi

  # upstream stockfish / fairy-stockfish build scripts detect and force-enable cpu features,
  # ignoring user CFLAGS and CXXFLAGS, producing binaries that are unusable on some computers.
  #
  # The following replicates `make profile-build` without cpu-detection.
  cd "$_pkgsrc/src"
  _make=(make 'ARCH=" "')

  CXXFLAGS+=" -DLARGEBOARDS"
  CXXFLAGS+=" -DALLVARS"

  # "${_make[@]}" net
  printf "\nStep 1/4. Building instrumented executable ...\n"
  mkdir -p profdir
  "${_make[@]}" \
    EXTRACXXFLAGS='-fprofile-generate=profdir' \
    EXTRALDFLAGS='-lgcov' \
    all

  printf "\nStep 2/4. Running benchmark for pgo-build ...\n"
  ./fairy-stockfish bench > PGOBENCH.out

  printf "\nStep 3/4. Building optimized executable ...\n"

  "${_make[@]}" objclean
  "${_make[@]}" \
    EXTRACXXFLAGS='-fprofile-use=profdir -fno-peel-loops -fno-tracer' \
    EXTRALDFLAGS='-lgcov' \
    all

  printf "\nStep 4/4. Deleting profile data ...\n"
  "${_make[@]}" profileclean
}

package() {
  cd "$_pkgsrc/src"
  make PREFIX="$pkgdir/usr" install
}

# execute
_main_package
