# Maintainer: grant0417 <grant0417@protonmail.com>
pkgname=moebius
pkgver=1.0.29
pkgrel=1
pkgdesc="Modern ANSI & ASCII Art Editor"
arch=('any')
url="https://github.com/blocktronics/moebius"
license=('APACHE')
depends=('electron9')
makedepends=('npm')
provides=('moebius')
source=("https://github.com/blocktronics/moebius/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('b0cdbc8d91ff07c5a826f6c2738f6aeaded4b397350422770a7b05f9ac60652b'
            '99165de73de69f8d0ef67850d2b9b8f9c28d47eedd80730f7b7244a17f18f834'
            '3ec191df8ad9214ebe65716c21beaba36f54322c87d94f254190c0a29a75e674')

build() {
  cd "$pkgname-$pkgver"

  electronVer=$(electron9 --version | tail -c +2)

  HOME="$srcdir/.electron-gyp" npm install --cache "${srcdir}/npm-cache"
  ./node_modules/.bin/electron-builder --linux --x64 --dir dist -c.electronDist=/usr/lib/electron9 -c.electronVersion=$electronVer
}

package() {
  cd "$pkgname-$pkgver"

    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "${pkgdir}/usr/lib/${pkgname}/"
    
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
    
    install -Dm644 "$srcdir/${pkgname}.desktop" -t "$pkgdir/usr/share/applications"
}
