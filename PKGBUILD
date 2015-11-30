# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt-build'
pkgver=5.9.0
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
sha256sums=('65b78cb10b981924bb0df00f633ab0b52944398fdab75cf20597658a3823cef4'
            '58278738149a1cd1420a62d1899d3d5e410e62c4bcc3f5e81232257f7b4da6a3')
sha512sums=('a936a5c2e0344dd377deee4a7f5f4dc5e1646024080a7831ba367c1aac33bf8c0ff31798afc2a660699068e6f50b9a16fb56466d8f13541a03b9b48f8a8634e8'
            '05a692ee9050c99d17e3929c4b1dcb4b1024b6019bc38839c7fcf056320bc82c47fa1430cef4126ae64e09e00b7c0a3a6f16e9ea2d9276f61ad64ac8b5671b10')

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
