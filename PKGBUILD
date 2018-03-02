# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

pkgname='peazip-gtk2-build'
pkgver=6.5.1
pkgrel=1
pkgdesc='Free GTK2 cross-platform file archiver (compiles from source)'
license=('GPL3')
url='http://peazip.org'
arch=('i686' 'x86_64')
depends=( 'gtk2' 'desktop-file-utils' 'balz' 'lpaq' 'paq8o' 'p7zip' 'upx' 'zpaq')
optdepends=('quad' 'unace')
makedepends=('lazarus-gtk2' 'icoutils')
provides=('peazip' 'peazip-gtk2')
conflicts=('peazip' 'peazip-gtk2' 'peazip-qt' 'peazip-qt-build' 'peazip-qt-opensuse-latest')
options=('!strip')
install=peazip.install
source=("https://github.com/giorgiotani/PeaZip/releases/download/$pkgver/peazip-$pkgver.src.zip"
        "http://www.peazip.org/downloads/additional/peazip_optional_formats_plugin-1.LINUX.INST.tar.gz")
sha256sums=('b106811311fbaf42ad5374520df2be8b20a545b80e6f8713a1f10e2e5a79d01e'
            '7f3fc1ea200d482500360eadda9298c4d5900ca822d21b5a0e11ff9de4d499ff')
sha512sums=('db930b704e26a8dbcf69dc00af7a9cff44fdbc397a56cc4efaca672cac8f55307d054d6e9ecd3b70ba2778043c8694ffcacc332a6d7d084f5fabcff7482a9c0a'
            '8b308510a2c81ad2704cef19ed3fb2baf1dde0e123cf3e4c96e5e42a330e23002f3443c9fce009120492afc82b0ab063344c8029fe6fe851a4bea4814bacdaa8')

build() {
  cp -Rf "$srcdir/res" "$srcdir/peazip-$pkgver.src"
  cd "$srcdir/peazip-$pkgver.src"
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 --build-all project_pea.lpi && [ -f pea ]
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 --build-all project_gwrap.lpi && [ -f pealauncher ]
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=gtk2 --build-all project_peach.lpi && [ -f peazip ]
  icotool -x -w 256 "./res/icons/PeaZip.ico" -o "$srcdir/peazip-$pkgver.src/peazip.png"
}

package() {
  _resdir="$pkgdir/opt/peazip/res"
  cd "$srcdir/peazip-$pkgver.src/res"
  install -Dm755 "../peazip" "$pkgdir/opt/peazip/peazip"
  install -Dm755 "../pea" "$_resdir/pea"
  install -Dm755 "../pealauncher" "$_resdir/pealauncher"
  install -Dm644 "../peazip.png" "$pkgdir/usr/share/pixmaps/peazip.png"

  for _file in arc/{arc,*.sfx} *.txt lang/* themes/{*-embedded/*,*.7z} arc/arc.{ini,groups}; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "$_resdir/$_file"
  done

  ln -sf -T /usr/lib/p7zip "$_resdir/7z"
  for _file in quad/{balz,quad} unace/unace upx/upx lpaq/lpaq8 paq/paq8o zpaq/zpaq; do
    install -d "$_resdir/$(dirname $_file)/"
    ln -sf "/usr/bin/$(basename $_file)" "$_resdir/$_file";
  done
  install -d "$pkgdir/usr/bin/"
  for _file in /opt/peazip/{peazip,res/pea,res/pealauncher}; do
    ln -sf "$_file" "$pkgdir/usr/bin/$(basename $_file)"
  done

  desktop-file-install --dir="$pkgdir/usr/share/applications/" --set-icon="peazip"\
  --remove-key="Name[en_US]" "$srcdir/peazip-$pkgver.src/FreeDesktop_integration/peazip.desktop"
}
