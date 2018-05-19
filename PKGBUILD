# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=postman
pkgver=6.1.2
pkgrel=1
pkgdesc='Build, test, and document your APIs faster'
arch=('x86_64')
url='https://www.getpostman.com'
license=('custom')
depends=(electron)
conflicts=(postman-bin)
source=("postman-$pkgver.zip::https://dl.pstmn.io/download/version/${pkgver}/linux64"
        'remove-updater.patch')
sha256sums=('5e8a8df2893031eb98190690a0d3a98f6330b01f302a6975e62464dc66cbc6b7'
            'e6067c9a83c4bf13ac739debb23b67ae8b6d62beb47f65fc2748bf9a924aec02')

prepare() {
  cd "$srcdir/Postman/app/resources/app"

  # remove updater from settings and menu, disable updates and analytics
  patch -Np1 -r - --no-backup-if-mismatch -i "$srcdir/remove-updater.patch"
}

package() {
  cd "$srcdir/Postman/app"

  mkdir -p "$pkgdir/usr/lib/"
  cp -rp 'resources/app' "$pkgdir/usr/lib/postman"

  # install licenses
  find . -maxdepth 1 -iname 'license*' -print0 |
  xargs -n 1 -0 -I {} install -Dm644 {} "$pkgdir/usr/share/licenses/$pkgname/{}"

  # create run script
  mkdir -p "$pkgdir/usr/bin"
  printf '%s\n' \
  '#!/bin/sh' \
  'exec electron /usr/lib/postman "$@"' \
  > "$pkgdir/usr/bin/postman"
  chmod a+x "$pkgdir/usr/bin/postman"

  # create desktop file
  mkdir -p "$pkgdir/usr/share/applications"
  printf '%s\n' \
  '[Desktop Entry]' \
  'Name=Postman' \
  'Comment=Build, test, and document your APIs faster' \
  'Exec=/usr/bin/postman %U' \
  'Terminal=false' \
  'Type=Application' \
  'Icon=postman' \
  'Categories=Development;Utility;' \
  > "$pkgdir/usr/share/applications/postman.desktop"

  # create icons
  install -Dm644 'resources/app/assets/icon.png' \
  "$pkgdir/usr/share/icons/hicolor/128x128/apps/postman.png"
}
