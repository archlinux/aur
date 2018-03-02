# Maintainer: kitsunyan <kitsunyan@inbox.ru>

pkgname=postman
pkgver=6.0.8
pkgrel=1
pkgdesc='Build, test, and document your APIs faster'
arch=('x86_64')
url='https://www.getpostman.com'
license=('custom')
depends=(electron ttf-opensans)
conflicts=(postman-bin)
source=("postman-$pkgver.zip::https://dl.pstmn.io/download/version/${pkgver}/linux64"
        'remove-updater.patch')
sha256sums=('2bb07fe37defa4ec0e38f9e4828d41aa660379170dee472c7789b0396726e42b'
            '3977c96bbda920e08972ab755bfbc4855bed35ec6eb469cb9514b27a15dce601')

prepare() {
  cd "$srcdir/Postman/resources/app"

  # remove updater from menu
  patch -Np1 -i "$srcdir/remove-updater.patch"

  for f in 'js/console.js' 'js/requester.js' 'js/runner.js' 'js/shared.js'; do
    # set "DISABLE_ANALYTICS" and "DISABLE_UPDATES" variables to "true"
    sed -i "$f" \
    -e 's/window.DISABLE_ANALYTICS = false;/window.DISABLE_ANALYTICS = true;/' \
    -e 's/window.DISABLE_UPDATES = false;/window.DISABLE_UPDATES = true;/'
  done
}

package() {
  cd "$srcdir/Postman"

  mkdir -p "$pkgdir/usr/lib/"
  cp -rp 'resources/app' "$pkgdir/usr/lib/postman"

  # remove backup files
  find "$pkgdir/usr/lib/postman" -name '*.orig' -print0 | xargs -0 rm -f

  # install licenses
  find . -maxdepth 1 -iname 'license*' -print0 |
  xargs -n 1 -0 -I {} install -Dm644 {} "$pkgdir/usr/share/licenses/$pkgname/{}"

  # create font links
  ln -sf '/usr/share/fonts/TTF/OpenSans-Bold.ttf' \
  "$pkgdir/usr/lib/postman/assets/fonts/OpenSans/OpenSans-Bold.ttf"
  ln -sf '/usr/share/fonts/TTF/OpenSans-Regular.ttf' \
  "$pkgdir/usr/lib/postman/assets/fonts/OpenSans/OpenSans-Regular.ttf"
  ln -sf '/usr/share/fonts/TTF/OpenSans-SemiBold.ttf' \
  "$pkgdir/usr/lib/postman/assets/fonts/OpenSans/OpenSans-Semibold.ttf"

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
