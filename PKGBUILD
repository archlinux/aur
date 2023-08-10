# Maintainer: Chilledheart <hukeyue@hotmail.com>
# Contributor: Chilledheart <hukeyue@hotmail.com>

pkgname=yass-git
pkgver=1.3.0.r559.g9fb4e9f
pkgrel=1
pkgdesc="lightweight http/socks proxy"
arch=(x86_64)
url="https://github.com/Chilledheart/yass"
license=('GPL 2.0')
depends=(gcc-libs glibc gtk4)
makedepends=(git ninja perl pkg-config cmake gtk4 gettext curl go)
checkdepends=("curl")
provides=(yass)
conflicts=(yass)
source=("git+https://github.com/Chilledheart/yass.git")
sha256sums=('SKIP')

prepare() {
  cd yass
  git submodule update --init
  ./scripts/download-clang-prebuilt-binaries.py
  cd tools
  go build
  cd ..
}

pkgver() {
  cd yass
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd yass
  export CC=$PWD/third_party/llvm-build/Release+Asserts/bin/clang
  export CXX=$PWD/third_party/llvm-build/Release+Asserts/bin/clang++
  ./tools/build --variant gui --system linux -build-test
}

check() {
  cd yass
  ./build-linux-amd64/yass_test
}

package(){
  cd yass

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
}
