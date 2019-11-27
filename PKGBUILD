# Maintainer: Simon <thelinuxguy @ freenode>
# Contributor: Garrett <floft.net/contact>

pkgname=openlp-git
_pkgbase=openlp
pkgver=r16543.f5ffc6d57
pkgrel=1
pkgdesc="Church presentation software."
arch=('any')
url='http://openlp.org/'
license=('GPLv2')
provides=('openlp')
conflicts=('openlp')
makedepends=('qt5-tools' 'git')
depends=('python>=3.8' 'python<3.9' 'python-pyqt5' 'phonon-qt5'
         'python-chardet' 'python-lxml' 'python-six'
         'python-beautifulsoup4' 'python-pyenchant' 'python-dbus'
         'python-alembic' 'mediainfo' 'qt5-multimedia' 'python-zeroconf'
         'qt5-webkit' 'qt5-svg' 'python-webob' 'python-requests' 'vlc'
         'python-waitress' 'python-websockets' 'python-qtawesome' 'python-vlc'
        )
optdepends=('libreoffice-fresh: display impress presentations'
            'mupdf: display pdfs'
            'python-mysql-connector: Use a mysql/mariadb database'
            'python-psycopg2: Use a postgresql database')
install=openlp.install
source=('git+https://gitlab.com/openlp/openlp.git' 'openlp.sh' 'dbus.patch')
sha256sums=('SKIP'
            '19c2f3c622585bf308efc259013fb5518feaf8cf14b51613e1e71778fcc2e8cf'
            'e8aabadd8037179b15cb0093bb0dbd0ad1aa069e2990e13cec677b07eee1b1b6')

prepare() {
    cd "$_pkgbase"
    patch --forward --strip=1 --input="${srcdir}/dbus.patch"
}


pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
#check() {
#  cd "$srcdir/trunk"
#  nosetests -v tests
#}


package() {
  cd "${srcdir}/${_pkgbase}"
  python setup.py install --root="$pkgdir/" --optimize=1

  TAG=$(git describe --tags --abbrev=0)
  VERSION="${TAG}.$(git rev-list $TAG.. --count)-$(git rev-parse --short HEAD)"
  echo "$VERSION" > "$pkgdir/usr/lib/python3.8/site-packages/openlp/.version"

  install -Dm0755 "$srcdir/openlp.sh" "$pkgdir/etc/profile.d/openlp.sh"
  install -Dm0644 "resources/openlp.desktop" "$pkgdir/usr/share/applications/openlp.desktop"
  install -Dm0644 "resources/images/openlp-logo.svg" "$pkgdir/usr/share/pixmaps/openlp.svg"
  install -Dm0644 "resources/images/openlp-logo-48x48.png" "$pkgdir/usr/share/pixmaps/openlp.png"

  #translations
  tsrcdir="$srcdir/openlp/resources/i18n"
  tdestdir="$pkgdir/usr/share/$pkgname/i18n"
  mkdir -p "$tdestdir"
  cd "$tsrcdir"

  for file in *.ts; do
    lconvert -i "$file" -o "$tdestdir/${file%%ts}qm"
  done
}

# vim:set ts=2 sw=2 et:
