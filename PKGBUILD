# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=cef-minimal-obs-rc-bin
_cefver="95.0.0-MediaHandler.2462"
_version=${_cefver//-/_}
_commit="95e19b8"
_cefbranch="4638"
_chromiumver="95.0.${_cefbranch}.69"
pkgver="${_version}+g${_commit}+chromium_${_chromiumver}"
pkgrel=2
epoch=1
pkgdesc="Chromium Embedded Framework minimal release needed by OBS Studio beta release in /opt/cef-obs"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/obsproject/cef/tree/MediaHandler"
license=("BSD")
depends=("nss" "alsa-lib" "pango" "libxrandr" "libxcomposite"
         "at-spi2-atk" "libxkbcommon" "libcups" "mesa")
makedepends=("cmake")
provides=("cef-minimal-obs")
conflicts=("cef-minimal-obs")
# Prevent people from using link time optimisation for this package because it make OBS unable to be built against it
options=('!lto')
source_x86_64=("https://cdn-fastly.obsproject.com/downloads/cef_binary_${_cefbranch}_linux64.tar.bz2")
sha256sums_x86_64=("3c7707b13ca99c220e1650381f3d301c016f5c6ed6f478b83223645031fb13b9")


# Kept for future-proofing, OBS now provide a custom CEF with some additions only for x86_64
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
    cd "$srcdir"/cef_binary_${_cefbranch}_linux${_arch}
    sed -i 's/-Werror/#-Werror/g' cmake/cef_variables.cmake
}

build() {
    cd "$srcdir"/cef_binary_${_cefbranch}_linux${_arch}

    #The arm64 CEF set the wrong arch for the project
    cmake -DPROJECT_ARCH=$_parch .

    make libcef_dll_wrapper
}

package() {
    mkdir -p "$pkgdir"/opt/cef-obs/
    cp -R "$srcdir"/cef_binary_${_cefbranch}_linux${_arch}/* "$pkgdir"/opt/cef-obs
    rm -rf "$pkgdir"/opt/cef-obs/CMakeFiles
    rm -rf "$pkgdir"/opt/cef-obs/libcef_dll_wrapper/CMakeFiles
    install -Dm644 "$srcdir"/cef_binary_${_cefbranch}_linux${_arch}/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
