# Contributor: EatMyVenom <eat.my.venomm@gamil.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt5'
pkgver=7.9.0
pkgrel=1
pkgdesc='Free file archiver utility, open, extract RAR TAR ZIP archives'
license=('GPL3')
url='http://peazip.org'
arch=('i686' 'x86_64')
depends=('brotli' 'zstd' 'p7zip' 'qt5pas')
optdepends=('quad' 'unace' 'paq8o' 'upx' 'zpaq')
makedepends=('lazarus')
provides=('peazip')
conflicts=('peazip')
options=('!strip')
source=("https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip-$pkgver.src.zip")
sha512sums=('7659c4d6e56437a3a29a95bc414e6a59bad34505926e2f41fbfe01f39129d0862263b494a6042a6029e87d658be3a599644e4fac2d28a2bf0b15f8a6b96de782')

build() {
  cd "$srcdir/peazip-$pkgver.src"
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt5 --build-all project_pea.lpi && [ -f pea ]
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt5 --build-all project_peach.lpi && [ -f peazip ]
}

package() {
  _pkgres="$pkgdir/opt/peazip/res"
  install -Dm755 "$srcdir/peazip-$pkgver.src/peazip" "$pkgdir/opt/peazip/peazip"
  install -Dm755 "$srcdir/peazip-$pkgver.src/pea" "$_pkgres/pea"
  install -Dm644 "$srcdir/peazip-$pkgver.src/FreeDesktop_integration/peazip.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/peazip.png"
  install -Dm644 "$srcdir/peazip-$pkgver.src/FreeDesktop_integration/peazip_alt.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/peazip_alt.png"
  install -Dm644 "$srcdir/peazip-$pkgver.src/FreeDesktop_integration/peazip.desktop" "$pkgdir/usr/share/applications/peazip.desktop"

  cd "$srcdir/peazip-$pkgver.src/res"
  for _file in *.txt icons/*.ico lang/* themes/{*-embedded/*,*.7z}; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "$_pkgres/$_file"
  done
  sed -i "s/^same/appdata/g" "$_pkgres/altconf.txt"

  cd "$srcdir"
  ln -sf -T /usr/lib/p7zip "$_pkgres/7z"
  for _file in brotli/brotli lpaq/lpaq8 paq/paq8o quad/bcm unace/unace upx/upx zpaq/zpaq zstd/zstd; do
    install -d "$_pkgres/$(dirname $_file)/"
    ln -sf "/usr/bin/$(basename $_file)" "$_pkgres/$_file";
  done

  install -d "$pkgdir"/usr/bin/
  ln -sf /opt/peazip/peazip "$pkgdir/usr/bin/peazip"
  ln -sf /opt/peazip/res/pea "$pkgdir/usr/bin/pea"
}
