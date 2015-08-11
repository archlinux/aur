# Maintainer: Garrett <floft.net/contact>
pkgname=openlp
pkgver=2.0.5
pkgrel=4
pkgdesc="Church presentation software."
arch=('any')
conflicts=('openlp-bzr' 'openlp-dev')
url='http://openlp.org/'
license=('GPLv2')
makedepends=('qt5-tools')
depends=('qt4' 'python2' 'python2-pyqt4' 'python2-setuptools' 'phonon-qt4'
    'python2-chardet' 'python2-lxml' 'python2-beautifulsoup4' 'python2-pyicu'
    'python2-sqlalchemy' 'python2-sip' 'python2-pysqlite-legacy'
    'python2-pyenchant' 'python2-mako' 'python2-alembic' 
    'python2-xdg'       'python2-beautifulsoup3' 'python2-migrate')
optdepends=('libreoffice-impress: display impress presentations'
            'vlc: play multimedia')
install=openlp.install
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/OpenLP-$pkgver.tar.gz openlp.sh)
md5sums=('539626eb8da337814d64e82329e22e78'
         '56908c5e7807fe2a384aa55de3735f32')
sha1sums=('59dff57fff62ce406b180585dc5dcbd47d0e1c72'
          'd40794631c19688eb1971eadeb108c5a2cc69506')

package() {
  cd "$srcdir/OpenLP-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/openlp"{.pyw,}

  echo "$pkgver" > "$pkgdir/usr/lib/python2.7/site-packages/openlp/.version"

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
