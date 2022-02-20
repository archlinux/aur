# Maintainer: Benjamin Gallois <benjamin.gallois at fasttrack dot sh>
pkgbase=fasttrack
pkgname=(fasttrack fasttrack-cli)
pkgver=6.2.1
pkgrel=1
pkgdesc='Multiple objects tracking software, easy to use, and performant.'
arch=(any)
url='https://www.fasttrack.sh'
license=(GPL3)
groups=()
depends=('opencv>=4.0.0' qt6-base qt6-webengine qt6-svg gcc-libs)
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/FastTrackOrg/FastTrack/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('77f1667e799df0a892f6aae38d90e342a4fd816f471a2c099aea24b4cebdc804')

prepare() {
  mv "FastTrack-$pkgver" "$pkgbase-$pkgver"
}

build() {
  cd "$pkgbase-$pkgver"
  qmake6 CONFIG+=release src/FastTrack.pro
  make
  qmake6 CONFIG+=release src/FastTrack-Cli.pro
  make
}

package_fasttrack() {
  cd "$pkgbase-$pkgver"
  install -D build/fasttrack -t "$pkgdir"/usr/bin/
  install -D sh.fasttrack.fasttrack.desktop -t "$pkgdir"/usr/share/applications/
  install -D sh.fasttrack.fasttrack.metainfo.xml -t "$pkgdir"/usr/share/metainfo/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -D src/assets/fasttrack.png -t "$pkgdir"/usr/share/icons/$pkgname/
}

package_fasttrack-cli() {
  cd "$pkgbase-$pkgver"
  install -D build_cli/fasttrack-cli "$pkgdir"/usr/bin/fasttrack-cli
}
