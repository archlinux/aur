# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=maniadrive
pkgver=1.2
pkgrel=20
pkgdesc='Acrobatic racing game'
arch=('x86_64' 'i686')
url='http://maniadrive.raydium.org/'
license=('GPL' 'custom:CC by-sa 2.0')
if [ "$CARCH" = "x86_64" ]
then
  depends=('lib32-libgl' 'lib32-alsa-lib' 'lib32-mesa' 'lib32-glu' 'lib32-libpulse')
else
  depends=('libgl' 'alsa-lib' 'mesa' 'glu' 'libpulse')
fi
makedepends=('gendesk')
source=("http://prdownloads.sourceforge.net/maniadrive/ManiaDrive-$pkgver-linux-i386.tar.gz"
        "maniadrive.png"
        "license.txt")
sha256sums=('ea524a4613139290b0f85fb6a1a8206d398cba27a2bddb4173ad60b399cbcae4'
            '1c69692578961117af2d17cfdfd9678b458bf7430efa58ed42c2f348e26444f7'
            '60e4d9d0dd67ddf5ee4d0e60219e29f6824b6e0ec1232194110f696b46936f19')

prepare() {
  gendesk -f --pkgname "Maniadrive" --pkgdesc "$pkgdesc" --exec maniadrive

  gendesk -f --pkgname "Maniadrive Editor" --pkgdesc "Level Editor" \
    --exec maniadrive_editor

  cd "ManiaDrive-$pkgver-linux-i386"

  echo '#!/bin/sh' > maniadrive
  echo 'padsp /opt/maniadrive/mania_drive.static "$@"' >> maniadrive

  echo '#!/bin/sh' > maniadrive_editor
  echo 'padsp /opt/maniadrive/mania2.static "$@"' >> maniadrive_editor

  echo '#!/bin/sh' > maniadrive_server
  echo '/opt/maniadrive/mania_server.static "$@"' >> maniadrive_server
}

package() {
  cd "ManiaDrive-$pkgver-linux-i386"

  install -d "$pkgdir/opt"
  cp -r game "$pkgdir/opt"
  mv "$pkgdir/opt/game" "$pkgdir/opt/$pkgname"

  install -Dm755 maniadrive \
    "$pkgdir/usr/bin/maniadrive"
  install -Dm755 maniadrive_editor \
    "$pkgdir/usr/bin/maniadrive_editor"
  install -Dm755 maniadrive_server \
    "$pkgdir/usr/bin/maniadrive_server"

  # GPL
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # Creative commons
  cd $srcdir
  install -Dm644 license.txt \
    "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  # Desktop shortcuts

  install -Dm644 Maniadrive.desktop \
    "$pkgdir/usr/share/applications/Maniadrive.desktop"
  install -Dm644 maniadrive.png \
    "$pkgdir/usr/share/pixmaps/Maniadrive.png"

  install -Dm644 'Maniadrive Editor.desktop' \
    "$pkgdir/usr/share/applications/Maniadrive Editor.desktop"
  install -Dm644 maniadrive.png \
    "$pkgdir/usr/share/pixmaps/Maniadrive Editor.png"
}

# vim:set ts=2 sw=2 et:
