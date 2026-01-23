# Maintainer: shootingstargragon
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat-localflutter
_pkgname=fluffychat
pkgver=2.4.1
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
             )
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "fluffychat-v${pkgver}.tar.gz::https://github.com/krille-chan/fluffychat/archive/refs/tags/v${pkgver}.zip"
  'linux.patch'
)
options+=(!lto)
sha256sums=(
  'c47148b8a538ed138d6522ef6b8b41abbdef211735949b4c1b7ca2b4070e476a'
  '3bca33b0d2952f4de1de48e59509178375e3c18b6c4b17d90a2f6fae88940868'
)

prepare() {
  cd ${_pkgname}-$pkgver
  patch -Np1 -i "$srcdir/linux.patch"
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
