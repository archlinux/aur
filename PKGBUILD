# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=downzemall
pkgver=3.1.0
pkgrel=2
pkgdesc="A mass download manager that helps you to select, organize, prioritize and run your downloads in parallel."
arch=('x86_64')
url="https://www.arrow-dl.com/ArrowDL"
license=('LGPL3' 'CC BY-SA 3.0')
depends=('libtorrent-rasterbar' 'qt6-base' 'yt-dlp')
makedepends=('boost' 'cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/setvisible/ArrowDL/archive/v$pkgver.tar.gz")
sha256sums=('3cab020b150d503a651a6910707c45d66ed4990aa07a04b581b18c430c9702b2')

prepare() {
  cd "ArrowDL-$pkgver"

  # set absolute path to app directory
  sed -i 's|ABSOLUTE/PATH/TO/APP/DIRECTORY|opt/downzemall|g' \
    web-extension/launcher/unix/*.json

  # Look for system shared object, not source archive
  sed -i 's/libtorrent-rasterbar.a/libtorrent-rasterbar.so/g' \
    cmake/Modules/FindLibtorrentRasterbar.cmake
}

build() {
  cmake -B build -S "ArrowDL-$pkgver" \
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
  cd "ArrowDL-$pkgver"
  install -Dm755 ../build/src/DownZemAll -t "$pkgdir/opt/$pkgname/"
  install -Dm755 ../build/web-extension/launcher/launcher -t "$pkgdir/opt/$pkgname/"
  install -Dm644 ../build/src/*.qm -t "$pkgdir/opt/$pkgname/locale/"

  install -Dm644 web-extension/launcher/unix/launcher-manifest-chrome.json \
    "$pkgdir/etc/chromium/native-messaging-hosts/com.setvisible.downrightnow.json"
  install -Dm644 web-extension/launcher/unix/launcher-manifest-chrome.json \
    "$pkgdir/etc/opt/chrome/native-messaging-hosts/com.setvisible.downrightnow.json"
  install -Dm644 web-extension/launcher/unix/launcher-manifest-firefox.json \
    "$pkgdir/usr/lib/mozilla/native-messaging-hosts/DownRightNow.json"

  install -Dm644 src/resources/logo/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LOGO_LICENSE.txt"

  install -Dm644 installer/unix/appimage/DownZemAll.desktop -t \
    "$pkgdir/usr/share/applications/"

  install -Dm644 src/resources/logo/DownZemAll.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 "src/resources/logo/icon${i}.png" \
      "$pkgdir/$usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/DownZemAll" "$pkgdir/usr/bin/"

  # Use system yt-dlp
  ln -s /usr/bin/yt-dlp "$pkgdir/opt/$pkgname/"

  # Allow write permissions to queue.json
  touch "$pkgdir/opt/$pkgname/queue.json"
  chmod 777 "$pkgdir/opt/$pkgname/queue.json"
}
