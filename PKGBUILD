# Maintainer: garionion <garionion at entr0py.de>
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat
pkgver=0.30.1
_flutterversion=2.0.6-stable
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
sha256sums=('2523bc997fb16cefcf50f88a30d9dd5ce34e24a15e5eeb23a5caddfe5012ba80'
            'bf223d13360b4661c07a77905df488e9eadbd8387550380b20a8a933b46ab5ef')

prepare() {
  export PATH="${srcdir}/flutter/bin:$PATH"
  flutter config --no-analytics
  flutter config --enable-linux-desktop
}

build() {
  export PATH="${srcdir}/flutter/bin:$PATH"
  cd ${pkgname}-v$pkgver
  flutter clean
  #flutter pub get
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
