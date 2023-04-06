# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gsubs
pkgver=1.0.3
pkgrel=3
pkgdesc="A desktop app that finds you the perfect subtitle match"
arch=('x86_64')
url="https://cholaware.com/gsubs"
license=('MIT')
depends=('electron9')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sanjevirau/gsubs/archive/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('c75c59f273fa8fe8bc98182f50486552defb91dff247571509e436809b76a245'
            '977b34d613aeac66d6009033e03c6d5138135be079bb5c6ab1442c91251683bf'
            '01eb6b7b04403e5d8df76ba0ad4601e22054d25f922d7cab3b7f8a9d9877804c')

build() {
  cd "$pkgname-$pkgver"
  electronDist=/usr/lib/electron9
  electronVer=$(sed s/^v// /usr/lib/electron9/version)
  npm install --cache "$srcdir/npm-cache"
  ./node_modules/.bin/build --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/$pkgname"

  install -Dm644 build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
