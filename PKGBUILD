# Maintainer: Chilledheart <hukeyue@hotmail.com>
# Contributor: Chilledheart <hukeyue@hotmail.com>

pkgname=yass-new
pkgver=1.3.13
pkgrel=1
pkgdesc="lightweight http/socks proxy"
arch=(i686 x86_64)
url="https://github.com/Chilledheart/yass"
license=('GPL 2.0')
depends=(gcc-libs glibc gtk4)
optdepends=(gtk-update-icon-cache)
makedepends=(git ninja perl pkg-config cmake gtk4 gettext curl go)
checkdepends=("curl")
provides=(yass)
conflicts=(yass-git)
source=(
  "yass-${_pkgver}.tar.gz::https://github.com/Chilledheart/yass/releases/download/${_pkgver}/yass-${_pkgver}.tar.gz"
  )
sha256sums=('197111e200b19b6e0fb00384b587cb6218e5702cb458ae6bd6f2930e3db7c5d8')

prepare() {
  SRC_DIR="${srcdir}/yass-${_pkgver}/src"
  pushd $SRC_DIR
  ./scripts/download-clang-prebuilt-binaries.py
  cd tools
  go build
  cd ..
  popd
}

build(){
  SRC_DIR="${srcdir}/yass-${_pkgver}/src"
  pushd $SRC_DIR
  export CC=$PWD/third_party/llvm-build/Release+Asserts/bin/clang
  export CXX=$PWD/third_party/llvm-build/Release+Asserts/bin/clang++
  ./tools/build --variant gui --system linux -build-test
  popd
}

check() {
  SRC_DIR="${srcdir}/yass-${_pkgver}/src"
  pushd $SRC_DIR
  ./build-linux-amd64/yass_test
  popd
}

package(){
  SRC_DIR="${srcdir}/yass-${_pkgver}/src"
  pushd $SRC_DIR

  install -Dm755 build-linux-amd64/yass ${pkgdir}/usr/bin/yass
  install -Dm644 build-linux-amd64/LICENSE ${pkgdir}/usr/share/licenses/yass/LICENSE

  install -Dm644 src/gtk/yass.desktop ${pkgdir}/usr/share/applications/yass.desktop
  install -Dm644 src/gtk/icons/16x16/apps/yass.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/yass.png
  install -Dm644 src/gtk/icons/22x22/apps/yass.png ${pkgdir}/usr/share/icons/hicolor/22x22/apps/yass.png
  install -Dm644 src/gtk/icons/24x24/apps/yass.png ${pkgdir}/usr/share/icons/hicolor/24x24/apps/yass.png
  install -Dm644 src/gtk/icons/32x32/apps/yass.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/yass.png
  install -Dm644 src/gtk/icons/48x48/apps/yass.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/yass.png
  install -Dm644 src/gtk/icons/128x128/apps/yass.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/yass.png
  install -Dm644 src/gtk/icons/256x256/apps/yass.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/yass.png
  install -Dm644 src/gtk/icons/512x512/apps/yass.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/yass.png

  popd
}
