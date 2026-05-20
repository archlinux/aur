# Maintainer: Marc Cousin (cousinmarc at gmail dot com)
# Contributor: Severin Glöckner (severin.gloeckner@stud.htwk-leipzig.de)

pkgname=pgmodeler
pkgver=2.0.0_beta
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
sha256sums=('3d6fea1b91d4af90c7a5dad8a38d61fb49b560e1bac90258c3eb84dfdeffaab4'
            '91c6ab0df840823a4de21a953592134fb7b4367565eebff8523dc08ea6c7cd36'
            'fed8d615a3b732a83e1bd9c9562c81f3bfcb0ce5a4abba96191bca0d602bdd33'
            '648d6351e1e1d1ad559e1ddfc98aff158e91c040b65c8c4ea74232c2077e19d7')

options=('emptydirs')

install=pgmodeler.install

build() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"
    patch -p1 < ../patch_no_check_update.diff

    # release is needed to get the full dummy and xml2object plugins (doesn't seem to work)
#    qmake6 CONFIG+=release \
#          PREFIX=/usr \
#          CONFDIR=/etc/pgmodeler \
#          PRIVATEBINDIR=/usr/bin \
#          DOCDIR=/usr/share/doc/pgmodeler \
#          SAMPLESDIR=/usr/share/doc/pgmodeler \
#          NO_UPDATE_CHECK=AURdoesthis \
#          QMAKE_CXXFLAGS_RELEASE+="${CXXFLAGS} ${CPPFLAGS}" \
#          pgmodeler.pro
#    make
  # PGM_PREFIX        -> the root directory where the files will be placed    
  # PGM_BINDIR        -> where executables accessible by the user resides    
  # PGM_PRIVATEBINDIR -> where executables not directly accessible by the user resides    
  # PGM_PRIVATELIBDIR -> where libraries not directly shared through the system resides    
  # PGM_PLUGINSDIR    -> where third party plugins are installed    
  # PGM_SHAREDIR      -> where shared files and resources should be placed    
  # PGM_CONFDIR       -> where the pgModeler's configuration folder (conf) resides    
  # PGM_DOCDIR        -> where documentation related files are placed    
  # PGM_LANGDIR       -> where the UI translation folder (lang) resides    
  # PGM_SAMPLESDIR    -> where the sample models folder (samples) resides    
  # PGM_SCHEMASDIR    -> where the object's schemas folder (schema) resides
    cmake -S . -B ./cmake-build \
                  -DCMAKE_PREFIX_PATH=$QT_ROOT -DCMAKE_BUILD_TYPE=Release \
                  -DPGM_PREFIX=/usr \
                  -DPGM_CONFDIR=/etc/pgmodeler \
                  -DPGM_BINDIR=/usr/bin \
                  -DPGM_DOCDIR=/usr/share/doc/pgmodeler \
                  -DPGM_SAMPLESDIR=/usr/share/doc/pgmodeler \
                  -DNO_UPDATE_CHECK=AURdoesthis \
                  --fresh CMakeLists.txt
    # Remove all those -mno-direct-extern-access. Dirty, but I have better things to do than wasting time on CMake
    # If someone reads this and has a cleaner solution, no problem with me, I'll put it in place :)
    find . -name flags.make -print0 | xargs -0 sed -i -e 's/-mno-direct-extern-access//'
    cmake --build ./cmake-build --target all
}

package() {
    cd "$srcdir/$pkgname-${pkgver//_/-}/cmake-build"
    make DESTDIR=${pkgdir} install
#    cmake --install ./cmake-build/ --prefix "${pkgdir}" -v

    #make INSTALL_ROOT="${pkgdir}" install
    cd ..

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


