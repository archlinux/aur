# Maintainer: garionion <garionion@entr0py.de>

pkgname=fluffychat
_gitname=${pkgname}-flutter
pkgver=0.21.1
pkgrel=3
pkgdesc="Chat with your friends"
arch=('any')
url="https://fluffychat.im/"
license=('AGPL3')
makedepends=('clang'
             'ninja'
             'flutter'
             'cmake')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://gitlab.com/ChristianPauly/fluffychat-flutter.git")
sha256sums=('SKIP')


prepare() {
  flutter channel dev
  flutter upgrade
  flutter config --enable-linux-desktop

  cd ${_gitname}
  git checkout v$pkgver
  git submodule update --init --recursive
}

build() {
  cd ${_gitname}

  flutter build linux --release
}

package() {
  cd ${_gitname}
  
  # install
  install -dm755 ${pkgdir}/opt
  mv build/linux/release/bundle ${pkgdir}/opt/${pkgname}
  
  # link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # icon
  install -Dm 644 assets/favicon.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

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
