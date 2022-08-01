# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=cef-minimal-obs-rc-bin
_cefver="103.0.0-5060-shared-textures_143.2591"
_version=${_cefver//-/_}
_commit="4204d54"
_cefbranch="5060"
_chromiumver="103.0.${_cefbranch}.134"
_rebuild="0" # The tarball sometime can get rebuild by OBS Project
pkgver="${_version}+g${_commit}+chromium_${_chromiumver}_${_rebuild}"
pkgrel=2
epoch=1
pkgdesc="Chromium Embedded Framework minimal release needed by OBS Studio beta release in /opt/cef-obs"
arch=("x86_64")
url="https://github.com/obsproject/cef/tree/5060-shared-textures"
license=("BSD")
depends=("nss" "alsa-lib" "pango" "libxrandr" "libxcomposite"
         "at-spi2-atk" "libxkbcommon" "libcups" "mesa")
makedepends=("cmake")
provides=("cef-minimal-obs=$pkgver")
conflicts=("cef-minimal-obs")
# Prevent people from using link time optimisation for this package because it make OBS unable to be built against it
options=('!lto' '!strip' 'debug')
source_x86_64=("https://cdn-fastly.obsproject.com/downloads/cef_binary_${_cefbranch}_linux64.tar.bz2")
sha256sums_x86_64=("1fe9c09bb43e8d2be2c07b792e69fb51250782e68f2c8d1d30da2559cfb9ae0e")


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

build() {
    cd "$srcdir"/cef_binary_${_cefbranch}_linux${_arch}

    #The arm64 CEF set the wrong arch for the project
    cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DPROJECT_ARCH=$_parch .

    make libcef_dll_wrapper
}

package() {
    mkdir -p "$pkgdir"/opt/cef-obs/
    cp -R "$srcdir"/cef_binary_${_cefbranch}_linux${_arch}/* "$pkgdir"/opt/cef-obs
    rm -rf "$pkgdir"/opt/cef-obs/CMakeFiles
    rm -rf "$pkgdir"/opt/cef-obs/libcef_dll_wrapper/CMakeFiles
    install -Dm644 "$srcdir"/cef_binary_${_cefbranch}_linux${_arch}/LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
