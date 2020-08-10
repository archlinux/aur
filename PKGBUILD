pkgname=sql-workbench
pkgver=126
pkgrel=2
epoch=
pkgdesc="SQL Workbench/J is a free, DBMS-independent, cross-platform SQL query tool."
arch=('any')
url="https://www.sql-workbench.eu/"
license=('custom')
depends=('java-runtime>=11')
makedepends=(
    'unzip'
)
provides=('SQL-Workbench')
replaces=('sqlworkbench')
source=("https://www.sql-workbench.eu/Workbench-Build${pkgver}.zip")
noextract=("Workbench-Build${pkgver}.zip")
sha256sums=('b80758d6514f5f861a39349a459c2d905fe5fba5e0245434b1d4703438ebd05d')

build() {
    unzip "Workbench-Build${pkgver}".zip
    rm "Workbench-Build${pkgver}".zip

    sed -i -e 's/Exec=.*/Exec=sqlworkbench/' \
        -e '/^Path=$/d' \
        sqlworkbench.desktop
}

package() {
    cd $srcdir

    # Need to keep manual and history in same dir as jar
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
    install -m 644 -D -t $pkgdir/usr/share/applications                sqlworkbench.desktop
    ln -s /opt/SQLWorkbench/history.html $pkgdir/usr/share/sqlworkbench/
    ln -s /opt/SQLWorkbench/SQLWorkbench-Manual.pdf $pkgdir/usr/share/sqlworkbench/

    # Create app link in /usr/bin
    install -d $pkgdir/usr/bin
    ln -s /opt/SQLWorkbench/sqlworkbench.sh $pkgdir/usr/bin/sqlworkbench
}

