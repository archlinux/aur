# Maintainer: shootingstargragon
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat-localflutter
_pkgname=fluffychat
pkgver=2.1.0
pkgrel=6
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
  "xdp_selector.patch"
  'notification.patch'
)
options+=(!lto)
sha256sums=(
  'b43807318a246bfe5080a56ab96e3c6560686c6c8d0cebd909d1dc684e76b0ae'
  'f34e424d55dfab98534de55623b58875bbd5b3e50a66c248730fe7a4676f7eb2'
  'ec299c4ba1ea8cc254f22307fb9267ac456b47e3275d2eb6cfec4aada0d6b390'
)

prepare() {
  cd ${_pkgname}-$pkgver
  patch -Np1 -i "$srcdir/xdp_selector.patch"
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
