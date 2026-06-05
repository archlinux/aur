# Maintainer: Your Name <your.email@example.com>

pkgname=chroma-app
_pkgname=chroma
pkgver=1.1.0
pkgrel=1
pkgdesc="A cross-platform color palette and design token manager"
arch=('x86_64' 'aarch64')
url="https://github.com/M-Tre-Consulting/chroma-app"
license=('GPL-2.0-only')
depends=('gtk4' 'libadwaita' 'jsoncpp')
makedepends=('cmake' 'pkgconf' 'git')
source=("${_pkgname}-app::git+https://github.com/M-Tre-Consulting/chroma-app.git"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '659b7596a6aecbb7c7194b5160d28d2521a8987aada5512a71f586dc9da03c11')

pkgver() {
  cd "${srcdir}/${_pkgname}-app"
  git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//'
}

prepare() {
  cd "${srcdir}/${_pkgname}-app"
  local _latest_tag=$(git describe --tags $(git rev-list --tags --max-count=1))
  git checkout $_latest_tag
}

build() {
  cmake -B build -S "${srcdir}/${_pkgname}-app/apps/desktop-linux" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  # Install binary renamed to chroma
  install -Dm755 build/desktop-linux "${pkgdir}/usr/bin/${_pkgname}"

  # Install desktop file
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Install icon (grabbed from source directory)
  install -Dm644 "${srcdir}/${_pkgname}-app/apps/desktop-windows/ic_launcher.png" "${pkgdir}/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}-app/apps/ios/Chroma/Resources/Assets.xcassets/AppIcon.appiconset/AppIcon.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${_pkgname}-app/apps/desktop-windows/ic_launcher.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  # Install license
  install -Dm644 "${srcdir}/${_pkgname}-app/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
