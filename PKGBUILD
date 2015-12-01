# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-qt-build'
pkgver=5.8.1
pkgrel=3
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
sha256sums=('aac16a76b3853ebd88cd69034771cadacf287ddb06392a1398dc6eec3472507e'
            '69c3be0c886f8b37bb1c5f03d4bdf6e0fc22aa0cbc52266713b5d20564790aef')
sha512sums=('67b25442791f40277020673223a650fd31fcf808ac1a598e4dc5287497ff74b5513078ea4602f63f9465ceedf26083331f2a8d27c6320867c1ad58e31cb80bb4'
            '0ac1986b9a0776855bfe6d6bca52c4dd72a33778fcf8684ccd7c1d9f28fd80a1f77a60a08cdf8ecafdf48d7381b788c86f50e9c538d63f2b9b1dab49a52a3c40')

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
