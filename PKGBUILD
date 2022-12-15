# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Maxim Baz <cerebro@maximbaz.com>
pkgname=cerebro
pkgver=0.10.0
pkgrel=1
_electronversion=20
pkgdesc="Open-source productivity booster with a brain."
arch=('x86_64')
url="https://cerebroapp.com"
license=('MIT')
depends=("electron${_electronversion}")
makedepends=('yarn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cerebroapp/cerebro/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('14a98ab56f159122b8804ea330df78de55394cf88c5bf52c6b04a5d69d5c5254'
            '508b9ffe9df348a9ad71f217dc3b27f1c2bbce9228ad480011bb0bad903925cb'
            'af194176b90747c73bca6aada83090c8d0aa46ab2affa078c0a411ca7181e4b0')

build() {
  cd "$pkgname-$pkgver"
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  yarn config set cache-folder "$srcdir/yarn-cache"
  yarn install
  yarn run build
  yarn electron-builder --linux --x64 --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 release/linux-unpacked/resources/app.asar -t \
    "$pkgdir/usr/lib/$pkgname/resources/"

  for res in 16x16 32x32 48x48 128x128 256x256 512x512 1024x1024; do
    install -Dm644 build/icons/${res}.png \
      "$pkgdir/usr/share/icons/hicolor/${res}/apps/$pkgname.png"
  done

  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -a build docs/* "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
