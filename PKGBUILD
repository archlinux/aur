# Maintainer: kompowiec2 <diasp@o2.pl>
pkgname=tabletop-club-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A virtual tabletop game for playing board games with friends"
arch=('x86_64')
url="https://drwhut.itch.io/tabletop-club"
license=('MIT')
depends=('glibc' 'libx11' 'libxext' 'libxrender' 'libxtst' 'libxrandr' 'libxi' 'pulseaudio')
source=("https://github.com/drwhut/tabletop-club/releases/download/v${pkgver}/TabletopClub_v${pkgver}_Linux_64.zip")
sha512sums=('9ea5f908f7d3a9c83b075db29d10cb1068c4ece11b938b4f3a2ad031178ecd36a176721e022d4f24f6045c4df08634eec2678248f7c4e48439e70eda8a5ec514')

package() {
  cd "$srcdir"

  # Extract the downloaded zip file
  unzip "TabletopClub_v${pkgver}_Linux_64.zip"

  # Create the target directories
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/tabletop-club"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  # Move the binary and assets to appropriate locations
  install -m755 "TabletopClub.x86_64" "$pkgdir/usr/share/tabletop-club/TabletopClub.x86_64"
  install -m644 "TabletopClub.pck" "$pkgdir/usr/share/tabletop-club/TabletopClub.pck"
  cp -r assets "$pkgdir/usr/share/tabletop-club/assets"

  # Ensure .pck file is renamed correctly
  mv "$pkgdir/usr/share/tabletop-club/TabletopClub.pck" "$pkgdir/usr/share/tabletop-club/TabletopClub.x86_64.pck"

  # Create a launcher script
  echo '#!/bin/bash' > "$pkgdir/usr/bin/tabletop-club"
  echo 'exec /usr/share/tabletop-club/TabletopClub.x86_64 --main-pack /usr/share/tabletop-club/TabletopClub.x86_64.pck --base-asset-dir /usr/share/tabletop-club/assets' >> "$pkgdir/usr/bin/tabletop-club"
  chmod +x "$pkgdir/usr/bin/tabletop-club"

  # Install desktop entry and icon
  echo '[Desktop Entry]
Name=Tabletop Club
Comment=A virtual tabletop game for playing board games with friends
Exec=/usr/bin/tabletop-club
Icon=tabletop-club
Terminal=false
Type=Application
Categories=Game;' > "$pkgdir/usr/share/applications/tabletop-club.desktop"

  # Download the icon
  wget -O "$pkgdir/usr/share/icons/hicolor/256x256/apps/tabletop-club.png" "https://raw.githubusercontent.com/drwhut/tabletop-club/v0.1.2/game/tabletop_club_icon.png"
}

# vim:set ts=2 sw=2 et:

