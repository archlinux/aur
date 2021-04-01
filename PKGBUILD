# Maintainer: garionion <garionion at entr0py.de>
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat
pkgver=0.28.1
_flutterversion=2.0.3-stable
pkgrel=1
pkgdesc="Chat with your friends"
arch=('x86_64')
url="https://fluffychat.im/"
license=('AGPL3')
depends=('libolm')
makedepends=('clang'
             'ninja'
             'cmake'
             'git'
             'unzip'
             'gtk3')
source=(
    "flutter-${_flutterversion}.tar.xz::https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_${_flutterversion}.tar.xz"
    "fluffychat-v${pkgver}.tar.gz::https://gitlab.com/famedly/fluffychat/-/archive/v${pkgver}/fluffychat-v${pkgver}.tar.gz")
sha256sums=('95c5045d0739187d961d24b7315e562d6b998c6ef7665aab7f199d3b2f1b4691'
            '25defcb4419db484b2230c9da852d0f0c72898b94d442b9ebe3595dc04920d7c')

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
