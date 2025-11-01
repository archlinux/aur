pkgname=pokeclicker-platinum
pkgver=0.10.25_5  # Arch-friendly version string
pkgrel=1
epoch=1
pkgdesc="PokéClicker Platinum – Game about catching Pokémon, defeating gym leaders, and watching numbers get bigger (Electron AppImage)"
arch=('x86_64')
url="https://github.com/wheat32/pokeclicker"
license=('ISC')
depends=('zlib' 'glibc')
makedepends=('npm' 'nodejs' 'git' 'electron-builder' 'electron')
options=(!strip)

# Convert _ to - for Git tag
_gitver="${pkgver//_/-}"

source=("git+$url.git#tag=v${_gitver}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pokeclicker"
  git describe --tags | sed 's/^v//; s/-/_/g'
}

build() {
  cd "$srcdir/pokeclicker"
  rm -f package-lock.json
  npm install
  npm ci
  npm run tl:init
  npm run build
  npm run build:electron_linux
}

package() {
  cd "$srcdir/pokeclicker"

  install -d "$pkgdir/opt/$pkgname"
  cp -a release/*.AppImage "$pkgdir/opt/$pkgname/pokeclicker-platinum.AppImage"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/pokeclicker-platinum.AppImage" "$pkgdir/usr/bin/pokeclicker-platinum"

  install -Dm644 "src/assets/images/Pokeball.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pokeclicker-platinum.png"

  install -Dm644 <(cat <<EOF
[Desktop Entry]
Name=PokéClicker Platinum
Exec=pokeclicker-platinum
Icon=pokeclicker-platinum
Type=Application
Categories=Game;
EOF
) "$pkgdir/usr/share/applications/pokeclicker-platinum.desktop"
}
