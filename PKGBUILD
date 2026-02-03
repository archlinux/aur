# Maintainer:
# Contributor: Leo Verto <leotheverto+aur@gmail.com>

: ${_build_v4:=true}

_pkgname="qlcplus"
pkgbase="$_pkgname-git"
pkgname=("${_pkgname}5-git")
pkgver=5.1.0.r112.g12d4745
pkgrel=2
pkgdesc="Q Light Controller Plus to control professional DMX lighting fixtures"
url="https://github.com/mcallegari/qlcplus"
license=('Apache-2.0')
arch=('x86_64' 'i686' 'armv7h')

depends=(
  'fftw'
  'libftdi'
  'libmad'
  'libsndfile'
  'qt6-3d'
  'qt6-multimedia'
  'qt6-serialport'
  'qt6-svg'
  'qt6-websockets'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt6-tools'
)
optdepends=(
  'ola: Open Lighting Architecture plugin'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"

  # unset unnecessary warnings and errors
  sed -E -e 's&^.*set\(.*-W.*$&&' -i variables.cmake

  # force Qt6
  sed -e 's&Qt5 Qt6&Qt6&' CMakeLists.txt
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[Rab]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # for lrelease
  export PATH="/usr/lib/qt6/bin:$PATH"

  local _cmake_common=(
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  local _cmake_5=(
    -B build5
    -Dqmlui=ON
  )

  echo "Building qlcplus5..."
  cmake "${_cmake_common[@]}" "${_cmake_5[@]}"
  cmake --build build5

  if [[ "${_build_v4::1}" == "t" ]]; then
    local _cmake_4=(
      -B build4
      -Dqmlui=OFF
    )

    echo "Building qlcplus4..."
    cmake "${_cmake_common[@]}" "${_cmake_4[@]}"
    cmake --build build4
  fi
}

package_qlcplus5-git() {
  DESTDIR="$pkgdir" cmake --install build5

  # fix launcher
  sed -E -e 's&^(Exec=qlcplus)$&\1-qml&' -i "$pkgdir"/usr/share/applications/qlcplus.desktop
  mv "$pkgdir"/usr/share/applications/{qlcplus,qlcplus-qml}.desktop

  # unwanted
  rm "$pkgdir"/usr/lib/*.a
}

if [[ "${_build_v4::1}" == "t" ]]; then
  pkgname+=("${_pkgname}4-git")

  package_qlcplus4-git() {
    DESTDIR="$pkgdir" cmake --install build4
  }
fi
