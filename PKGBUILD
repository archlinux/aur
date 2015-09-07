# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt-build'
pkgver=5.7.2
pkgrel=2
pkgdesc='Free cross-platform file archiver (compiles from source)'
license='GPL3'
url='http://peazip.org'
arch=('i686' 'x86_64')
depends=('qt4pas')
makedepends=('lazarus-qt' 'icoutils')
provides=('peazip')
conflicts=('peazip' 'peazip-gtk2' 'peazip-qt')
install=peazip.install
source=("https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip-$pkgver.src.zip"
        "https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip_portable-$pkgver.LINUX.Qt.tar.gz")
sha256sums=('a1eb6088291994d3646fc63e8470a46dc7e5d08803c9133a766babab1f3c33c2'
            '49ccd1f3c3cb996fee6d7f16bbe9a07911d59fbbdaa612e7079485ea3d87bb48')

build() {
  cp -Rf "$srcdir/peazip_portable-$pkgver.LINUX.Qt/res" "$srcdir/peazip-$pkgver.src"
  cd "$srcdir/peazip-$pkgver.src"
  sudo lazbuild --widgetset=qt  project_pea.lpi   && [ -f pea ]
  sudo lazbuild --widgetset=qt  project_gwrap.lpi && [ -f pealauncher ]
  sudo lazbuild --widgetset=qt  project_peach.lpi && [ -f peazip ]
  icotool -x -w 256 "./res/icons/PeaZip.ico" -o "$srcdir/peazip-$pkgver.src/peazip.png"
}

package() {
  _resdir="$pkgdir/opt/peazip/res"
  cd "$srcdir/peazip-$pkgver.src/res"
  install -Dm755 "../peazip" "$pkgdir/opt/peazip/peazip"
  install -Dm755 "../pea" "$_resdir/pea"
  install -Dm755 "../pealauncher" "$_resdir/pealauncher"
  install -Dm644 "../peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"
  # Install res directory
  for i in rnd arc/{arc,*.sfx}; do install -Dm755 $i "$_resdir"/$i; done
  for i in *.txt lang/* themes/{{nographic,seven}-embedded/*,*.7z} arc/arc.{ini,groups}
    do install -Dm644 $i "$_resdir"/$i; done
  for i in 7z/{7z{,.so,Con.sfx,.sfx},Codecs/Rar29.so}; do install -Dm755 $i "$_resdir"/$i; done
  for i in quad/bcm upx/upx lpaq/lpaq8 paq/paq8o zpaq/zpaq; do install -Dm755 $i "$_resdir"/$i; done
  #
  desktop-file-install --dir="$pkgdir/usr/share/applications/" --set-icon="peazip"\
  --remove-key="Name[en_US]" "$srcdir/peazip-$pkgver.src/FreeDesktop_integration/peazip.desktop"
}
