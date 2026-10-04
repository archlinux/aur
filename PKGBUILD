# Maintainer: shootingstargragon
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat-localflutter
_pkgname=fluffychat
pkgver=2.10.0
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
  "linux.patch"
)
options+=(!lto)
sha256sums=(
  '09bfe5524151e3f6ed6094e72e6b81fa03831411f46f667c4e559ee0d30ab392'
  '4361f23cbc8fb30ab3ef96975a392b284eea826d69f833084a032898d171113c'
)

prepare() {
  cd ${_pkgname}-$pkgver
  patch -Np1 -i "$srcdir/linux.patch"
}

# Check the fluffer environment yourself
build() {

  cd ${_pkgname}-$pkgver
  export CMAKE_GENERATOR="Unix Makefiles"
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
  install -Dm 644 ${pkgdir}/opt/${_pkgname}/data/flutter_assets/assets/logo/mini/logo_mini.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

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
