# Maintainer: NexAdn <nexadn@yandex.com>
pkgname=cef-standard
pkgver=3.3202
_subver_i686=1682.gab7e7f0
_subver_x86_64=${_subver_i686}
pkgrel=2
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
sha1sums_i686=('ad8b9503c0ae361cc7892ec9e52f13977ec4cfc4')
sha1sums_x86_64=('b3b5a6a394a7579b905f3dec99055017eddf8c00')
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
