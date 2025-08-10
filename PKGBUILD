# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>
# Contributor: oech3
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Josia Roßkopf <josia-login@rosskopfs.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>

pkgbase=nwjs-bin
pkgname=(
  nwjs-bin
  nwjs-sdk-bin
)
pkgver=0.102.0
pkgrel=1
pkgdesc="Runtime based on Chromium and node.js"
arch=('x86_64')
url="https://nwjs.io"
license=('MIT')
optdepends=(
  'nodejs: npm package support'
  'nw-gyp: native add-on build tool for node-webkit'
)
options=(!debug)
source=(
  nwjs-sdk-$pkgver.tar.gz::https://dl.nwjs.io/v$pkgver/nwjs-sdk-v$pkgver-linux-x64.tar.gz
  nwjs-ffmpeg-$pkgver.zip::https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/$pkgver/$pkgver-linux-x64.zip
)
sha256sums=('a0dab6620a9fd6053b01b32f00a5635042bfccf4764bf4ec86d3c39e85a1d991'
            'a3d5eca356d145f18985fd1c7d64b5b12e8536e825d5b6c8dbb2739f5617a8dc')

prepare() {
  # Simplify folder name (only if exists, in case of using '--noextract').
  if [ -d nwjs-sdk-v$pkgver-linux-x64 ]; then
    rm -rf nwjs-sdk && mv nwjs-sdk-v$pkgver-linux-x64 nwjs-sdk
  fi
}

package_nwjs-bin() {
  depends=(gtk3 nss libxss)
  provides=(nwjs node-webkit)

  install -Dm755 "$srcdir"/nwjs-sdk/{chrome_crashpad_handler,nw}         -t "$pkgdir"/opt/nwjs/
  install -Dm644 "$srcdir"/nwjs-sdk/{icudtl.dat,v8_context_snapshot.bin} -t "$pkgdir"/opt/nwjs/
  install -Dm644 "$srcdir"/nwjs-sdk/{nw_{100,200}_percent,resources}.pak -t "$pkgdir"/opt/nwjs/

  for d in lib locales; do
    for f in $(find "$srcdir"/nwjs-sdk/$d -type f -printf "%P\n"); do
      install -Dm644 "$srcdir"/nwjs-sdk/$d/$f -T "$pkgdir"/opt/nwjs/$d/$f
    done
  done

  mkdir -p "$pkgdir"/usr/bin/ && ln -sr "$pkgdir"/opt/nwjs/nw -t "$pkgdir"/usr/bin/

  # Enable proprietary codecs, by replacing bundled FFmpeg with third-party one.
  rm "$pkgdir"/opt/nwjs/lib/libffmpeg.so
  install -Dm644 "$srcdir"/libffmpeg.so -t "$pkgdir"/opt/nwjs/lib/
}

package_nwjs-sdk-bin() {
  depends=(nwjs-bin)
  provides=(nwjs-sdk)

  install -Dm755 "$srcdir"/nwjs-sdk/{chromedriver,minidump_stackwalk,nwjc} -t "$pkgdir"/opt/nwjs/
}

