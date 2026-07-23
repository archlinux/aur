# Maintainer:

: ${_date:=260522}
: ${_pkgs=AL:widescreen}

_pkgname="wsjtx"
pkgbase="$_pkgname-improved-qt6"
pkgname=("$_pkgname-improved-qt6")
pkgver=3.1.0
pkgrel=4
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - WSJT-X Improved by DG2YCB"
url="https://sourceforge.net/projects/wsjt-x-improved/"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'fftw'
  'hamlib'
  'libboost_filesystem.so'
  'libboost_log.so'
  'libboost_log_setup.so'
  'libboost_thread.so'
  'libusb'
  'qt6-base'
  'qt6-multimedia'
  'qt6-serialport'
  'qt6-websockets'
)
makedepends=(
  'asciidoc'    # manpages
  'asciidoctor' # other docs
  'boost'
  'cmake'
  'gcc-fortran'
  'ninja'
  'patchelf'
  'qt6-tools'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_dl_url_base="https://downloads.sourceforge.net/project/wsjt-x-improved/WSJT-X_v$pkgver/Source%20code/Qt6"

_file="$_pkgname-improved-qt6-$pkgver-$_date.tar.gz"
noextract=("$_file")
source=("$_file"::"$_dl_url_base/wsjtx-${pkgver}_improved_PLUS_${_date}_qt6.tgz")

sha256sums=(
  '4c4262d8a4ff0189a64a97a55aa352509720db32b512c2a0cec0b6a096367324'
  '0fc92469a6b45b6448dd5fa536407d64a61304b3381ef198b7ee1b140dac0ab5'
  'c7fe58d9901e1de6b587fb5ccae8eea0694f387b2662c872e3081d9fa6218512'
)

for i in ${_pkgs//:/ }; do
  _file="$_pkgname-improved-${i,,}-qt6-$pkgver-$_date.tar.gz"
  pkgname+=("$_pkgname-improved-${i,,}-qt6")
  noextract+=("$_file")
  source+=("$_file"::"$_dl_url_base/wsjtx-${pkgver}_improved_${i}_PLUS_${_date}_qt6.tgz")
done

if [[ ! "$_pkgs" =~ AL ]]; then
  unset sha256sums[1]
fi

if [[ ! "$_pkgs" =~ widescreen ]]; then
  unset sha256sums[2]
fi

prepare() {
  for i in "${noextract[@]}"; do
    mkdir -p "${i%.tar.gz}"
    pushd "${i%.tar.gz}" > /dev/null
    bsdtar -xf "../$i" --strip-components 1
    bsdtar -xf src/wsjtx.tgz
    popd
  done
}

build() {
  for i in "${noextract[@]}"; do
    pushd "${i%.tar.gz}" > /dev/null
    printf "\nBuilding %s...\n" "${i%.tar.gz}"
    local _cmake_options=(
      -B build
      -S wsjtx
      -G Ninja
      -DCMAKE_BUILD_TYPE=None
      -DCMAKE_INSTALL_PREFIX='/usr'
      -DCMAKE_INSTALL_BINDIR="lib/$_pkgname"
      -Wno-dev
    )

    cmake "${_cmake_options[@]}"
    cmake --build build
    popd
  done
}

_package() {
  printf "\nPackaging %s...\n" "$pkgname"
  DESTDIR="$pkgdir" cmake --install "$pkgname-$pkgver-$_date"/build

  mkdir -pm755 "$pkgdir/usr/bin"
  ln -sf "/usr/lib/$_pkgname/wsjtx" "$pkgdir/usr/bin/wsjtx"

  # set rpath
  for i in "$pkgdir"/usr/lib/wsjtx/*; do
    if [ -f "$i" ] && [ -x "$i" ]; then
      patchelf --set-rpath '$ORIGIN' "$i"
    fi
  done
}

for _p in "${pkgname[@]}"; do
  if [[ "$_p" =~ -al- ]]; then
    pkg_suffix=", Alternative"
  elif [[ "$_p" =~ -widescreen- ]]; then
    pkg_suffix=", Widescreen"
  else
    pkg_suffix=", Standard"
  fi

  eval "package_${_p}() {
    pkgdesc+='$pkg_suffix'
    $(declare -f _package | tail -n +3)"
done
