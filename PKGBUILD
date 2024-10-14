# Maintainer: Mopigames <mopigames@proton.me>
pkgname=betterx-desktop-git
pkgver=v1.0.1.alpha.r7.g6ac6640
pkgrel=1
pkgdesc="Desktop application for BetterX, enhancing your X browsing experience"
arch=('x86_64')
url="https://github.com/Feur-Inc/BetterX-Desktop"
license=('GPL-3.0-or-later')
depends=('electron' 'libxcrypt-compat')
makedepends=('git' 'pnpm' 'ruby' 'ruby-rdoc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Feur-Inc/BetterX-Desktop.git')
sha256sums=('SKIP')
options=('!strip' 'staticlibs')
backup=('usr/bin/betterx-desktop')

pkgver() {
  cd "$srcdir/BetterX-Desktop"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/BetterX-Desktop"
  git fetch origin
  git checkout -B makepkg origin/main
  git reset --hard origin/main
  rm -rf node_modules
  pnpm install
}

build() {
  cd "$srcdir/BetterX-Desktop"
  pnpm run build:arch
}

package() {
  cd "$srcdir/BetterX-Desktop"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r dist/linux-unpacked/* "$pkgdir/usr/lib/$pkgname"
  
  install -Dm755 "$pkgdir/usr/lib/$pkgname/betterx-desktop" "$pkgdir/usr/bin/betterx-desktop"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install icons
  for size in 16 32 48 64 128 256 512; do
    if [ -f "build/icons/${size}x${size}.png" ]; then
      install -Dm644 "build/icons/${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
    fi
  done
  
  # Install desktop file
  if [ -f "dist/linux-unpacked/betterx-desktop.desktop" ]; then
    install -Dm644 "dist/linux-unpacked/betterx-desktop.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  elif [ -f "build/$pkgname.desktop" ]; then
    install -Dm644 "build/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  else
    echo "Desktop file not found. Creating a basic one."
    install -Dm644 /dev/null "$pkgdir/usr/share/applications/$pkgname.desktop"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=BetterX Desktop
Exec=betterx-desktop
Icon=$pkgname
Type=Application
Categories=Network;
EOF
  fi
}