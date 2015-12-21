# Maintainer: Simon <simon dot hanna at serve-me dot info>
# Contributor: Garrett <floft.net/contact>

pkgname=openlp
pkgver=2.2.1
pkgrel=1
pkgdesc="Church presentation software."
arch=('any')
url='http://openlp.org/'
license=('GPLv2')
makedepends=('qt5-tools')
depends=('python' 'python-pyqt4' 'phonon'
         'python-chardet' 'python-lxml'
         'python-beautifulsoup4' 'python-pyenchant'
         'python-alembic'
        )
optdepends=('libreoffice-fresh: display impress presentations'
            'vlc: play multimedia'
            'mupdf: display pdfs')
install=openlp.install
source=(https://get.openlp.org/$pkgver/OpenLP-$pkgver.tar.gz openlp.sh)
sha256sums=('1b6008bc97a0cdd5e5fa931abb0711205ae865179dd9a146390ab59b23888c64'
            '19c2f3c622585bf308efc259013fb5518feaf8cf14b51613e1e71778fcc2e8cf')

package() {
  cd "$srcdir/OpenLP-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/openlp"{.py,}

  echo "$pkgver" > "$pkgdir/usr/lib/python3.5/site-packages/openlp/.version"

  install -Dm0755 "$srcdir/openlp.sh" "$pkgdir/etc/profile.d/openlp.sh"
  install -Dm0644 "resources/openlp.desktop" "$pkgdir/usr/share/applications/openlp.desktop"
  install -Dm0644 "resources/images/openlp-logo.svg" "$pkgdir/usr/share/pixmaps/openlp.svg"
  install -Dm0644 "resources/images/openlp-logo-48x48.png" "$pkgdir/usr/share/pixmaps/openlp.png"

  #translations
  tsrcdir="$srcdir/OpenLP-$pkgver/resources/i18n"
  tdestdir="$pkgdir/usr/share/$pkgname/i18n"
  mkdir -p "$tdestdir"
  cd "$tsrcdir"
  
  for file in *.ts; do
    lconvert -i "$file" -o "$tdestdir/${file%%ts}qm"
  done
}

# vim:set ts=2 sw=2 et:
