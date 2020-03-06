# Maintainer: Chad Kunde <Kunde21@gmail.com>
# Contributor: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>

pkgname=paclan
pkgver=0.1.4
pkgrel=1
pkgdesc='Share pacman packages on the LAN. A replacement for pacserve'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv7l')
url='https://github.com/Kunde21/paclan'
license=('CC0')
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Kunde21/paclan/archive/v${pkgver}.tar.gz")
sha256sums=('576a36c4e39bd30fc684a88ee0999cb79c589bee95fa9932bf0e27a6039440b8')
install=paclan.install

build() {
  cd "${pkgname}-${pkgver}"
  GOPATH="${srcdir}" GO111MODULE=on go build --trimpath -o paclan
}

package() {
  cd "${pkgname}-${pkgver}"

  # systemctl service file
  install -D -m644  'paclan.service' "$pkgdir/usr/lib/systemd/system/paclan.service"

  # paclan binary
  install -D -m755 'paclan' "$pkgdir/usr/bin/$pkgname"

  # mirrorlist.paclan
  install -D -m644 'mirrorlist.paclan' "$pkgdir/etc/pacman.d/mirrorlist.paclan"

  # paclan.conf
  install -D -m644 'paclan.conf' "$pkgdir/etc/pacman.d/paclan.conf"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
