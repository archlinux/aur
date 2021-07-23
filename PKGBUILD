# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
# Contributor: ganthern <https://github.com/ganthern>
pkgname=tutanota-desktop
pkgver=3.85.6
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('nss' 'libappindicator-gtk3' 'libnotify' 'org.freedesktop.secrets')
makedepends=('nodejs>=16' 'npm>=7')
source=("https://github.com/tutao/tutanota/archive/tutanota-release-$pkgver.tar.gz"
        "$pkgname"
        "$pkgname.desktop")
sha256sums=('3fe38ff3181b57a9cdfc11c200d5ad1b73d6c4f0b24c367f6ca00957dc9ac3cd'
            '4f91e842bd92a3312943854383e4929f9baf6cb684a7027aa55edcce1bf4ca16'
            'a2e2b932eb0bc2ad2413b7f39eb9fbdb517f5670367413f76d718d5d270996f7')

build() {
  cd "${pkgname%-*}-${pkgname%-*}-release-$pkgver"
  npm install --cache "$srcdir/npm-cache"
  node dist -l --custom-desktop-release --unpacked
}

package() {
  cd "${pkgname%-*}-${pkgname%-*}-release-$pkgver"
  install -d "$pkgdir/opt/$pkgname"
  cp -r build/desktop/linux-unpacked/* \
    "$pkgdir/opt/$pkgname"

  install -Dm755 "$srcdir/$pkgname" -t "$pkgdir/usr/bin"

  for icon_size in 64 512; do
    icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -Dm644 resources/desktop-icons/icon/${icon_size}.png \
      $pkgdir$icons_dir/$pkgname.png
  done

  install -Dm644 "$srcdir/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications"
}
