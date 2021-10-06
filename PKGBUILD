# Maintainer: Anderson Rocha <anderson2320@gmail.com>

pkgname=cef-minimal
pkgver="94.4.9"
_pkgcommit="g09ee681"
_chromiumver="94.0.4606.71"
_pkgver="${pkgver}+${_pkgcommit}+chromium-${_chromiumver}"
_url_pkgver="${pkgver}%2B${_pkgcommit}%2Bchromium-${_chromiumver}"
pkgrel=1
pkgdesc="Chromium Embedded Framework minimal release"
arch=("i686" "x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "libxss" "libxtst" "libglvnd" "pango" "libxcursor" "dbus" "libxrandr" "libxcomposite" "at-spi2-atk")
makedepends=("cmake" "make")
provides=("cef")
conflicts=("cef-standard" "cef-git")
cdn_build_package_url="https://cef-builds.spotifycdn.com"

source_i686=(
  "${cdn_build_package_url}/cef_binary_${_url_pkgver}_linux32_minimal.tar.bz2"
)
source_x86_64=(
  "${cdn_build_package_url}/cef_binary_${_url_pkgver}_linux64_minimal.tar.bz2"
)

sha1sums_i686=("ce1420a59687a1b13080b0ef39e0c2aad29d7b33")
sha1sums_x86_64=("78b2c5edefaef0c45e75c37c68053730ca3f1791")

[[ "$CARCH" = "i686" ]] && _arch="32"
[[ "$CARCH" = "x86_64" ]] && _arch="64"

build() {
  cd "$srcdir"/cef_binary_${_pkgver}_linux${_arch}_minimal
  sed -i 's/-Werror/#-Werror/g' cmake/cef_variables.cmake
  cmake .
  make libcef_dll_wrapper
}

package() {
  mkdir -p "$pkgdir"/opt/cef/
  cp -R "$srcdir"/cef_binary_${_pkgver}_linux${_arch}_minimal/* "$pkgdir"/opt/cef
  install -Dm644 "$srcdir"/cef_binary_${_pkgver}_linux${_arch}_minimal/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE

  # Fix read permissions
  chmod 644 "$pkgdir"/opt/cef/libcef_dll_wrapper/libcef_dll_wrapper.a
}
