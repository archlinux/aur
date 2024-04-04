# Maintainer: garionion <garionion at entr0py.de>
# thanks to celogeek, sseneca, dr460nf1r3, dr460nf1r3 and AverytheFurry for pointing out multiple things

pkgname=fluffychat
pkgver=1.19.0
pkgrel=5
pkgdesc="Open. Nonprofit. Cute. Easy to use (matrix) messenger. Secure and decentralized."
arch=('x86_64' 'aarch64')
url="https://fluffychat.im/"
license=('AGPL3')
depends=(
        'gtk3'
        'jsoncpp'
        # flutter_secure_storage
        'libsecret'
        # path_provider
        'xdg-user-dirs'
        # for e2ee
        'libolm'
        # flutter_file_picker - see https://github.com/miguelpruivo/flutter_file_picker/blob/master/lib/src/linux/file_picker_linux.dart#L115
        'zenity'
        # sqlite encryption
        'openssl'
)
makedepends=(
             'flutter-tool'
             'flutter-target-linux'
  )
provides=("$pkgname")
conflicts=("$pkgname")
source=(
        "fluffychat-v${pkgver}.tar.gz::https://github.com/krille-chan/fluffychat/archive/refs/tags/v${pkgver}.tar.gz"
        "openssl-dynamic-link.patch"
)
sha256sums=('0fb007f2ed56ee46115606dae5eb2bb9eac238c344caae8d478eb80d71e6295f'
            '30cabdeb108d7766b55c002978d8ef64df4dfba2e3e7b872de774727afa50730')

prepare() {
  # overriding CMake flags for aarch64 in order to ensure build
  # is not failing
  if [[ "$(uname -m)" == "aarch64" ]]; then
    export CXXFLAGS="${CXXFLAGS/-fstack-protector-strong/ }"
    export CXXFLAGS="${CXXFLAGS/-fstack-clash-protection/ }"

    export CFLAGS="${CFLAGS/-fstack-protector-strong/ }"
    export CFLAGS="${CFLAGS/-fstack-clash-protection/ }"
  fi
  
  patch --follow-symlinks -p1 -i "${srcdir}/openssl-dynamic-link.patch" -d "${srcdir}/${pkgname}-${pkgver}"
  pushd "${srcdir}/${pkgname}-${pkgver}"
  flutter pub get
}

build() {
  cd ${pkgname}-$pkgver
  flutter build linux --no-pub --release --verbose
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
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Categories=Network;InstantMessaging;Chat;MatrixClient
EOF

}

# vim: set sw=2 ts=2 et:
