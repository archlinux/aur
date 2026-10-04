# Maintainer: aur.chaotic.cx

: ${_pkgs=AL:widescreen}

_pkgname="wsjtx"
pkgbase="$_pkgname-improved-qt6"
pkgname=("$_pkgname-improved-qt6")
pkgver=3.2.0+260924
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
  'patchelf'
  'qt6-tools'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_dl_url_base="https://downloads.sourceforge.net/project/wsjt-x-improved/WS_v${pkgver%+*}/Source%20code/Qt6"

_file="$_pkgname-improved-qt6-$pkgver.tar.gz"
noextract=("$_file")
source=("$_file"::"$_dl_url_base/ws-${pkgver%+*}_${pkgver#*+}_qt6.tgz")

sha256sums=(
  '73422be3c137e21f11d4beaa1c6a2b4c110e12a443cad6c320d8c84a3c614aeb'
  '73673f48fdaee9a270dd508c511f07723c5c1ef539f92d5ce59444572c58107c'
  'd418193681f787163456ad210e6a7e0d4c036f4bdc72250ab128f74363a90a4d'
)

for i in ${_pkgs//:/ }; do
  _file="$_pkgname-improved-${i,,}-qt6-$pkgver.tar.gz"
  pkgname+=("$_pkgname-improved-${i,,}-qt6")
  noextract+=("$_file")
  source+=("$_file"::"$_dl_url_base/ws-${pkgver%+*}_${i}_${pkgver#*+}_qt6.tgz")
done

if [[ ! "$_pkgs" =~ AL ]]; then
  unset sha256sums[1]
fi

if [[ ! "$_pkgs" =~ widescreen ]]; then
  unset sha256sums[2]
fi

prepare() {
  for i in "${noextract[@]}"; do
    printf "Extracting %s...\n" "$i"
    mkdir -p "${i%.tar.gz}"
    pushd "${i%.tar.gz}" &> /dev/null
    bsdtar -xf "../$i" --strip-components 1
    bsdtar -xf src/ws.tgz
    popd &> /dev/null
  done
}

build() {
  export CFLAGS+=' -Wno-error=format-security'

  for i in "${noextract[@]}"; do
    pushd "${i%.tar.gz}" &> /dev/null
    printf "\nBuilding %s...\n" "${i%.tar.gz}"
    local _cmake_options=(
      -B build
      -S ws
      -G Ninja
      -DCMAKE_BUILD_TYPE=None
      -DCMAKE_INSTALL_PREFIX='/usr'
      -DCMAKE_INSTALL_BINDIR="lib/$_pkgname"
      -Wno-author
    )

    cmake "${_cmake_options[@]}"
    cmake --build build
    popd &> /dev/null
  done
}

_package() {
  printf "\nPackaging %s...\n" "$pkgname"
  DESTDIR="$pkgdir" cmake --install "$pkgname-$pkgver"/build

  mkdir -pm755 "$pkgdir/usr/bin"
  ln -sf "/usr/lib/$_pkgname/ws" "$pkgdir/usr/bin/ws"
  ln -sf "/usr/lib/$_pkgname/ws" "$pkgdir/usr/bin/wsjtx"

  # set rpath
  for i in "$pkgdir"/usr/lib/wsjtx/*; do
    if [ -f "$i" ] && readelf -h "$i" &> /dev/null; then
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
