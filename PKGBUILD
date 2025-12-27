# Maintainer:

: ${_date:=251212}
: ${_pkgs=AL:widescreen}

_pkgname="wsjtx"
pkgbase="$_pkgname-improved-qt6"
pkgname=("$_pkgname-improved-qt6")
pkgver=3.0.0
pkgrel=1
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
  'qt6-tools'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_dl_url_base="https://downloads.sourceforge.net/project/wsjt-x-improved/WSJT-X_v$pkgver/Source%20code/Qt6"

noextract=(
  "$_pkgname-improved-qt6-$pkgver.tar.gz"
)

source=("$_pkgname-improved-qt6-$pkgver.tar.gz"::"$_dl_url_base/wsjtx-${pkgver}_improved_PLUS_${_date}_qt6.tgz")
sha256sums=('46d9645e585e929ba1e3e9eb8e5e737419be1719d8db261120bca6868ac8a18a')

for i in ${_pkgs//:/ }; do
  pkgname+=("$_pkgname-improved-${i,,}-qt6")
  noextract+=("$_pkgname-improved-${i,,}-qt6-$pkgver.tar.gz")
  source+=("$_pkgname-improved-${i,,}-qt6-$pkgver.tar.gz"::"$_dl_url_base/wsjtx-${pkgver}_improved_${i}_PLUS_${_date}_qt6.tgz")
  sha256sums+=('SKIP')
done

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
      -Wno-dev
    )

    cmake "${_cmake_options[@]}"
    cmake --build build
    popd
  done
}

_package() {
  printf "\nPackaging %s...\n" "$pkgname"
  DESTDIR="$pkgdir" cmake --install "$pkgname-$pkgver"/build
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
