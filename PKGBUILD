# Maintainer: Anderson Rocha <anderson2320@gmail.com>
# Contributor: NexAdn <nexadn@yandex.com>

pkgname=cef-minimal
pkgver="121.2.14"
_pkgcommit="ga44b59f"
_chromiumver="121.0.6167.75"
_pkgver="${pkgver}+${_pkgcommit}+chromium-${_chromiumver}"
_url_pkgver="${pkgver}%2B${_pkgcommit}%2Bchromium-${_chromiumver}"
pkgrel=1
pkgdesc="Chromium Embedded Framework minimal release"
arch=("x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "libxss" "libxtst" "libglvnd" "pango" "libxcursor" "dbus" "libxrandr" "libxcomposite" "at-spi2-atk")
makedepends=("cmake" "make")
provides=("cef")
conflicts=("cef-standard" "cef-git")
cdn_build_package_url="https://cef-builds.spotifycdn.com"

source=(
  "${cdn_build_package_url}/cef_binary_${_url_pkgver}_linux64_minimal.tar.bz2"
)

b2sums=('1b844f25b7091fe210958ad3f42e03f85fc8e5c2008b13d2769489fd3170ef7333e4718b25a5220ee92051bf55208eedfddf07d9dbf5d4db131780e9637dcf48')

build() {
  cd "$srcdir"/cef_binary_${_pkgver}_linux64_minimal
  sed -i 's/-Werror/#-Werror/g' cmake/cef_variables.cmake

  CMAKE_BUILD_TYPE=Release cmake .
  CMAKE_BUILD_TYPE=Release make libcef_dll_wrapper
}

package() {
  mkdir -p "$pkgdir"/opt/cef/
  #DESTDIR="$pkgdir" cmake --install Release
  cp -R "$srcdir"/cef_binary_${_pkgver}_linux64_minimal/* "$pkgdir"/opt/cef
  install -Dm644 "$srcdir"/cef_binary_${_pkgver}_linux64_minimal/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE

  # Fix read permissions
  chmod 644 "$pkgdir"/opt/cef/libcef_dll_wrapper/libcef_dll_wrapper.a
}
