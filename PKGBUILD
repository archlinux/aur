# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=dyalog-bin
pkgver=18.2.45405
pkgrel=2
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
    'ncurses5-compat-libs'
)
makedepends=(
  'binutils'
  'tar'
)
source=("$pkgname-$pkgver.deb::https://www.dyalog.com/uploads/php/download.dyalog.com/download.php?file=${pkgver%.*}/linux_64_${pkgver}_unicode.${CARCH}.deb"
        'LICENSE.pdf::https://www.dyalog.com/uploads/documents/Developer_Software_Licence.pdf')

sha256sums=('a40fd619303a62fc06e0c82a6e23c12ca48a3ed2c640cec1ccae819b2cf9a663'
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
