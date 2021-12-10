# Active Maintainers: Anderson Rocha <anderson2320@gmail.com>

pkgname=cef-standard
pkgver="96.0.17"
_pkgcommit="g20e2617"
_chromiumver="96.0.4664.93"
_pkgver="${pkgver}+${_pkgcommit}+chromium-${_chromiumver}"
_url_pkgver="${pkgver}%2B${_pkgcommit}%2Bchromium-${_chromiumver}"
pkgrel=1
pkgdesc="Chromium Embedded Framework standard release"
arch=("i686" "x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "at-spi2-atk" "pango" "libxrandr" "libxcursor" "libxss" "libxtst" "libxcomposite" "libglvnd" "dbus")
makedepends=("cmake" "make")
provides=("cef" "cef-minimal")
conflicts=("cef-minimal" "cef-git" "cef-minimal-3770-bin")
cdn_build_package_url="https://cef-builds.spotifycdn.com"

source_i686=(
  "${cdn_build_package_url}/cef_binary_${_url_pkgver}_linux32.tar.bz2"
)
source_x86_64=(
  "${cdn_build_package_url}/cef_binary_${_url_pkgver}_linux64.tar.bz2"
)

sha1sums_i686=("5fc4cf45f08db99d139f47ce02d4105dd89513fb")
sha1sums_x86_64=("2a5ba45ff7479781309905ba8b4d612243712a45")

[[ "$CARCH" = "i686" ]] && _arch="32"
[[ "$CARCH" = "x86_64" ]] && _arch="64"

build() {
  cd "$srcdir"/cef_binary_${_pkgver}_linux${_arch}
  sed '/^add_subdirectory[\(]tests[\/].*/d' -i CMakeLists.txt
  sed 's/-Werror/#-Werror/g' -i cmake/cef_variables.cmake
  CMAKE_BUILD_TYPE=Release cmake .
  CMAKE_BUILD_TYPE=Release make libcef_dll_wrapper
}

package() {
  install -dm755 "$pkgdir"/opt/cef/
  cp -R "$srcdir"/cef_binary_${_pkgver}_linux${_arch}/* "$pkgdir"/opt/cef/
  install -Dm644 "$srcdir"/cef_binary_${_pkgver}_linux${_arch}/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
