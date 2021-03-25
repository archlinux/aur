# Maintainer: garionion <garionion ät entr0py.de>

pkgname=fluffychat-git
_name=fluffychat
pkgver=v0.28.0.r0.g0b1cf62
pkgrel=2
pkgdesc="Chat with your friends"
arch=('x86_64')
url="https://fluffychat.im/"
license=('AGPL3')
makedepends=('clang'
             'ninja'
             'flutter'
             'cmake'
             'git'
             'gtk3')
provides=("$_name")
conflicts=("$_name")
source=("git+https://gitlab.com/famedly/fluffychat.git")
sha256sums=('SKIP')

pkgver(){
    cd ${_name}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  flutter config --enable-linux-desktop
  flutter config --no-analytics
  cd ${_name}
  git submodule update --init --recursive
  #echo "dependency_overrides:\n  intl: 0.17.0-nullsafety.2" >> pubspec.yaml
}

build() {
  cd ${_name}

  flutter clean
  flutter pub get
  flutter build linux --release --verbose
}

package() {
  # install
  install -dm755 ${pkgdir}/opt
  mv ${_name}/build/linux/release/bundle ${pkgdir}/opt/${_name}
  
  # link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_name}/${_name} ${pkgdir}/usr/bin/${_name}

  # icon
  install -Dm 644 ${_name}/assets/favicon.png ${pkgdir}/usr/share/pixmaps/${_name}.png

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