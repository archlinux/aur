# Maintainer: aur.chaotic.cx

: ${_pkgs=AL:widescreen}

_pkgname="wsjtx"
pkgbase="$_pkgname-improved-qt6"
pkgname=("$_pkgname-improved-qt6")
pkgver=3.2.0+260818
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

_dl_url_base="https://downloads.sourceforge.net/project/wsjt-x-improved/WSJT-X_v${pkgver%+*}/Source%20code/Qt6"

_file="$_pkgname-improved-qt6-$pkgver.tar.gz"
noextract=("$_file")
source=("$_file"::"$_dl_url_base/wsjtx-${pkgver%+*}_improved_PLUS_${pkgver#*+}_qt6.tgz")

sha256sums=(
  'adc573cbcaa41c2d414f0f858437ecf09208f3977e0707ddea5c6a11a9d71be3'
  '5c77cce3a54579f7e251ea6106b0a4d2cd2244af7ce4e2f4264d27620db829e7'
  'a4840c6ef0de0c4f80c19e79ee14361345bb5835662d99c6463259449d73fd04'
)

for i in ${_pkgs//:/ }; do
  _file="$_pkgname-improved-${i,,}-qt6-$pkgver.tar.gz"
  pkgname+=("$_pkgname-improved-${i,,}-qt6")
  noextract+=("$_file")
  source+=("$_file"::"$_dl_url_base/wsjtx-${pkgver%+*}_improved_${i}_PLUS_${pkgver#*+}_qt6.tgz")
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
    pushd "${i%.tar.gz}" > /dev/null
    bsdtar -xf "../$i" --strip-components 1
    bsdtar -xf src/wsjtx.tgz
    popd
  done
}

build() {
  export CFLAGS+=' -Wno-error=format-security'

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
      -Wno-author
    )

    cmake "${_cmake_options[@]}"
    cmake --build build
    popd
  done
}

_package() {
  printf "\nPackaging %s...\n" "$pkgname"
  DESTDIR="$pkgdir" cmake --install "$pkgname-$pkgver"/build

  mkdir -pm755 "$pkgdir/usr/bin"
  ln -sf "/usr/lib/$_pkgname/wsjtx" "$pkgdir/usr/bin/wsjtx"

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
