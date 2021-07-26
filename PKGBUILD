# Contributor: EatMyVenom <eat.my.venomm@gamil.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt5'
pkgver=8.1.0
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
source=("https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip-$pkgver.src.zip"
"help-$pkgver.pdf::https://github.com/peazip/PeaZip/releases/download/$pkgver/peazip_help.pdf")
sha512sums=('ff854733792eae0a6dd3d1be7e5976d28c2ab8573716bdcd6c7d58238d38ead0f1eee59b41702fa2c924fab788784b2afbfd58b048657d46ca1de19b940f53ca'
            '2a4b616ef4ffb0bbca84a86719b01bc41fdf3b57beaac953e2d35b37689e43bec55589a2875a4c23fee40121fa4e7e6436545f108862f9aaf306c3bddca3fc19')

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
  install -Dm644 "$srcdir/help-$pkgver.pdf" "$pkgdir/opt/peazip/peazip_help.pdf"

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
