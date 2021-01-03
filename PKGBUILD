# Maintainer: Marc Cousin (cousinmarc at gmail dot com)
# Contributor: Severin Glöckner (severin.gloeckner@stud.htwk-leipzig.de)

pkgname=pgmodeler
pkgver=0.9.3
pkgrel=1
epoch=3
pkgdesc="PostgreSQL Database Modeler: an open source CASE tool for modeling PostgreSQL databases"
url="https://pgmodeler.io"
license=('GPL3')
arch=('x86_64')
depends=('qt5-svg' 'libpqxx')

source=("https://github.com/$pkgname/$pkgname/archive/v${pkgver//_/-}.tar.gz"
        'pgmodeler_logo.png'
        'pgmodeler_dbm.png'
        'pgmodeler.desktop'
        'mimetype.xml'
        'patch_no_check_update.diff')
sha1sums=('d53c805c7c988757c9cf6ad895928baa63790eb8'
          'c5bb090a1cbb784cd2ec9e1449cac02af2ba6538'
          '4c4e4260f4b2d2d4c154a8fb5cd7060a6585c83a'
          '92b7b52f601de1b2b6cfd4a3fde87746befc95b0'
          'f2ccb85a5c3500212c710ec538c9fae96356af21'
          '448e756999f5770680eb039f590dd61eb6225b34')
options=('emptydirs')

build() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"
    patch -p1 < ../patch_no_check_update.diff

    # release is needed to get the full dummy and xml2object plugins (doesn't seem to work)
    qmake CONFIG+=release \
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


    install -Dm644 "$pkgname.appdata.xml" "$pkgdir/usr/share/metainfo/$pkgname.appdata.xml"
    install -Dm644 "$srcdir/pgmodeler_logo.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/pgmodeler.png"
    install -Dm644 "$srcdir/pgmodeler_dbm.png" "$pkgdir/usr/share/icons/hicolor/64x64/mimetypes/pgmodeler-dbm.png"
    install -Dm644 "$srcdir/pgmodeler.desktop" "$pkgdir/usr/share/applications/pgmodeler.desktop"
    install -Dm644 "$srcdir/mimetype.xml" "$pkgdir/usr/share/mime/packages/pgmodeler.xml"

    # Needs to be there, but belongs rather to doc
    ln -s "/etc/$pkgname/example.dbm" "$pkgdir/usr/share/doc/$pkgname/example.dbm"

    # Create an empty plugin directory to get rid of error when opening plugin directory
    mkdir "$pkgdir/usr/lib/pgmodeler/plugins/"

    # License file not needed for GPL, readme is for github
    rm "$pkgdir/usr/share/doc/$pkgname/"{LICENSE,README.md}
}
