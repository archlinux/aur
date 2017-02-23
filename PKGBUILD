# Maintainer: Simon <simon dot hanna at serve-me dot info>
# Contributor: Garrett <floft.net/contact>

pkgname=openlp-bzr
pkgver=r2721
pkgrel=1
pkgdesc="Church presentation software."
arch=('any')
url='http://openlp.org/'
license=('GPLv2')
provides=('openlp')
conflicts=('openlp')
makedepends=('qt5-tools' 'bzr')
depends=('python' 'python-pyqt5' 'phonon-qt5'
         'python-chardet' 'python-lxml' 'python-six'
         'python-beautifulsoup4' 'python-pyenchant'
         'python-alembic' 'mediainfo' 'qt5-multimedia'
         'qt5-webkit'
        )
optdepends=('libreoffice-fresh: display impress presentations'
            'vlc: play multimedia'
            'mupdf: display pdfs'
            'python-mysql-connector: Use a mysql/mariadb database'
            'python-psycopg2: Use a postgresql database')
install=openlp.install
source=('bzr+http://bazaar.launchpad.net/~openlp-core/openlp/trunk/' 'openlp.sh')
sha256sums=('SKIP'
            '19c2f3c622585bf308efc259013fb5518feaf8cf14b51613e1e71778fcc2e8cf')

pkgver() {
  cd "$srcdir/trunk"
  printf "r%s" "$(bzr revno)"
}

#check() {
#  cd "$srcdir/trunk"
#  nosetests -v tests
#}

package() {
  cd "$srcdir/trunk"
  python setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/openlp"{.py,}

  echo "$pkgver" > "$pkgdir/usr/lib/python3.6/site-packages/openlp/.version"

  install -Dm0755 "$srcdir/openlp.sh" "$pkgdir/etc/profile.d/openlp.sh"
  install -Dm0644 "resources/openlp.desktop" "$pkgdir/usr/share/applications/openlp.desktop"
  install -Dm0644 "resources/images/openlp-logo.svg" "$pkgdir/usr/share/pixmaps/openlp.svg"
  install -Dm0644 "resources/images/openlp-logo-48x48.png" "$pkgdir/usr/share/pixmaps/openlp.png"

  #translations
  tsrcdir="$srcdir/trunk/resources/i18n"
  tdestdir="$pkgdir/usr/share/$pkgname/i18n"
  mkdir -p "$tdestdir"
  cd "$tsrcdir"
  
  for file in *.ts; do
    lconvert -i "$file" -o "$tdestdir/${file%%ts}qm"
  done
}

# vim:set ts=2 sw=2 et:
