# Maintainer: Zain Khan <zai1208@protonmail.com>
pkgname=pwss-browser-qt6-git
pkgver=1.0.r0.g$(date +%Y%m%d)
pkgrel=1
pkgdesc="Native Qt6 GUI frontend for the PWSS sovereign web toolchain"
arch=('x86_64')
url="https://blog.zain-khan.dev"
license=('GPL3')

# Core protocol scripts are now designated as true system package prerequisites
depends=('qt6-base' 'hicolor-icon-theme' 'pwss-core' 'pwss-fetch-https')
makedepends=('cmake' 'base-devel')
provides=('pwss-browser-qt6')
conflicts=('pwss-browser-qt6')

source=("local_src::git+file://${PWD}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/local_src"
  if git rev-parse --git-dir >/dev/null 2>&1; then
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  else
    date +%Y%m%d
  fi
}

build() {
  cd "${srcdir}/local_src"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/local_src"

  # Install ONLY the frontend binary
  install -Dm755 build/pwss-browser-qt6 "${pkgdir}/usr/bin/pwss-browser-qt6"

  # Deploy application desktop infrastructure
  if [ -f "pwss-browser.desktop" ]; then
    install -Dm644 pwss-browser.desktop "${pkgdir}/usr/share/applications/pwss-browser.desktop"
  fi

  # Deploy scalable vector icon asset
  if [ -f "pwss-browser.svg" ]; then
    install -Dm644 pwss-browser.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pwss-browser.svg"
  fi
}
