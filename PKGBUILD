# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=arrowdl
pkgver=4.2.1
pkgrel=1
pkgdesc="A mass download manager that helps you to select, organize, prioritize and run your downloads in parallel."
arch=('x86_64')
url="https://www.arrow-dl.com"
license=('LGPL-3.0-or-later AND CC-BY-SA-3.0')
depends=(
  'hicolor-icon-theme'
  'libtorrent-rasterbar'
  'qt6-base'
  'yt-dlp'
)
makedepends=(
  'boost'
  'cmake'
  'desktop-file-utils'
  'qt6-tools'
)
conflicts=('downzemall')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/setvisible/ArrowDL/archive/v$pkgver.tar.gz")
sha256sums=('df44b18ab75b6efc645b2f5ea0932b3fa36c5e51865353c3ae5e9b1876b40622')

prepare() {
  cd "ArrowDL-$pkgver"

  # set absolute path to app directory
  sed -i 's|ABSOLUTE/PATH/TO/APP/DIRECTORY|opt/arrowdl|g' \
    web-extension/launcher/unix/*.json

  # Look for system shared object, not source archive
  sed -i 's/libtorrent-rasterbar.a/libtorrent-rasterbar.so/g' \
    cmake/Modules/FindLibtorrentRasterbar.cmake

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="$pkgname" \
    installer/unix/appimage/ArrowDL.desktop
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
  install -Dm755 ../build/src/ArrowDL -t "$pkgdir/opt/$pkgname/"
  install -Dm755 ../build/web-extension/launcher/launcher -t "$pkgdir/opt/$pkgname/"
  install -Dm644 ../build/src/*.qm -t "$pkgdir/opt/$pkgname/locale/"

  install -Dm644 web-extension/launcher/unix/launcher-manifest-chrome.json \
    "$pkgdir/etc/chromium/native-messaging-hosts/com.arrowdl.extension.json"
  install -Dm644 web-extension/launcher/unix/launcher-manifest-firefox.json \
    "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.arrowdl.extension.json"

  install -Dm644 src/resources/logo/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LOGO_LICENSE.txt"

  install -Dm644 installer/unix/appimage/ArrowDL.desktop -t \
    "$pkgdir/usr/share/applications/"

  install -Dm644 src/resources/logo/ArrowDL.svg -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 "src/resources/logo/icon${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/ArrowDL.png"
  done

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/ArrowDL" "$pkgdir/usr/bin/"

  # Use system yt-dlp
  ln -s /usr/bin/yt-dlp "$pkgdir/opt/$pkgname/"

  # Allow write permissions to queue.json
  touch "$pkgdir/opt/$pkgname/queue.json"
  chmod 777 "$pkgdir/opt/$pkgname/queue.json"
}
