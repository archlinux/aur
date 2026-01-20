# Maintainer: Adrian <adrian@mxlinux.org>
# Note: Uses tags from the 'arch' branch
pkgname=mx-packageinstaller
pkgver=26.01.1
pkgrel=3
pkgdesc="MX Package Installer - a tool for managing packages and Flatpak"
arch=("x86_64")
url="https://github.com/MX-Linux/mx-packageinstaller"
license=("GPL")
depends=("qt6-base" "xdg-utils" "sudo" "socat")
makedepends=("cmake" "ninja" "qt6-tools")
source=("https://github.com/MX-Linux/mx-packageinstaller/archive/refs/tags/26.01.1.tar.gz")
sha256sums=('ce903236be6b5191df76ffc9eff9fb80b0f6a2adf8b52b0d65cec5712bdc1605')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build

  cmake -G Ninja .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

  ninja
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  DESTDIR="${pkgdir}" ninja install

  install -Dm755 mx-packageinstaller "${pkgdir}/usr/bin/mx-packageinstaller"

  install -dm755 "${pkgdir}/usr/share/mx-packageinstaller/locale"
  install -Dm644 *.qm "${pkgdir}/usr/share/mx-packageinstaller/locale/" 2>/dev/null || true

  install -dm755 "${pkgdir}/usr/lib/mx-packageinstaller"
  install -Dm755 ../scripts/helper "${pkgdir}/usr/lib/mx-packageinstaller/helper"
  install -Dm755 ../scripts/mxpi-lib "${pkgdir}/usr/lib/mx-packageinstaller/mxpi-lib"

  install -Dm644 ../scripts/org.mxlinux.pkexec.mxpi-helper.policy \
    "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mxpi-helper.policy"

  install -Dm644 ../mx-packageinstaller.desktop "${pkgdir}/usr/share/applications/mx-packageinstaller.desktop"

  install -Dm644 ../icons/mx-packageinstaller.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/mx-packageinstaller.png"
  install -Dm644 ../icons/mx-packageinstaller.png "${pkgdir}/usr/share/pixmaps/mx-packageinstaller.png"
  install -Dm644 ../icons/mx-packageinstaller.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-packageinstaller.svg"

  install -dm755 "${pkgdir}/usr/share/doc/mx-packageinstaller"
  if [ -d ../help ]; then
    cp -r ../help/* "${pkgdir}/usr/share/doc/mx-packageinstaller/" 2>/dev/null || true
  fi
}
