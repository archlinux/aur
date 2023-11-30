# Maintainer: Marc Cousin (cousinmarc at gmail dot com)
# Contributor: Severin Glöckner (severin.gloeckner@stud.htwk-leipzig.de)

pkgname=pgmodeler
pkgver=1.0.6
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
        'patch_no_check_update.diff'
        'fix_libxml_2.0.12.patch'
        'pgmodeler.appdata.xml')
sha256sums=('cfc80f9311e6c3863b80fdf9891793f00da3362f5c016331831e7b35b4681ab9'
            '91c6ab0df840823a4de21a953592134fb7b4367565eebff8523dc08ea6c7cd36'
            'fed8d615a3b732a83e1bd9c9562c81f3bfcb0ce5a4abba96191bca0d602bdd33'
            '740f785beedc87f6e50f48a7c89f6fae83ac25c57b242531feaf835bd34d3b02'
            '60437a0ea43b7dbbf500cad3e67692207810a6896ca99f867077d21012e918f6'
            '047466a4841cb312d2660ed53875fb34437017bec87c134f9048b542e381e30a')

options=('emptydirs')

install=pgmodeler.install

build() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"
    patch -p1 < ../patch_no_check_update.diff
    patch -p1 < ../fix_libxml_2.0.12.patch

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

# put this back when https://github.com/pgmodeler/pgmodeler/pull/1575 gets merged
    install -Dm644 "assets/conf/pgmodeler_logo.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/pgmodeler.png"
    install -Dm644 "assets/conf/pgmodeler_dbm.png" "$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/pgmodeler-dbm.png"
    install -Dm644 "assets/conf/pgmodeler_sch.png" "$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/pgmodeler_sch.png"
    install -Dm644 "$srcdir/pgmodeler.appdata.xml" "$pkgdir/usr/share/metainfo/pgmodeler.appdata.xml"
    install -Dm644 "$srcdir/mimetype.xml" "$pkgdir/usr/share/mime/packages/pgmodeler.xml"

    # Needs to be there, but belongs rather to doc
    ln -s "/etc/$pkgname/example.dbm" "$pkgdir/usr/share/doc/$pkgname/example.dbm"

    # Create an empty plugin directory to get rid of error when opening plugin directory
    mkdir "$pkgdir/usr/lib/pgmodeler/plugins/"

    # License file not needed for GPL, readme is for github
    rm "$pkgdir/usr/share/doc/$pkgname/"{LICENSE,README.md}
}


