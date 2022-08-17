# Maintainer: garionion <garionion at entr0py.de>
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat
pkgver=1.6.1
pkgrel=1
pkgdesc="Chat with your friends"
arch=('x86_64' 'aarch64')
url="https://fluffychat.im/"
license=('AGPL3')
depends=('gtk3' 'jsoncpp' 'libsecret')
makedepends=('clang'
             'ninja'
             'cmake'
             'git'
             'unzip'
             'flutter'
             'webkit2gtk')
optdepends=('libolm: E2E Encryption support')
provides=("$pkgname")
conflicts=("$pkgname")
source=("fluffychat-v${pkgver}.tar.gz::https://gitlab.com/famedly/fluffychat/-/archive/v${pkgver}/fluffychat-v${pkgver}.tar.gz")
sha256sums=('5608fc564c362739822f66165ab1738df410a34868ee48b14abb5d894f1992fb')

prepare() {
  flutter --no-version-check --suppress-analytics config --enable-linux-desktop
  
  cd ${pkgname}-v$pkgver
  flutter --no-version-check --suppress-analytics clean
  flutter --no-version-check --suppress-analytics pub get
}

build() {
  _flutter_dir="${srcdir}/flutter"
  PATH="${_flutter_dir}/bin:${PATH}"
  export PATH  

  cd ${pkgname}-v$pkgver
  flutter --no-version-check --suppress-analytics build linux --release --verbose
}

package() {  
  # install
  install -dm755 ${pkgdir}/opt
  mv ${pkgname}-v$pkgver/build/linux/x64/release/bundle ${pkgdir}/opt/${pkgname}
  
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
