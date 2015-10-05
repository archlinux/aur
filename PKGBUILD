# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt-build'
pkgver=5.8.0
pkgrel=1
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
sha256sums=('48ea2cfafdf0883185564f754fcd156b7f6f5042e0fc14b1d28ef930b3bc9ff0'
            'e831943f9467a7761d4836849aa5c5cf2aca2c846e52b2f941c2224f6342e11e')

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
