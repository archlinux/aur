# Maintainer: shootingstargragon
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat-localflutter
_pkgname=fluffychat
pkgver=1.16.0
pkgrel=1
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
source=("fluffychat-v${pkgver}.tar.gz::https://github.com/krille-chan/fluffychat/archive/refs/tags/v${pkgver}.zip")
sha256sums=('9de101e81751f240b3b997c94d890985cc9295dbc930752f60d0ed1390151218')

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
