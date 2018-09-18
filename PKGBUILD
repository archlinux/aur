# Maintainer: NexAdn <nexadn@yandex.com>
pkgname=cef-minimal
pkgver=3.3497.1829.g004ef91
pkgrel=1
pkgdesc="Chromium Embedded Framework minimal release"
arch=("i686" "x86_64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "libxss" "libxtst" "libglvnd" "pango" "libxcursor" "dbus" "libxrandr" "libxcomposite" "atk")
makedepends=("cmake" "make")
provides=("cef")
conflicts=("cef-standard" "cef-git")
source_i686=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}_linux32_minimal.tar.bz2"
)
source_x86_64=(
    "http://opensource.spotify.com/cefbuilds/cef_binary_${pkgver}_linux64_minimal.tar.bz2"
)
sha1sums_i686=('849359ef8959c85cdcf63721651e55c6d54d6661')
sha1sums_x86_64=('3117963ae1be963c1c7240556844666595148823')
[[ "$CARCH" = "i686" ]] && _arch="32"
[[ "$CARCH" = "x86_64" ]] && _arch="64"
build() {
    cd "$srcdir"/cef_binary_${pkgver}_linux${_arch}_minimal
    sed '/^add_subdirectory[\(]tests[\/].*/d' -i CMakeLists.txt
    cmake .
    make clean
    make -j4 libcef_dll_wrapper
}
package() {
    mkdir -p "$pkgdir"/opt/cef/
    cp -R "$srcdir"/cef_binary_${pkgver}_linux${_arch}_minimal/* "$pkgdir"/opt/cef
    install -Dm644 "$srcdir"/cef_binary_${pkgver}_linux${_arch}_minimal/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
