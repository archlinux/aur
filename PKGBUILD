# Contributor: EatMyVenom <eat.my.venomm@gamil.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt5'
pkgver=8.0.0
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
sha512sums=('a1d1bd1ccb4f18358f6fef18c0572151248098c867a16d8b528c6862822ddd1a20c0962c579e4dfa602940babc65a9a79138e780035c4117348a5997633ed079'
            'd09985d41279249232f45dbef4361663f1fc8e0418d5d9311b59cd912d979e9995c19d9e0875e717f8484393ff65230ae33775e4eff058c8f558f18005861ba4')

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
