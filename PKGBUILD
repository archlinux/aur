# balowy <aur@xdapierdolnik.pl>
pkgname=legacylauncher-git
pkgver=3.5.0.r0.g1c1fbc3
pkgrel=1
pkgdesc="A custom launcher for Minecraft Legacy Console Edition"
arch=('x86_64')
url="https://github.com/gradenGnostic/LegacyLauncher"
license=('MIT')
depends=('nss' 'gtk3' 'alsa-lib' 'libxss')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!debug' '!strip')
source=("git+https://github.com/gradenGnostic/LegacyLauncher.git")
sha256sums=('SKIP')

pkgver() {
  cd LegacyLauncher
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd LegacyLauncher
  npm install
}

build() {
  cd LegacyLauncher
  npx electron-builder --linux dir
}

package() {
  cd LegacyLauncher
  install -d "${pkgdir}/opt/${pkgname%-git}"
  cp -r dist/linux-unpacked/* "${pkgdir}/opt/${pkgname%-git}/"
  chmod +x "${pkgdir}/opt/${pkgname%-git}/legacylauncher"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname%-git}/legacylauncher" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop" << EOF
[Desktop Entry]
Name=LegacyLauncher
Comment=A custom launcher for Minecraft Legacy Console Edition
Exec=${pkgname%-git} %U
Icon=${pkgname%-git}
Terminal=false
Type=Application
Categories=Game;
EOF
  if [ -f "512x512.png" ]; then
    install -Dm644 "512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
  fi
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
