# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt-build'
pkgver=5.8.1
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
sha256sums=('41457e9236d760c3d93868281c55b0529bff05f0ea91e5ed104de82f0b2a6f60'
            '42f23459077cadea43221f08f09c10fa77f7745048616826334a982f254e58e8')
sha512sums=('6490e79bef2250d82da10f1753bed768a8687f43de8e092c35d9c1f1758f523c8c41d1fb2e92f2641bb3e11665c70cf654bf52048ee8867be0c38f43c99e300f'
            'a9d68fccfb75ab606d0a651b3e9778de42f65ebae9f83c9f6bd43910ef2659739f58e4ab4a7ba0759d482698842850c73351a963643a2074d695a28073a452c7')

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
