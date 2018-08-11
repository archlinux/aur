# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=postman
pkgver=6.2.4
pkgrel=1
pkgdesc='Build, test, and document your APIs faster'
arch=('x86_64')
url='https://www.getpostman.com'
license=('custom')
depends=(electron)
conflicts=(postman-bin)
source=("postman-$pkgver.zip::https://dl.pstmn.io/download/version/${pkgver}/linux64"
        'remove-updater.patch'
        'https://archive.archlinux.org/packages/e/electron/electron-1.8.4-2-x86_64.pkg.tar.xz')
sha256sums=('79d89b92e8e69d0f7080f3fc25cf30108ba2da0b5587b19851d09dd3c2100c3c'
            'eebcce1e81824b61fd64ccb2c08ec2c7c06a0aacdc4fdc14d6b06ecd92ceed8e'
            'dd9c6756bd61abbaae58fdeade5570f771fe8d6f0de14f1e5a710e42f0bf35c2')

prepare() {
  cd "$srcdir/Postman/app/resources/app"

  # remove updater from settings and menu, disable updates and analytics
  patch -Np1 -r - --no-backup-if-mismatch -i "$srcdir/remove-updater.patch"
}

package() {
  cd "$srcdir/Postman/app"

  mkdir -p "$pkgdir/usr/lib/"
  cp -rp 'resources/app' "$pkgdir/usr/lib/postman"

  # install electron 1.8.4 (postman will not work with electron>=2.0.0)
  mkdir -p "$pkgdir/usr/lib/electron-postman"
  find "$srcdir/usr/lib/electron" -mindepth 1 -maxdepth 1 -print0 | while read -rd '' line; do
    local name="`basename "$line"`"
    { [ "${name: -4}" = '.pak' ] ||
    [ "$name" = 'icudtl.dat' ] ||
    [ "$name" = 'locales' ] ||
    [ "$name" = 'node' ]; } && {
      ln -sf "../electron/$name" "$pkgdir/usr/lib/electron-postman/$name"
      true
    } || {
      cp -rp "$line" "$pkgdir/usr/lib/electron-postman/$name"
      true
    }
  done

  # install licenses
  find . -maxdepth 1 -iname 'license*' -print0 |
  xargs -n 1 -0 -I {} install -Dm644 {} "$pkgdir/usr/share/licenses/$pkgname/{}"

  # create run script
  mkdir -p "$pkgdir/usr/bin"
  printf '%s\n' \
  '#!/bin/sh' \
  'exec /usr/lib/electron-postman/electron /usr/lib/postman "$@"' \
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
