# Maintainer: Marc Cousin (cousinmarc at gmail dot com)
# Contributor: Severin Glöckner (severin.gloeckner@stud.htwk-leipzig.de)

pkgname=pgmodeler
pkgver=1.0.2
pkgrel=1
epoch=3
pkgdesc="PostgreSQL Database Modeler: an open source CASE tool for modeling PostgreSQL databases"
url="https://pgmodeler.io"
license=('GPL3')
arch=('x86_64')
depends=('qt6-svg' 'libpqxx')

source=("https://github.com/$pkgname/$pkgname/archive/v${pkgver//_/-}.tar.gz"
        'mimetype.xml'
        'pgmodeler.install'
        'patch_no_check_update.diff'
        'pgmodeler.appdata.xml')
sha1sums=('e7f5471306e23ae88f786cd40b88d0f6c3e9e246'
          'f2ccb85a5c3500212c710ec538c9fae96356af21'
          '459ed6800154eed466829a7943f80d22563ea613'
          '7fab1556d9a1f5ca82a826ab32ac110f34c0f688'
          '4ec54f460f83e67eb98febc905762180907c022a')
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


