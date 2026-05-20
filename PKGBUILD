# Maintainer: Zain Khan <zai1208@protonmail.com>
pkgname=pwss-browser-qt6-git
pkgver=1.0.r0.g$(date +%Y%m%d)
pkgrel=1
pkgdesc="Native Qt6 GUI frontend for the PWSS sovereign web toolchain"
arch=('x86_64')
url="https://blog.zain-khan.dev"
license=('GPL3')

# Core protocol scripts are now designated as true system package prerequisites
depends=('qt6-base' 'hicolor-icon-theme' 'pwss-core-git' 'pwss-fetch-https-git')
makedepends=('cmake' 'base-devel')
provides=('pwss-browser-qt6')
conflicts=('pwss-browser-qt6')

source=("${pkgname}::git+https://github.com/zai1208/pwss-browser-qt6.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  # Standard clean git versioning string for the AUR
  printf "1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 build/pwss-browser-qt6 "${pkgdir}/usr/bin/pwss-browser-qt6"

  if [ -f "pwss-browser.desktop" ]; then
    install -Dm644 pwss-browser.desktop "${pkgdir}/usr/share/applications/pwss-browser.desktop"
  fi

  if [ -f "pwss-browser.svg" ]; then
    install -Dm644 pwss-browser.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pwss-browser.svg"
  fi
}
