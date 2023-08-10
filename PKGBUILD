# Maintainer: garionion <garionion at entr0py.de>
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat
pkgver=1.13.0
pkgrel=1
pkgdesc="Chat with your friends"
arch=('x86_64' 'aarch64')
url="https://fluffychat.im/"
license=('AGPL3')
depends=('gtk3' 'jsoncpp' 'libsecret' 'xdg-user-dirs' 'zenity' 'libolm')
makedepends=('clang'
             'ninja'
             'flutter'
             'cmake'
             'git'
             'gtk3')
provides=("$pkgname")
conflicts=("$pkgname")
source=("fluffychat-v${pkgver}.tar.gz::https://github.com/krille-chan/fluffychat/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('69685525a1621cd2b9a6a30f1ac1b87a4d697889b4f8adc04a3e02c694f95cfe')

prepare() {
  flutter --no-version-check --suppress-analytics config --enable-linux-desktop

  # overriding CMake flags for aarch64 in order to ensure build
  # is not failing
  if [[ "$(uname -m)" == "aarch64" ]]; then
    export CXXFLAGS="${CXXFLAGS/-fstack-protector-strong/ }"
    export CXXFLAGS="${CXXFLAGS/-fstack-clash-protection/ }"

    export CFLAGS="${CFLAGS/-fstack-protector-strong/ }"
    export CFLAGS="${CFLAGS/-fstack-clash-protection/ }"
  fi
  
  cd ${pkgname}-$pkgver
  flutter --no-version-check --suppress-analytics clean
  flutter --no-version-check --suppress-analytics pub get 
}

build() {
  cd ${pkgname}-$pkgver
  flutter --no-version-check --suppress-analytics build linux --release --verbose
}

package() {  
  case "$(uname -m)" in
    "x86_64")
      export FLUTTER_ARCH="x64"
      ;;
    "aarch64")
      export FLUTTER_ARCH="arm64"
      ;;
  esac

  # install
  install -dm755 ${pkgdir}/opt
  mv ${pkgname}-$pkgver/build/linux/$FLUTTER_ARCH/release/bundle ${pkgdir}/opt/${pkgname}
  
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
Comment=Open. Nonprofit. Cute. Easy to use (matrix) messenger. Secure and decentralized.
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
EOF

}

# vim: set sw=2 ts=2 et:
