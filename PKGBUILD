# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=coolapk_flutter-git
_gitname=${pkgname%-git}
pkgver=v0.2.8+1.r1.g3274dfb
pkgrel=1
pkgdesc="flutter coolapk"
arch=('any')
# url="https://github.com/clinux-co/coolapk_flutter"
url="https://github.com/skbeh/coolapk_flutter"
license=('unknown')
makedepends=('clang'
             'ninja'
             'flutter'
             'cmake')
provides=("$_gitname")
conflicts=("$_gitname")
source=("git+https://github.com/clinux-co/coolapk_flutter")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  flutter channel master
  flutter upgrade
  flutter config --enable-linux-desktop
}

build() {
  cd ${_gitname}

  flutter build linux
}

package() {
  cd ${_gitname}
  
  # install
  install -dm755 ${pkgdir}/opt
  mv build/linux/release/bundle ${pkgdir}/opt/${_gitname}
  
  # link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_gitname}/flutter_coolapk ${pkgdir}/usr/bin/${_gitname}

  # icon
  install -Dm 644 assets/images/coolapk/coolapk_logo.png ${pkgdir}/usr/share/pixmaps/${_gitname}.png

  # desktop entry
  install -dm 755 "${pkgdir}/usr/share/applications"
  cat > ${pkgdir}/usr/share/applications/${_gitname}.desktop << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Coolapk Flutter Desktop
Comment=Coolapk Flutter Desktop
Exec=${_gitname}
Icon=${_gitname}
Terminal=false
EOF

}

# vim: set sw=2 ts=2 et:
