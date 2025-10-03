# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=heynote
pkgver=2.6.1
pkgrel=1
_electronversion=37
pkgdesc="A dedicated scratchpad for developers"
arch=('x86_64')
url="https://heynote.com"
license=('Commons-Clause-1.0')
depends=("electron${_electronversion}")
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/heyman/heynote/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('74b5dcb4d83b110afa5a16829a71c65fdd9b278fa23bf7c1a4c7286038518b21'
            '22eca2d471190a5c59d3bfc9d95333071a7f63711e89c11991b12ebe068197ad'
            '01f72b81076197876af162436ce58754ceb35a0f7726f00255bfa55a5936f5ff')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/$pkgname.sh"
}

build() {
  cd "$pkgname-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  npm install
  npx vue-tsc --noEmit
  npx vite build
  npx electron-builder --linux dir -c electron-builder.json5 \
    ${dist} -c.electronDist=${electronDist} -c.electronVersion=${electronVer}
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "release/$pkgver/linux-unpacked/resources/app.asar" -t \
    "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 resources/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
