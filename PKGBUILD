# Maintainer: shootingstargragon
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat-localflutter
_pkgname=fluffychat
pkgver=1.5.0
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
             #'flutter'
             'webkit2gtk')
optdepends=('libolm: E2E Encryption support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("fluffychat-v${pkgver}.tar.gz::https://gitlab.com/famedly/fluffychat/-/archive/v${pkgver}/fluffychat-v${pkgver}.tar.gz")
sha256sums=('f71cacae90ca6f1e5748619208dd277eaba81cf401cd4542dfce5f364b505b3a')

# Check the fluffer environment your self

build() {

  cd ${_pkgname}-v$pkgver
  flutter build linux --release --verbose
}

package() {  
  # install
  install -dm755 ${pkgdir}/opt
  mv ${_pkgname}-v$pkgver/build/linux/x64/release/bundle ${pkgdir}/opt/${_pkgname}
  
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
