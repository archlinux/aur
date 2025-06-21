# Maintainer: shootingstargragon
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat-localflutter
_pkgname=fluffychat
pkgver=2.0.0
pkgrel=3
pkgdesc="Chat with your friends, be careful about your flutter environment"
arch=('x86_64' 'aarch64')
url="https://fluffychat.im/"
license=('AGPL3')
depends=('gtk3' 'jsoncpp' 'libsecret' 'zenity' 'libolm')
makedepends=('clang'
             'ninja'
             'cmake'
             'git'
             'unzip'
             #'flutter'
             'webkit2gtk')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "fluffychat-v${pkgver}.tar.gz::https://github.com/krille-chan/fluffychat/archive/refs/tags/v${pkgver}.zip"
  "notification.patch"
)
options+=(!lto)
sha256sums=(
  '1da34d13b757cb203fd5e48b4b6502a629399e241cd013fa9df003249a9d8518'
  '8952c37fa0389b33c2d9cb057af9f579d05bd18f61e279e3a0209de0a8b961cf'
)

prepare() {
  cd ${_pkgname}-$pkgver
  patch -Np1 -i "$srcdir/notification.patch"
}

# Check the fluffer environment yourself
build() {

  cd ${_pkgname}-$pkgver
  flutter build linux --release --verbose
}

package() {
  # install
  install -dm755 ${pkgdir}/opt
  mv ${_pkgname}-$pkgver/build/linux/x64/release/bundle ${pkgdir}/opt/${_pkgname}
  
  # link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}

  # icon
  install -Dm 644 ${pkgdir}/opt/${_pkgname}/data/flutter_assets/assets/favicon.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

  # desktop entry

  install -dm 755 "${pkgdir}/usr/share/applications"
  cat > ${pkgdir}/usr/share/applications/${_pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Version=${pkgver}
Name=FluffyChat
Comment=Matrix Client. Chat with your friends
Exec=${_pkgname}
Icon=${_pkgname}
Terminal=false
EOF

}

# vim: set sw=2 ts=2 et:
