# Maintainer:

: ${_date:=260418}
: ${_pkgs=AL:widescreen}

_pkgname="wsjtx"
pkgbase="$_pkgname-improved-qt6"
pkgname=("$_pkgname-improved-qt6")
pkgver=3.1.0
pkgrel=3
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
  'c73448bfee030f77dc7617d0d67447aa57e72a816a085ee05a0774d876edb725'
  '7370a46a47ca664faf5d32dd3e5005820a305f7ce848a501269508cb23b7a3a8'
  '5c1ec232d173afe6d1db54aa2f3a777eed68c4bdabd39b93ad81f914ede758fa'
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
