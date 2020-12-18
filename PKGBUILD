# Maintainer: garionion <garionion@entr0py.de>

pkgname=fluffychat
_gitname=${pkgname}-flutter
pkgver=0.24.0
pkgrel=1
pkgdesc="Chat with your friends"
arch=('any')
url="https://fluffychat.im/"
license=('AGPL3')
makedepends=('clang'
             'ninja'
             'flutter-dev'
             'cmake')
optdepends=('pantalaimon: used for E2E encryption')
provides=("$pkgname")
conflicts=("$pkgname")
source=("fluffychat-flutter-v${pkgver}.tar.gz::https://gitlab.com/ChristianPauly/fluffychat-flutter/-/archive/v${pkgver}/fluffychat-flutter-v${pkgver}.tar.gz")
sha256sums=('14d11162cfe9a74b279c55c489cd9697daa575d02f7b564113fd98b184c74dd4')

prepare() {
  flutter config --enable-linux-desktop
}

build() {
  cd ${_gitname}-v$pkgver

  flutter build linux --release --verbose
}

package() {  
  # install
  install -dm755 ${pkgdir}/opt
  mv ${_gitname}-v$pkgver/build/linux/release/bundle ${pkgdir}/opt/${pkgname}
  
  # link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # icon
  install -Dm 644 ${pkgdir}/opt/${pkgname}/data/flutter_assets/assets/favicon.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

  # desktop entry

  install -dm 755 "${pkgdir}/usr/share/applications"
  cat > ${pkgdir}/usr/share/applications/${pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Version=${pkgver}
Name=FluffyChat
Comment=Matrix Client. Chat with your friends
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
EOF

}

# vim: set sw=2 ts=2 et:
