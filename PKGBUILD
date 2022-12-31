# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=downzemall
pkgver=3.0.0
pkgrel=1
pkgdesc="A mass download manager that helps you to select, organize, prioritize and run your downloads in parallel."
arch=('x86_64')
url="https://setvisible.github.io/DownZemAll"
license=('LGPL3' 'CC BY-SA 3.0')
depends=('libtorrent-rasterbar' 'qt6-base' 'yt-dlp')
makedepends=('boost' 'cmake' 'qt6-tools')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
source=("$pkgname-$pkgver.tar.gz::https://github.com/setvisible/DownZemAll/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('e025928d1a601bd53feb04064372f99715a0a2aa0fcc612e404f21e7c7bb0994'
            '3cb8f2eefbd9f04dd4b3a706058d8ab82c42514db81fbfbdf213fc833ca01eff')

prepare() {
  cd "DownZemAll-$pkgver"
  sed -i 's|ABSOLUTE/PATH/TO/APP/DIRECTORY|opt/downzemall|g' \
    web-extension/launcher/unix/*.json

  # Look for system shared object, not source archive
  sed -i 's/libtorrent-rasterbar.a/libtorrent-rasterbar.so/g' cmake/Modules/FindLibtorrentRasterbar.cmake
}

build() {
  cmake -B build -S "DownZemAll-$pkgver" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_SKIP_RPATH='YES' \
    -DBUILD_TESTS='OFF' \
    -DLibtorrentRasterbar_ROOT='/usr' \
    -DOpenSSL_ROOT_DIR='/usr' \
    -DOPENSSL_INCLUDE_DIRS='/usr/include/openssl' \
    -DOPENSSL_CRYPTO_LIBRARY='/usr/lib/libcrypto.so' \
    -DOPENSSL_SSL_LIBRARY='/usr/lib/libssl.so' \
    -Wno-dev
  cmake --build build
}

package() {
  cd "DownZemAll-$pkgver"
  install -Dm755 ../build/src/DownZemAll -t "$pkgdir/opt/$pkgname/"
  install -Dm755 ../build/web-extension/launcher/launcher -t "$pkgdir/opt/$pkgname/"
  install -Dm644 src/locale/*.qm -t "$pkgdir/opt/$pkgname/locale/"

  install -Dm644 web-extension/launcher/unix/launcher-manifest-chrome.json \
    "$pkgdir/etc/chromium/native-messaging-hosts/com.setvisible.downrightnow.json"
  install -Dm644 web-extension/launcher/unix/launcher-manifest-chrome.json \
    "$pkgdir/etc/opt/chrome/native-messaging-hosts/com.setvisible.downrightnow.json"
  install -Dm644 web-extension/launcher/unix/launcher-manifest-firefox.json \
    "$pkgdir/usr/lib/mozilla/native-messaging-hosts/DownRightNow.json"

  install -Dm644 src/resources/logo/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LOGO_LICENSE.txt"

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  install -Dm644 src/resources/logo/DownZemAll.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  for icon_size in 16 24 32 48 64 128 256 512 1024; do
    icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -Dm644 src/resources/logo/icon${icon_size}.png \
      "$pkgdir/${icons_dir}/$pkgname.png"
  done

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/DownZemAll" "$pkgdir/usr/bin/$pkgname"

  ln -s /usr/bin/yt-dlp "$pkgdir/opt/$pkgname/"

  touch "$pkgdir/opt/$pkgname/queue.json"
  chmod 777 "$pkgdir/opt/$pkgname/queue.json"
}
