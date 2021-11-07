# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=cef-minimal-obs-rc-bin
_version="95.7.10"
_commit="00d4ad5"
_chromiumver="95.0.4638.54"
_cefver="${_version}+g${_commit}+chromium-${_chromiumver}"
pkgver=`echo "$_cefver" | tr - _`
pkgrel=1
pkgdesc="Chromium Embedded Framework minimal release needed by OBS Studio beta release in /opt/cef-obs"
arch=("i686" "x86_64" "aarch64")
url="https://bitbucket.org/chromiumembedded/cef"
license=("BSD")
depends=("nss" "alsa-lib" "pango" "libxrandr" "libxcomposite"
         "at-spi2-atk" "libxkbcommon" "libcups" "mesa")
makedepends=("cmake")
provides=("cef-minimal-obs=$_version")
conflicts=("cef-minimal-obs")
# Prevent people from using link time optimisation for this package because it make OBS unable to be built against it
options=('!lto')
source_x86_64=("https://cef-builds.spotifycdn.com/cef_binary_${_cefver}_linux64_minimal.tar.bz2")
source_i686=("https://cef-builds.spotifycdn.com/cef_binary_${_cefver}_linux32_minimal.tar.bz2")
source_aarch64=("https://cef-builds.spotifycdn.com/cef_binary_${_cefver}_linuxarm64_minimal.tar.bz2")
sha256sums_x86_64=("12a7d1c0db75363efbafc70914759aad22162fd2d3a8142b9cc962e7c4f121d5")
sha256sums_i686=("8c6a375d77efb996a5ff93ad2871a5da71bd84a3cb24bd0e5a3456cd7d9ea98d")
sha256sums_aarch64=("5fa68eba7cb13fa95f323013378a03bf69b370b57d16820fa47cb110fe3cd91d")

if [[ $CARCH == 'x86_64' ]]; then
  _arch=64
  _parch=x86_64
elif [[ $CARCH == 'i686' ]]; then
  _arch=32
  _parch=x86
elif [[ $CARCH == 'aarch64' ]]; then
  _arch=arm64
  _parch=arm64
fi

prepare() {
    cd "$srcdir"/cef_binary_${_cefver}_linux${_arch}_minimal
    sed -i 's/-Werror/#-Werror/g' cmake/cef_variables.cmake
}

build() {
    cd "$srcdir"/cef_binary_${_cefver}_linux${_arch}_minimal

    #The arm64 CEF set the wrong arch for the project
    cmake -DPROJECT_ARCH=$_parch .

    make libcef_dll_wrapper
}

package() {
    mkdir -p "$pkgdir"/opt/cef-obs/
    cp -R "$srcdir"/cef_binary_${_cefver}_linux${_arch}_minimal/* "$pkgdir"/opt/cef-obs
    rm -rf "$pkgdir"/opt/cef-obs/CMakeFiles
    rm -rf "$pkgdir"/opt/cef-obs/libcef_dll_wrapper/CMakeFiles
    install -Dm644 "$srcdir"/cef_binary_${_cefver}_linux${_arch}_minimal/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
