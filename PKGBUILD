pkgname=sql-workbench
pkgver=122
pkgrel=1
epoch=
pkgdesc="SQL Workbench/J is a free, DBMS-independent, cross-platform SQL query tool."
arch=('any')
url="http://www.sql-workbench.net/"
license=('custom')
groups=()
depends=('java-runtime>=8')
makedepends=(
  'unzip'
)
checkdepends=()
optdepends=()
provides=('SQL-Workbench')
conflicts=()
replaces=('sqlworkbench')
backup=()
options=()
install=
changelog=
source=("http://www.sql-workbench.net/Workbench-Build${pkgver}.zip")
noextract=("Workbench-Build${pkgver}.zip")
sha256sums=('84ae40327b2f47ad00fade69d68f45f095af5e01afc558536dd3166f197311bc')

build() {
  unzip "Workbench-Build${pkgver}".zip
  rm "Workbench-Build${pkgver}".zip

  echo Categories=Development >> SQLWorkbench.desktop
  sed -i -e 's/Exec=.*/Exec=sqlworkbench/' \
      -e '/^Path=$/d' \
      SQLWorkbench.desktop
}

package() {
  ###go to source dir
  cd $srcdir

  # need to keep manual and history in same dir as jar
  install -m 644 -D -t $pkgdir/opt/SQLWorkbench \
    sqlworkbench.jar \
    log4j-sample.xml \
    SQLWorkbench-Manual.pdf \
    history.html
  install -m 755 -D -t $pkgdir/opt/SQLWorkbench \
    sqlworkbench.sh \
    sqlwbconsole.sh
  install -m 644 -D -t $pkgdir/usr/share/sqlworkbench/xslt           xslt/*.*
  install -m 644 -D -t $pkgdir/usr/share/sqlworkbench/manual         manual/*.*
  install -m 644 -D -t $pkgdir/usr/share/sqlworkbench/manual/images  manual/images/*.*
  install -m 644 -D -t $pkgdir/usr/share/pixmaps                     workbench32.png
  install -m 644 -D -t $pkgdir/usr/share/icons/hicolor/32x32/apps    workbench32.png
  install -m 644 -D -t $pkgdir/usr/share/licenses/sqlworkbench       LICENSE
  install -m 644 -D -t $pkgdir/usr/share/applications                SQLWorkbench.desktop
  ln -s /opt/SQLWorkbench/history.html $pkgdir/usr/share/sqlworkbench/
  ln -s /opt/SQLWorkbench/SQLWorkbench-Manual.pdf $pkgdir/usr/share/sqlworkbench/

  #create app link in /usr/bin
  install -d $pkgdir/usr/bin
  ln -s /opt/SQLWorkbench/sqlworkbench.sh $pkgdir/usr/bin/sqlworkbench
}

# vim:set ts=2 sw=2 et:
