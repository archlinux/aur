# Contributor: EatMyVenom <eat.my.venomm@gamil.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt5'
pkgver=8.2.0
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
source=("https://github.com/peazip/PeaZip/archive/refs/tags/$pkgver.tar.gz"
"help-$pkgver.pdf::https://github.com/peazip/PeaZip/releases/download/$pkgver/peazip_help.pdf")
sha512sums=('1866fbfa29859950c6197ec91940cdfef06b15e16390e8f7546785ce9ae9f06fa2350e4efd8ae6247c1a993db79c25a11394fa1c625b1be70d47815e834ec8ed'
            'd4c7a50e3e07849e69d92bc3222910038fa2cc46c533a53fc1a10f8da783314d9f4e388d561941b4c67277516686b04caac3df4ad00dfe6d1a042379eed0bfe2')

build() {
  cd "$srcdir/PeaZip-$pkgver/peazip-sources"
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt5 --build-all project_pea.lpi && [ -f pea ]
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt5 --build-all project_peach.lpi && [ -f peazip ]
}

package() {
  _pkgres="$pkgdir/opt/peazip/res"
  install -Dm755 "$srcdir/PeaZip-$pkgver/peazip-sources/peazip" "$pkgdir/opt/peazip/peazip"
  install -Dm755 "$srcdir/PeaZip-$pkgver/peazip-sources/pea" "$_pkgres/pea"
  install -Dm644 "$srcdir/PeaZip-$pkgver/peazip-sources/FreeDesktop_integration/peazip.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/peazip.png"
  install -Dm644 "$srcdir/PeaZip-$pkgver/peazip-sources/FreeDesktop_integration/peazip_alt.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/peazip_alt.png"
  install -Dm644 "$srcdir/PeaZip-$pkgver/peazip-sources/FreeDesktop_integration/peazip.desktop" "$pkgdir/usr/share/applications/peazip.desktop"
  install -Dm644 "$srcdir/help-$pkgver.pdf" "$pkgdir/opt/peazip/peazip_help.pdf"

  cd "$srcdir/PeaZip-$pkgver/peazip-sources/res"
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
