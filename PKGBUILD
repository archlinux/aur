# Contributor: EatMyVenom <eat.my.venomm@gamil.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt5'
pkgver=8.3.0
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
sha512sums=('51e91777270b491636c98e6df45997329db48365824813aad992f0738c44f24bbff7f9498055798874070220c5e174f0b77971063b7bc03686ff174d46232dd7'
            'e1b2fc51bc630dcc5bc326e26c97e05187aedfcfc63df6def57f3a2c9ad35020db5823ade2b3f3788ecc72b4e720bf638dc4685b290191b3624a40747248bc86')

build() {
  cd "$srcdir/PeaZip-$pkgver/peazip-sources"
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt5 --build-all project_pea.lpi && [ -f pea ]
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt5 --build-all project_peach.lpi && [ -f peazip ]
}

package() {
  _pkgres="$pkgdir/opt/peazip/res"
  install -Dm755 "$srcdir/PeaZip-$pkgver/peazip-sources/peazip" "$pkgdir/opt/peazip/peazip"
  install -Dm755 "$srcdir/PeaZip-$pkgver/peazip-sources/pea" "$_pkgres/pea"
  cd "$srcdir/PeaZip-$pkgver/peazip-sources/res/batch/freedesktop_integration"
  for _file in *.png; do
    install -Dm644 "$_file" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_file"
  done
  for _file in *.desktop; do
    install -Dm644 "$_file" "$pkgdir/usr/share/applications/$_file"
  done
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
