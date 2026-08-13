# Maintainer: LaT-SKY <miprota at 163 dot com>
pkgname=mip-paper
pkgver=0.2.2
pkgrel=1
pkgdesc='Dynamic wallpaper engine for KDE Plasma 6 on Wayland'
arch=('x86_64')
url='https://github.com/LaT-SKY/mip-paper'
license=('GPL-3.0-only' 'MIT' 'CC-BY-4.0')
depends=('bash' 'electron43' 'nodejs' 'plasma-workspace' 'kwin>=6.7' 'kconfig' 'qt6-tools' 'systemd' 'pipewire' 'pipewire-audio' 'wireplumber')
optdepends=('geoclue: automatic location through XDG Desktop Portal')
makedepends=('npm')
options=('!strip')
install=mip-paper.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/LaT-SKY/mip-paper/releases/download/v0.2.2/mip-paper-0.2.2.tar.gz")
sha256sums=('14885f9d04a06ac48cadc28f5d5b1453c843c2ffa14239f1aa427afa2bf49c2e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  npm ci --omit=dev --omit=optional --ignore-scripts --cache "$srcdir/npm-cache"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/lib/mip-paper"
  cp -a bin config resources scripts src assets node_modules package.json     "$pkgdir/usr/lib/mip-paper/"

  install -Dm755 packaging/mip-paper "$pkgdir/usr/bin/mip-paper"
  install -Dm644 resources/mip-paper-packaged.service     "$pkgdir/usr/lib/systemd/user/mip-paper.service"

  install -d "$pkgdir/usr/share/kwin/scripts/mip-paper"
  cp -a kwin/mip-paper/. "$pkgdir/usr/share/kwin/scripts/mip-paper/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/mip-paper/LICENSE"
  install -Dm644 assets/ATTRIBUTION.md     "$pkgdir/usr/share/licenses/mip-paper/default-wallpaper-ATTRIBUTION"
  install -Dm644 node_modules/@particle/dbus-next/LICENSE     "$pkgdir/usr/share/licenses/mip-paper/dbus-next-LICENSE"
  install -Dm644 node_modules/fft.js/README.md     "$pkgdir/usr/share/licenses/mip-paper/fft.js-LICENSE"
  install -Dm644 node_modules/qweather-icons/LICENSE     "$pkgdir/usr/share/licenses/mip-paper/qweather-icons-LICENSE"
  install -Dm644 node_modules/qweather-icons/README.md     "$pkgdir/usr/share/licenses/mip-paper/qweather-icons-ATTRIBUTION"
}
