# Maintainer: Your Name <your.email@example.com>
pkgname=coppelia-git
pkgver=r10.840f54a
pkgrel=1
pkgdesc="A refined, cross-platform Jellyfin-focused music player"
arch=('x86_64')
url="https://github.com/Xmoncoco/coppelia"
license=('Apache')
depends=('gtk3' 'mpv')
makedepends=('git' 'flutter' 'cmake' 'ninja' 'pkgconf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Xmoncoco/coppelia.git"
        "coppelia.desktop")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  flutter clean
  flutter pub get
}

build() {
  cd "$srcdir/${pkgname%-git}"
  flutter build linux --release
}

package() {
  cd "$srcdir/${pkgname%-git}"

  # Install binary and bundle
  install -d "${pkgdir}/opt/${pkgname%-git}"
  cp -r build/linux/*/release/bundle/* "${pkgdir}/opt/${pkgname%-git}/"

  # Link the executable
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"

  # Install desktop file
  install -Dm644 "$srcdir/coppelia.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"

  # Install icon
  install -Dm644 assets/logo.png "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 assets/logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
}
