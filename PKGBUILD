# Maintainer: Eduard Tolosa <edu4rdshl@pm.me>

pkgname=xodus-nexus
pkgver=0.4.1
pkgrel=1
pkgdesc='Xbox-inspired launcher for Microsoft Store PC games on Linux, built on Xodus'
arch=(x86_64)
url='https://github.com/domsvoboda/xodus-nexus'
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
options=(!strip !debug)
install=$pkgname.install
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "$pkgname.desktop"
  "$pkgname"
)
sha256sums=('6b54f2c81d43965b30a394a4c9954784d20901b0cf213b5ea80729b872ba4a21'
            '686f0162e483642dd660f24202fb45d64af109a8b2050e055a5313cba79bd9d7'
            'ecdb59dfd783f2b9d32621d000bea1b048c863316d23c7c328511e60d10932d9')

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
