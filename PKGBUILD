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
pkgver=0.106.0
pkgrel=1
pkgdesc="Runtime based on Chromium and node.js"
arch=('x86_64')
url="https://nwjs.io"
license=('MIT')
optdepends=(
  'nodejs: npm package support'
  'nw-gyp: native add-on build tool for node-webkit'
  'nwjs-ffmpeg-codecs: playback of proprietary video/audio'
)
options=(!debug)
source=(
  nwjs-sdk-$pkgver.tar.gz::https://dl.nwjs.io/v$pkgver/nwjs-sdk-v$pkgver-linux-x64.tar.gz
  nwjs.png::https://raw.githubusercontent.com/nwjs/website/refs/heads/master/public/img/logo.png
  nwjs.desktop
)
sha256sums=('17512bfcce4777a306185fb6929fd5829ce1a474c28fb941d29b2329bf039b85'
            '0f1643f16302b2e7de66fdf91ae370a65c3811052e0c43a2908d49f60ee5a5e4'
            '161b2c1a8c429ef0773bd4a7e9a5befd52bf30575c17c7180e9701e77b48950b')

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

  install -Dm644 "$srcdir"/nwjs.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/nwjs.png     -t "$pkgdir"/usr/share/icons/hicolor/128x128/apps/
}

package_nwjs-sdk-bin() {
  depends=(nwjs-bin)
  provides=(nwjs-sdk)

  install -Dm755 "$srcdir"/nwjs-sdk/{chromedriver,minidump_stackwalk,nwjc} -t "$pkgdir"/opt/nwjs/

  mkdir -p "$pkgdir"/usr/bin/ && ln -sr "$pkgdir"/opt/nwjs/nwjc -t "$pkgdir"/usr/bin/
}

