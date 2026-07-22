# Maintainer: Sluicee <sluicee1@gmail.com>

pkgname=memory-card-bin
pkgver=1.3.5
pkgrel=1
pkgdesc="A desktop music player with a retro PS2/CRT aesthetic"
arch=('x86_64')
url="https://github.com/Sluicee/memory-card"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'gdk-pixbuf2' 'glib2' 'libsoup3' 'alsa-lib' 'openssl' 'ffmpeg' 'gst-plugins-good' 'gst-plugins-base')
optdepends=('ttf-dejavu: fallback symbols/icons support' 'noto-fonts: fallback symbols/icons support')
options=('!debug')
provides=('memory-card')
conflicts=('memory-card')
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/Memory.Card_${pkgver}_amd64.deb")
sha256sums=('490dd15b85776abfa851f6edd9e27c4aeca287071e1d5c8f135f0e73e386fc46')
package() {
  # Extract the payload data archive to the package directory
  if [ -f "$srcdir/data.tar.gz" ]; then
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir/"
  elif [ -f "$srcdir/data.tar.xz" ]; then
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"
  elif [ -f "$srcdir/data.tar.zst" ]; then
    bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir/"
  else
    echo "Error: No data.tar archive found in source"
    return 1
  fi

  # Remove bundled ffmpeg binary to use system's ffmpeg package instead of conflicting
  rm -f "$pkgdir/usr/bin/ffmpeg"

  # Rename desktop file to standard lowercase format to fix launcher association and icon issues
  if [ -f "$pkgdir/usr/share/applications/Memory Card.desktop" ]; then
    mv "$pkgdir/usr/share/applications/Memory Card.desktop" "$pkgdir/usr/share/applications/memory-card.desktop"
  fi

  # Fix empty Categories in the desktop file so it appears in Audio/Video menus
  if [ -f "$pkgdir/usr/share/applications/memory-card.desktop" ]; then
    sed -i 's/^Categories=$/Categories=AudioVideo;Audio;Player;/' "$pkgdir/usr/share/applications/memory-card.desktop"
  fi
}
