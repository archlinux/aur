pkgname='peazip-qt-build'
pkgver='5.5.3'
pkgrel=2
pkgdesc='Free cross-platform file archiver (compiles from source)'
license='GPL3'
url='http://peazip.org'

arch=('i686' 'x86_64')
depends=('qt4pas')
makedepends=('lazarus-qt' 'icoutils')
provides=('peazip-qt')
conflicts=('peazip-qt')

source=("http://sourceforge.net/projects/peazip/files/${pkgver}/peazip-${pkgver}.src.zip"
        'peazip.desktop'
        'altconf.txt')
md5sums=('58c518ebc8c4020d0e3ec1778faa6fd7'
         '6fef20588a593e13c218cc9863a4fd5c'
         'd9ba7d703137b28770d1aa64d8ea6a28')
_extractdir="peazip-${pkgver}.src"

build() {
  cd "$srcdir/$_extractdir"
  lazbuild --widgetset=qt project_pea.lpi   && [ -f pea ]
  lazbuild --widgetset=qt project_gwrap.lpi && [ -f pealauncher ]
  lazbuild --widgetset=qt project_peach.lpi && [ -f peazip ]

  mkdir -p icons
  icotool --extract --output='icons' 'res/icons/PeaZip.ico'
  for icon in icons/*.png; do
    _size="$(basename "$icon" | grep -o '[0-9]\+x[0-9]\+')"
    mv "$icon" "$(_dir icons/$_size/apps)/peazip.png"
  done
}

# Create directory if non-existent, and print the directory name
_dir() {
  mkdir -p "$1"
  echo "$1"
}

package() {
  _installdir="opt/peazip"

  cd "$srcdir/$_extractdir"
  install -Dm755 peazip "$pkgdir/$_installdir/peazip"

  mv res "$pkgdir/$_installdir"
  install -Dm755 pea "$pkgdir/$_installdir/res/pea"
  install -Dm755 pealauncher "$pkgdir/$_installdir/res/pealauncher"
  install -Dm644 "$srcdir/altconf.txt" "$pkgdir/$_installdir/res/altconf.txt"

  ln -s "/$_installdir/peazip" "$(_dir "$pkgdir/usr/bin")/peazip"
  mv icons/* "$(_dir "$pkgdir/usr/share/icons/hicolor/")"
  install -Dm644 "$srcdir/peazip.desktop" "$pkgdir/usr/share/applications/peazip.desktop"
}

