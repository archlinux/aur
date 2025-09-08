# Maintainer: Marc Cousin (cousinmarc at gmail dot com)
# Contributor: Severin Glöckner (severin.gloeckner@stud.htwk-leipzig.de)

pkgname=pgmodeler
pkgver=1.2.1
pkgrel=1
epoch=3
pkgdesc="PostgreSQL Database Modeler: an open source CASE tool for modeling PostgreSQL databases"
url="https://pgmodeler.io"
license=('GPL3')
arch=('x86_64')
depends=('qt6-svg' 'postgresql-libs' 'libxml2')

source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v${pkgver//_/-}.tar.gz"
        'mimetype.xml'
        'pgmodeler.install'
        'patch_no_check_update.diff')
sha256sums=('c603495740d203a23c7b1ea03a524eed155c012b8d276c28bc1aaa2a78f0b18f'
            '91c6ab0df840823a4de21a953592134fb7b4367565eebff8523dc08ea6c7cd36'
            'fed8d615a3b732a83e1bd9c9562c81f3bfcb0ce5a4abba96191bca0d602bdd33'
            '648d6351e1e1d1ad559e1ddfc98aff158e91c040b65c8c4ea74232c2077e19d7')

options=('emptydirs')

install=pgmodeler.install

build() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"
    patch -p1 < ../patch_no_check_update.diff

    # release is needed to get the full dummy and xml2object plugins (doesn't seem to work)
    qmake6 CONFIG+=release \
          PREFIX=/usr \
          CONFDIR=/etc/pgmodeler \
          PRIVATEBINDIR=/usr/bin \
          DOCDIR=/usr/share/doc/pgmodeler \
          SAMPLESDIR=/usr/share/doc/pgmodeler \
          NO_UPDATE_CHECK=AURdoesthis \
          QMAKE_CXXFLAGS_RELEASE+="${CXXFLAGS} ${CPPFLAGS}" \
          pgmodeler.pro
    make
}

package() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    make INSTALL_ROOT="${pkgdir}" install

    install -Dm644 "assets/conf/pgmodeler_logo.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/pgmodeler.png"
    install -Dm644 "assets/conf/pgmodeler_dbm.png" "$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/pgmodeler-dbm.png"
    install -Dm644 "assets/conf/pgmodeler_sch.png" "$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/pgmodeler_sch.png"
    install -Dm644 "pgmodeler.appdata.xml" "$pkgdir/usr/share/metainfo/pgmodeler.appdata.xml"
    install -Dm644 "$srcdir/mimetype.xml" "$pkgdir/usr/share/mime/packages/pgmodeler.xml"

    # Needs to be there, but belongs rather to doc
    ln -s "/etc/$pkgname/example.dbm" "$pkgdir/usr/share/doc/$pkgname/example.dbm"

    # Create an empty plugin directory to get rid of error when opening plugin directory
    mkdir "$pkgdir/usr/lib/pgmodeler/plugins/"

    # License file not needed for GPL, readme is for github
    rm "$pkgdir/usr/share/doc/$pkgname/"{LICENSE,README.md}
}


