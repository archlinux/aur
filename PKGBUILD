# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=downzemall
pkgver=3.0.6
pkgrel=2
pkgdesc="A mass download manager that helps you to select, organize, prioritize and run your downloads in parallel."
arch=('x86_64')
url="https://setvisible.github.io/DownZemAll"
license=('LGPL3' 'CC BY-SA 3.0')
depends=('libtorrent-rasterbar' 'qt6-base' 'yt-dlp')
makedepends=('boost' 'cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/setvisible/DownZemAll/archive/v$pkgver.tar.gz"
        "$pkgname.desktop"
        'add-missing-include.patch')
sha256sums=('a5f1eefdbc83f7f3e1e72b4c6102829e511331ef96c466bfa23cb5bba543bb2f'
            '3cb8f2eefbd9f04dd4b3a706058d8ab82c42514db81fbfbdf213fc833ca01eff'
            '9167312e19c9239bebc5c328ec651828a2738de552fb7e7c5a54f22d15b50109')

prepare() {
  cd "DownZemAll-$pkgver"
  sed -i 's|ABSOLUTE/PATH/TO/APP/DIRECTORY|opt/downzemall|g' \
    web-extension/launcher/unix/*.json

  # Look for system shared object, not source archive
  sed -i 's/libtorrent-rasterbar.a/libtorrent-rasterbar.so/g' \
    cmake/Modules/FindLibtorrentRasterbar.cmake

  # https://github.com/setvisible/DownZemAll/issues/120
  patch -Np1 -i ../add-missing-include.patch
}

build() {
  cmake -B build -S "DownZemAll-$pkgver" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_SKIP_RPATH='YES' \
    -DBUILD_TESTS='OFF' \
    -DLibtorrentRasterbar_LIBRARIES='/usr/lib/libtorrent-rasterbar.so' \
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
  install -Dm644 src/locale/*.ts -t "$pkgdir/opt/$pkgname/locale/"

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
