# Maintainer: Stefen Wakefield <me@xstefen.dev>

_pkgname="xmap"
pkgname="$_pkgname-git"
pkgver=2.0.5.r0.geee573e
pkgrel=1
pkgdesc="Fast Internet-wide IPv6 & IPv4 network scanner"
url="https://github.com/idealeer/xmap"
license=('Apache-2.0')
arch=('x86_64')

depends=('gmp' 'libpcap' 'json-c' 'libunistring')
makedepends=('byacc' 'cmake' 'flex' 'gengetopt' 'git' 'ninja')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("git+https://github.com/idealeer/xmap.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -E 's|DESTINATION sbin|DESTINATION bin|' -i "$_pkgsrc/src/CMakeLists.txt"
  sed '/set(XMAP_VERSION DEVELOPMENT)/d' -i "$_pkgsrc/CMakeLists.txt"
}

build() {
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2} -Wno-error=int-conversion"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DENABLE_DEVELOPMENT=OFF
    -DENABLE_LOG_TRACE=OFF
    -DXMAP_VERSION="AUR $pkgver"
    -Wno-dev
  )
  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
