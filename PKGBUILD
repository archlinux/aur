# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=authy-electron
pkgver=2.5.0
pkgrel=1
_electronversion=28
pkgdesc="Two factor authentication desktop application"
arch=('x86_64')
url="https://authy.com"
license=('unknown')
depends=("electron${_electronversion}")
makedepends=('squashfs-tools')
provides=('authy')
conflicts=('authy')
_snapid='H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn'
_snaprev='23'
source=("authy-$pkgver-${_snaprev}.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"
        "authy.sh")
sha256sums=('26e56aeca2aa53c5983fbbcb115f72456cd28093171323b3144e280dac91135a'
            '5ec304c59d4f7770fb1bcf3465ae77b445be553b9e6be466c5e42381ccaed610')

prepare() {
  unsquashfs -f -d "authy-$pkgver" "authy-$pkgver-${_snaprev}.snap"

  cd "authy-$pkgver"
  sed -i 's|${SNAP}/meta/gui/icon.png|authy|g' "meta/gui/authy.desktop"

  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/authy.sh"
}

package() {
  cd "authy-$pkgver"
  install -Dm644 resources/app.asar -t "$pkgdir/usr/lib/authy"
  install -Dm644 meta/gui/authy.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 meta/gui/icon.png "$pkgdir/usr/share/pixmaps/authy.png"
  install -Dm755 "$srcdir/authy.sh" "$pkgdir/usr/bin/authy"
}
