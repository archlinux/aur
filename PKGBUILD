# Maintainer: garionion <garionion ät entr0py.de>
# thanks to nyanpasu64 for pointing out the wrong install path

pkgname=fluffychat-git
_name=fluffychat
pkgver=v1.6.4.r33.g0c94ffcd
pkgrel=1
pkgdesc="Chat with your friends"
arch=('x86_64' 'aarch64')
url="https://fluffychat.im/"
license=('AGPL3')
depends=('gtk3' 'jsoncpp' 'libsecret')
makedepends=('clang'
             'ninja'
             'flutter'
             'cmake'
             'git'
             'gtk3')
optdepends=('libolm: E2E Encryption support')
provides=("$_name")
conflicts=("$_name")
source=("git+https://gitlab.com/famedly/fluffychat.git")
sha256sums=('SKIP')

pkgver(){
    cd ${_name}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  flutter --no-version-check --suppress-analytics config --enable-linux-desktop
  cd ${_name}
  git submodule update --init --recursive
  
  flutter --no-version-check --suppress-analytics pub get
}

build() {
  # overriding CMake flags for aarch64 in order to ensure build
  # is not failing
  if [[ "$(uname -m)" == "aarch64" ]]; then
    echo "Adjusting CMake flags for aarch64."
    export CXXFLAGS="${CXXFLAGS/-fstack-protector-strong/ }"
    export CXXFLAGS="${CXXFLAGS/-fstack-clash-protection/ }"
  fi

  cd ${_name}
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
Comment=Matrix Client. Chat with your friends
Exec=${_name}
Icon=${_name}
Terminal=false
EOF

}

# vim: set sw=2 ts=2 et:
