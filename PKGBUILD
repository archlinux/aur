pkgname=nhl-hitz-pro-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Native Linux recompilation of NHL Hitz Pro for the original Xbox'
arch=('x86_64')
url='https://github.com/dalves408/nhlhitzpro-recomp'
license=('custom')
depends=('bash' 'glibc>=2.39' 'libgcc' 'libstdc++' 'zlib' 'bzip2' 'expat'
         'libffi' 'openssl' 'xz' 'fontconfig' 'freetype2' 'libx11' 'libxext'
         'libxrender' 'libglvnd' 'ca-certificates')
makedepends=('squashfs-tools')
optdepends=('xorg-xwayland: Open the setup and settings windows on Wayland')
options=('!strip' '!debug')

_archive="NHLHitzPro-${pkgver}-linux-Linux-x64.tar.gz"
source=("$url/releases/download/v$pkgver/$_archive")
sha256sums=('a7c2a3a05101fb44721e873b5fdfbf49ae8133cc9cfa38a69e4f54d2a635a31b')

prepare() {
  # SquashFS offset in the checksum-pinned AppImage for this release.
  unsquashfs -force -no-progress -d "$srcdir/app" -o 944632 "$srcdir/NHLHitzPro.AppImage"
}

package() {
  local appdir="$pkgdir/opt/$pkgname"
  local sharedir="$pkgdir/usr/share"

  install -d "$appdir" "$pkgdir/usr/bin" "$sharedir/applications"
  cp -R -- "$srcdir/app" "$appdir/app"
  install -m755 "$srcdir/NHLHitzPro.AppImage" "$appdir/NHLHitzPro.AppImage"

  # AppImage uses a sibling manifest to detect a writable RecompLauncher install.
  install -Dm644 "$srcdir/recomplauncher.json" "$sharedir/$pkgname/recomplauncher.json"
  install -Dm644 "$appdir/app/nhl-hitz-pro.png" \
    "$sharedir/icons/hicolor/256x256/apps/nhl-hitz-pro.png"
  install -Dm644 "$appdir/app/THIRD-PARTY.txt" \
    "$sharedir/licenses/$pkgname/THIRD-PARTY.txt"

  cat > "$pkgdir/usr/bin/nhl-hitz-pro" <<'LAUNCHER'
#!/bin/sh
app_root=/opt/nhl-hitz-pro-bin
export APPIMAGE="$app_root/NHLHitzPro.AppImage"
exec "$app_root/app/AppRun" --data-dir "$HOME/Games/NHL Hitz Pro" "$@"
LAUNCHER
  chmod 755 "$pkgdir/usr/bin/nhl-hitz-pro"

  cat > "$sharedir/applications/nhl-hitz-pro-pacman.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=NHL Hitz Pro
Exec=nhl-hitz-pro
Icon=nhl-hitz-pro
Terminal=false
Categories=Game;SportsGame;
Actions=Setup;Settings;

[Desktop Action Setup]
Name=Setup
Exec=nhl-hitz-pro --setup

[Desktop Action Settings]
Name=Settings
Exec=nhl-hitz-pro --settings
DESKTOP
}
