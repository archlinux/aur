# Maintainer: LandWarderer2772 <navaneethbinoy@gmail.com>
pkgname=fluentflame-reader-git
pkgver=2.1.1.dev.1.r8.g3d13f07
pkgrel=1
pkgdesc="Modern desktop RSS reader built with Electron, React, and Fluent UI"
arch=('x86_64')
url="https://github.com/FluentFlame/fluentflame-reader"
license=('BSD-3-Clause')
options=('!debug')
depends=('alsa-lib' 'gtk3' 'nss' 'libxss')
makedepends=('npm' 'nodejs' 'git')
provides=("fluentflame-reader")
conflicts=("fluentflame-reader")
source=("git+https://github.com/FluentFlame/fluentflame-reader.git")
sha256sums=('SKIP')

pkgver() {
  cd "fluentflame-reader"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd "fluentflame-reader"
  npm install
  npm run build
  npm run package-tarball
}

package() {
  cd "fluentflame-reader"
  _version=$(grep '"version":' package.json | cut -d'"' -f4)
  
  install -dm755 "${pkgdir}/opt/fluentflame-reader"
  tar -xf "bin/linux/x64/fluentflame-reader-linux-x64-${_version}.tar.xz" -C "${pkgdir}/opt/fluentflame-reader" --strip-components=1
  
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/fluentflame-reader/fluentflame-reader" "${pkgdir}/usr/bin/fluentflame-reader"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat <<EOF > "${pkgdir}/usr/share/applications/fluentflame-reader.desktop"
[Desktop Entry]
Name=Fluentflame Reader
Comment=A modern desktop RSS reader given new life
Exec=fluentflame-reader %U
Terminal=false
Type=Application
Icon=fluentflame-reader
Categories=Network;Feed;
StartupWMClass=fluentflame-reader
EOF

  for size in 16 32 48 64 128 256 512; do
    if [ -f "build/icons/${size}x${size}.png" ]; then
      install -Dm644 "build/icons/${size}x${size}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/fluentflame-reader.png"
    fi
  done
  
  if [ -f "build/icons/fluentflame.svg" ]; then
    install -Dm644 "build/icons/fluentflame.svg" \
      "${pkgdir}/usr/share/icons/hicolor/scalable/apps/fluentflame-reader.svg"
  fi
}
