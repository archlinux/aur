# Maintainer: Ton Nom <email at domain dot tld>
# PKGBUILD pour l'AUR - BarrelMCD Flutter
# Source : tarball du tag GitHub (reproductible).
# Dans le clone AUR : copier ce fichier comme PKGBUILD, puis :
#   updpkgsums   # pour remplir sha256sums
#   makepkg -sf  # test local
#   makepkg --printsrcinfo > .SRCINFO

pkgname=barrelmcd-flutter
pkgver=1.0.1
pkgrel=1
pkgdesc="Interface Flutter pour BarrelMCD - Modélisation conceptuelle de données (MCD)"
arch=('x86_64')
url="https://github.com/yglsan2/BarrelMCD-python"
license=('GPL3')
depends=('gtk3' 'libgtk-3.so' 'gcc-libs')
makedepends=('flutter' 'cmake' 'ninja' 'clang')
source=("https://github.com/yglsan2/BarrelMCD-python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('241ea85865182405f891e8b5d7f325df79af9d96f136fab799beff1dfaaef8f9')

prepare() {
  cd "BarrelMCD-python-${pkgver}/barrelmcd_flutter"
  flutter pub get
}

build() {
  cd "BarrelMCD-python-${pkgver}/barrelmcd_flutter"
  flutter build linux --release
}

package() {
  cd "BarrelMCD-python-${pkgver}/barrelmcd_flutter"
  BUNDLE="$srcdir/BarrelMCD-python-${pkgver}/barrelmcd_flutter/build/linux/x64/release/bundle"
  install -dm755 "$pkgdir/opt/barrelmcd-flutter"
  cp -r "$BUNDLE"/* "$pkgdir/opt/barrelmcd-flutter/"
  install -dm755 "$pkgdir/usr/bin"
  echo '#!/bin/sh
exec /opt/barrelmcd-flutter/barrelmcd_flutter "$@"' > "$pkgdir/usr/bin/barrelmcd-flutter"
  chmod 755 "$pkgdir/usr/bin/barrelmcd-flutter"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/barrelmcd-flutter.desktop" << 'DESKTOP'
[Desktop Entry]
Name=BarrelMCD Flutter
Comment=Modélisation conceptuelle de données (MCD)
Exec=/opt/barrelmcd-flutter/barrelmcd_flutter
Icon=/opt/barrelmcd-flutter/data/flutter_assets/assets/images/logo.png
Terminal=false
Type=Application
Categories=Development;Office;
DESKTOP
}
