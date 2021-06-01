# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=cef-minimal-obs-bin
_version="76.1.13"
#_version="87.1.14"
_commit="f19c584"
#_commit="a29e9a3"
_chromiumver="76.0.3809.132"
#_chromiumver="87.0.4280.141"
pkgver="${_version}+g${_commit}+chromium_${_chromiumver}"
_cefver="${_version}+g${_commit}+chromium-${_chromiumver}"
pkgrel=1
pkgdesc="Chromium Embedded Framework minimal release needed by OBS Studio release"
arch=("i686" "x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "libxss" "pango" "libxcursor"
         "libxrandr" "libxcomposite" "at-spi2-atk" "libxdamage")
makedepends=("cmake" "make")
provides=("cef-minimal-obs")
conflicts=("cef-minimal-obs")
source_x86_64=("https://cef-builds.spotifycdn.com/cef_binary_${_cefver}_linux64_minimal.tar.bz2")
source_i686=("https://cef-builds.spotifycdn.com/cef_binary_${_cefver}_linux32_minimal.tar.bz2")
#source_aarch64=("https://cef-builds.spotifycdn.com/cef_binary_${_url_pkgver}_linuxarm64_minimal.tar.bz2")

sha256sums_x86_64=("6b0dfa8ddafcec822fcd20018cf081959ffa6d0565be3793da1f596ac0733c38")
#sha256sums_x86_64=("9a34dbb60b5eb3b6eb63420df6c55408dd84be70119b0f7ba72ea384d2af4835")
sha256sums_i686=("baa0624e2d6b86a60d18117cb65e125f882ef66cf413cd7ac63a480d904004f0")
#sha256sums_i686=("a214a7a180b2c1cd9b9009e23aac6462e813d9334995b7d8bbf4ecf335aa8b12")
#sha256sums_aarch64=("eb7ed49a020f06b54d4561a7d6811fa78b518035449c16a1cfd687cd3b2f6f5c")

if [[ $CARCH == 'x86_64' ]]; then
  _arch=64
elif [[ $CARCH == 'i686' ]]; then
  _arch=32
#elif [[ $CARCH == 'aarch64' ]]; then
#  _arch=arm64
fi

prepare() {
    cd "$srcdir"/cef_binary_${_cefver}_linux${_arch}_minimal
    sed -i 's/-Werror/#-Werror/g' cmake/cef_variables.cmake
}

build() {
    cd "$srcdir"/cef_binary_${_cefver}_linux${_arch}_minimal
    cmake .
    make libcef_dll_wrapper
}

package() {
    mkdir -p "$pkgdir"/opt/cef-obs/
    cp -R "$srcdir"/cef_binary_${_cefver}_linux${_arch}_minimal/* "$pkgdir"/opt/cef-obs
    rm -rf "$pkgdir"/opt/cef-obs/CMakeFiles/3.20.3/CompilerIdC/tmp
    rm -rf "$pkgdir"/opt/cef-obs/CMakeFiles/3.20.3/CompilerIdCXX/tmp
    rm -rf "$pkgdir"/opt/cef-obs/CMakeFiles/CMakeTmp
    install -Dm644 "$srcdir"/cef_binary_${_cefver}_linux${_arch}_minimal/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

