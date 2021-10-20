pkgname=rpmlauncher-git
pkgver=1.0.0.625.r0.g4318a47
pkgrel=1
pkgdesc="A multi-functional Minecraft Launcher power by the RPMTW Team, made with Flutter and Dart"
license=('GPL')
depends=('git')
makedepends=('ninja' 'cmake' 'clang' 'dart' 'flutter-git')
arch=('x86_64')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=('RPMLauncher::git+https://github.com/RPMTW/RPMLauncher')
md5sums=('SKIP')
pkgver(){
  cd "RPMLauncher"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare(){
  cd "RPMLauncher"
  flutter config --enable-linux-desktop
}
build(){
  cd "$srcdir/RPMLauncher/"
  build_id=`git describe --tags --abbrev=0 | sed 's/[0-9]*\.[0-9]*\.[0-9]*\.//'`
  version_id=`git describe --tags --abbrev=0 | sed "s/\.$build_id//"`
  flutter build linux --dart-define="build_id=$build_id" --dart-define="version_type=debug" --dart-define="version=$version_id"
  chmod +x "$srcdir/RPMLauncher/build/linux/x64/release/bundle/RPMLauncher"
  cd "$srcdir/RPMLauncher/scripts/Updater"
  dart pub get
  dart compile exe bin/main.dart --output "$srcdir/RPMLauncher/build/linux/x64/release/bundle/updater"
  chmod +x "$srcdir/RPMLauncher/build/linux/x64/release/bundle/updater"
}
package() {
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/opt/RPMLauncher"
  cp -r "$srcdir/RPMLauncher/build/linux/x64/release/bundle/*" "$pkgdir/opt/RPMLauncher"
  echo "[Desktop Entry]
Categories=Game;ArcadeGame;
Comment=Edit
Encoding=UTF-8
Exec="/opt/RPMLauncher/RPMLauncher"
Icon="/opt/RPMLauncher/data/flutter_assets/images/Logo.png"
Name=RPMLauncher
Path=/opt/RPMLauncher
StartupNotify=false
Terminal=true
Type=Application
Version=$PKGVER" >> "$pkgdir/usr/share/applications/RPMLauncher.desktop"
}
