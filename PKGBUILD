# Maintainer: NexAdn <nexadn@yandex.com>
pkgname=cef-standard
pkgver=3.3239
_subver_i686=1709.g093cae4
_subver_x86_64=${_subver_i686}
pkgrel=1
pkgdesc="Chromium Embedded Framework standard release"
arch=("i686" "x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "atk" "gconf" "pango" "libxrandr" "libxcursor" "libxss" "libxtst" "libxcomposite" "gtk2")
makedepends=("cmake" "make")
provides=("cef" "cef-minimal")
conflicts=("cef-minimal")
source_i686=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}.${_subver_i686}_linux32.tar.bz2"
)
source_x86_64=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}.${_subver_x86_64}_linux64.tar.bz2"
)
sha1sums_i686=('e555a2abf194195b8d8e9c52c508005b290f81ca')
sha1sums_x86_64=('c154ed21bd81263696d5e47c9acca2ee936f2576')
[[ "$CARCH" = "i686" ]] && _arch="32" && _subver=$_subver_i686
[[ "$CARCH" = "x86_64" ]] && _arch="64" && _subver=$_subver_x86_64
build() {
    cd "$srcdir"/cef_binary_${pkgver}.${_subver}_linux${_arch}
    sed '/^add_subdirectory[\(]tests[\/].*/d' -i CMakeLists.txt
    cmake .
    make clean
    make -j4 libcef_dll_wrapper
}
package() {
    install -dm755 "$pkgdir"/opt/cef/
    cp -R "$srcdir"/cef_binary_${pkgver}.${_subver}_linux${_arch}/* "$pkgdir"/opt/cef/
    install -Dm644 "$srcdir"/cef_binary_${pkgver}.${_subver}_linux${_arch}/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
