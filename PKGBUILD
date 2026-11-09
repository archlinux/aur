# Maintainer: Eduard Tolosa <edu4rdshl@pm.me>

pkgname=nexus-launcher
pkgver=0.5.0
pkgrel=1
pkgdesc='Xbox-inspired launcher for Microsoft Store PC games on Linux, built on Xodus'
arch=(x86_64)
url='https://github.com/domsvoboda/nexus-launcher'
license=(MIT)
depends=(alsa-lib gtk3 nss xdg-utils)
makedepends=(npm)
optdepends=(
  'org.freedesktop.secrets: keep the Xbox account signed in'
  'steam: Add to Steam integration'
  'python-gobject: Nexus Overlay'
  'webkit2gtk-4.1: Nexus Overlay'
  'gtk-layer-shell: Nexus Overlay on Wayland'
)
conflicts=(xodus-nexus)
replaces=(xodus-nexus)
options=(!strip !debug)
install=$pkgname.install
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "$pkgname.desktop"
  "$pkgname"
)
sha256sums=('1977922c0e0d5f1484b93207bf9f09ae8b902c594156391e035a0a368b589e3a'
            '241cb6a099ad271cbf99ec73b29a8f7572be72acd68d28cf23318573152ec7ea'
            '33d6a366ea88fe8fe1a3457e91a73d43f476de04ee92437a02603af08e018ce6')

prepare() {
  cd "$pkgname-$pkgver"
  npm ci --cache "$srcdir/npm-cache"
}

build() {
  cd "$pkgname-$pkgver"
  npm run build
  npx electron-builder --linux dir --publish never
}

package() {
  cd "$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -a release/linux-unpacked/. "$pkgdir/usr/lib/$pkgname/"

  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/$pkgname"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
