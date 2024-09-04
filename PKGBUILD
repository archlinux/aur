# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=dyalog-bin
pkgver=19.0.50027
pkgrel=3
pkgdesc='Dyalog APL interpreter'
arch=('x86_64')
url="https://www.dyalog.com/download-zone.htm"
license=('custom')
depends=(
    'python'
    'libtool'
    'alsa-lib'
    'gtk2'
    'nss'
    'libxss'
    'nodejs'
    'unixodbc'
    'at-spi2-atk'
)
optdepends=(
    'dotnet-runtime-3.1-bin'
)
makedepends=(
    'binutils'
    'tar'
)
source=("$pkgname-$pkgver.deb::https://www.dyalog.com/uploads/php/download.dyalog.com/download.php?file=19.0/linux_64_${pkgver}_unicode.${CARCH}.deb"
        'LICENSE.pdf::https://www.dyalog.com/uploads/documents/Developer_Software_Licence.pdf')

sha256sums=('dee075d361ebd1d9aa0198f67b32e1b00741a2d636e0f5897c4ee0e704a628c0'
            '94eea122f15d1e43443a6bbb10f375be23cf8ba8aacc6b0381bc89a7791c3172')

options=('!strip')

prepare() {
    ar x "$pkgname-$pkgver.deb"
    tar axvf data.tar.gz
    tar axvf control.tar.gz
}

pkgver() {
    grep Version control | cut -d" " -f2
}

package() {
  version="${pkgver%.*}"
  dyalog="opt/mdyalog/$version/64/unicode"

  # Distribution
  install -d "$pkgdir/$dyalog"
  cp -a "$srcdir/$dyalog"/* "$pkgdir/$dyalog/"

  # Binaries
  install -d "$pkgdir/usr/bin"
  ln -s "/$dyalog/mapl" "$pkgdir/usr/bin/dyalog"
  install -Dm755 "$srcdir/$dyalog/scriptbin/dyalogscript" "$pkgdir/usr/bin/dyalogscript"

  # Docs
  install -d "$pkgdir/usr/share/doc"
  cp -a "$srcdir/usr/share/doc"/* "$pkgdir/usr/share/doc/"

  # Licence
  install -Dm644 "LICENSE.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
}
