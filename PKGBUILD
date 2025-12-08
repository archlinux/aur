# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see "man PKGBUILD".
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put "unknown".

# Maintainer: Pocketnet team <support@pocketnet.app>
pkgbase=pocketnet
pkgver=0.9.134
pkgname=bastyon
pkgrel=1
epoch=
pkgdesc="A Revolutionary anti-censorship decentralized publishing and social platform."
arch=("any")
url="https://github.com/pocketnetteam/pocketnet.gui"
license=("Apache-2.0")
groups=()
depends=()
makedepends=("git" "npm")
checkdepends=()
optdepends=()
provides=()
conflicts=("bastyon-bin")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git#branch=master")
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

prepare() {
  cd "$srcdir/pocketnet.gui"
  
  npm install
}

build() {
  cd "$srcdir/pocketnet.gui"

  npm run build:store
  npm run packl
}

package() {
  cd "$srcdir/pocketnet.gui"

  install -dm755 "$pkgdir/opt/Bastyon"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/icons/hicolor"

  cp -rf "dist/linux-unpacked/." "$pkgdir/opt/Bastyon"

  cp -f "share/applications/bastyon.desktop" "$pkgdir/usr/share/applications"

  sizes=("16x16" "32x32" "48x48" "64x64" "128x128" "256x256" "512x512" "1024x1024")

  for size in "${sizes[@]}"
  do
    if [ -f "res/electron/icons/png/$size.png" ]; then
      install -dm755 "$pkgdir/usr/share/icons/hicolor/$size/apps"
      cp -f "res/electron/icons/png/$size.png" "$pkgdir/usr/share/icons/hicolor/$size/apps/$pkgname.png"
    fi
  done

  rm -rf "$srcdir/pocketnet.gui"
}
