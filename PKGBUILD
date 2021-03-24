# Maintainer: garionion <garionion at entr0py.de>

pkgname=fluffychat
pkgver=0.28.0
_flutterversion=2.0.3-stable
pkgrel=1
pkgdesc="Chat with your friends"
arch=('x86_64')
url="https://fluffychat.im/"
license=('AGPL3')
makedepends=('clang'
             'ninja'
             'cmake'
             'git'
             'unzip')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
    "flutter-${_flutterversion}.tar.xz::https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_${_flutterversion}.tar.xz"
    "fluffychat-v${pkgver}.tar.gz::https://gitlab.com/famedly/fluffychat/-/archive/v${pkgver}/fluffychat-v${pkgver}.tar.gz")
sha256sums=('95c5045d0739187d961d24b7315e562d6b998c6ef7665aab7f199d3b2f1b4691'
            'a24fd9d565980b7beb7d21cf1f51230b613d4d66ae771a17e95a3711d85d47c5')

prepare() {
  export PATH="${srcdir}/flutter/bin:$PATH"
  flutter config --no-analytics
  flutter config --enable-linux-desktop
  #cd ${pkgname}-v$pkgver
  #echo "dependency_overrides:\n  intl: 0.17.0-nullsafety.2" >> pubspec.yaml
}

build() {
  export PATH="${srcdir}/flutter/bin:$PATH"
  cd ${pkgname}-v$pkgver
  flutter clean
  flutter pub get
  flutter build linux --release --verbose
}

package() {  
  # install
  install -dm755 ${pkgdir}/opt
  mv ${pkgname}-v$pkgver/build/linux/release/bundle ${pkgdir}/opt/${pkgname}
  
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
