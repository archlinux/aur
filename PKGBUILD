# Maintainer: The one with the braid <the-one@with-the-braid.cf>
# thanks to nyanpasu64 for pointing out the wrong install path

pkgname=fluffychat-git
_name=fluffychat
pkgver=rc1.19.0.4.r4.g9a8f604f
pkgrel=1
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
             'git'
             'flutter-tool'
             'flutter-target-linux'
             )
provides=("$_name")
conflicts=("$_name")
source=(
        "git+https://github.com/krille-chan/fluffychat.git"
)
sha256sums=('SKIP')

pkgver() {
    cd ${_name}
    git describe --tags --always --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_name}
  git submodule update --init --recursive

  # overriding CMake flags for aarch64 in order to ensure build
  # is not failing
  if [[ "$(uname -m)" == "aarch64" ]]; then
    export CXXFLAGS="${CXXFLAGS/-fstack-protector-strong/ }"
    export CXXFLAGS="${CXXFLAGS/-fstack-clash-protection/ }"

    export CFLAGS="${CFLAGS/-fstack-protector-strong/ }"
    export CFLAGS="${CFLAGS/-fstack-clash-protection/ }"
  fi
  
  flutter pub get
}

build() {
  cd ${_name}
  flutter build linux --release --verbose
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
  mv ${_name}/build/linux/$FLUTTER_ARCH/release/bundle ${pkgdir}/opt/${_name}
  
  # link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_name}/${_name} ${pkgdir}/usr/bin/${_name}

  # icon
  install -Dm 644 ${pkgdir}/opt/${_name}/data/flutter_assets/assets/favicon.png ${pkgdir}/usr/share/pixmaps/${_name}.png

  # desktop entry

  install -dm 755 "${pkgdir}/usr/share/applications"
  cat > ${pkgdir}/usr/share/applications/${_name}.desktop << EOF
[Desktop Entry]
Type=Application
Version=${pkgver}
Name=FluffyChat
Comment=${pkgdesc}
Exec=${_name}
Icon=${_name}
Terminal=false
Categories=Network;InstantMessaging;Chat;MatrixClient
EOF

}

# vim: set sw=2 ts=2 et:
