# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=('qt5-singleapplication' 'qt5-singlecoreapplication' 'qt5-singleapplication-doc' 'qt5-singlecoreapplication-doc')
pkgver=2.6_20170914
_commit=a8dda66d7738cde9042b87db27993f710ae3eeeb
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Qt library to start applications only once per user"
url="https://doc.qt.io/archives/qtextended4.4/qtopiadesktop/qtsingleapplication.html"
license=('BSD')
depends=('qt5-base')
source=("https://github.com/qtproject/qt-solutions/archive/${_commit}.tar.gz"
        'qtsingleapplication-build-qtsinglecoreapplication.patch'
        'qtsingleapplication-qupzilla.patch'
        'qtsingleapplication.prf'
        'qtsinglecoreapplication.prf')
sha512sums=('SKIP'
            'a459cc42e98cd6b1e58d464fb28861ed4453b9d2f96a11cd8ac68e06c74083ef05452aabe08c4625229aa19de865522cec3cb994504e9eff796ee1033bc38ad2'
            'd8b2b27380a407b84a461fa93ca68751f503a495200e2204b576e6f27b9768ab6e77a1a47c63c90fa5803a9a055b7c0546f8ae4aa9f0fa5cc5969af3e889d4f2'
            '9495604598221ed94a0d5be486468bc0fc936bbe8a22d3c7c23738d48e67a5516bd496e24b7678c1a05ed7b8e3cd0578d6272629e23cd74c4a360f20cf3b663b'
            '580fbaf9c7e0c9813e0aeb2c62522aa1c2baccbf384b3ca780441313612b9be0e0df220cd8b186ec7a0b5d30aaed8249f7c9ebb93ef8e0ec46793d4eaf2a9bf7')

prepare() {
  cd "qt-solutions-${_commit}"
  patch --forward --strip=1 --input="${srcdir}/qtsingleapplication-build-qtsinglecoreapplication.patch"
  patch --forward --strip=1 --input="${srcdir}/qtsingleapplication-qupzilla.patch"

  # Header needed for Qt5.5+
  cd qtsingleapplication/src
  sed -i -r 's,.include,\0 <QtCore/QDataStream>\n\0,' qtlocalpeer.h
}

build() {
  cd qt-solutions-${_commit}/qtsingleapplication
  ./configure -library
  qmake
  make

  sed -n '/Copyright/,/END_LICENSE/p' src/qtsingleapplication.cpp > LICENSE
  sed -i 's/\*\*//g' LICENSE
  sed -i 's/^\ //g' LICENSE
}

package_qt5-singleapplication() {
  cd qt-solutions-${_commit}/qtsingleapplication

  mkdir -p "${pkgdir}/usr/lib"
  cp -d ./lib/libQt5Solutions_SingleApplication-head.so* \
        "${pkgdir}/usr/lib"

  mkdir -p "${pkgdir}/usr/include/qt/QtSolutions"
  cp -p ./src/qtsingleapplication.h \
        "${pkgdir}/usr/include"

  echo "#include \"qtsingleapplication.h\"" > \
       "${pkgdir}/usr/include/qt/QtSolutions/QtSingleApplication"

  mkdir -p "${pkgdir}/usr/lib/qt5/mkspecs/features"
  cp "${srcdir}/qtsingleapplication.prf" "${pkgdir}/usr/lib/qt5/mkspecs/features"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -p LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_qt5-singlecoreapplication() {
  pkgdesc="Qt library to start applications only once per user, for non-GUI apps"

  cd qt-solutions-${_commit}/qtsingleapplication

  mkdir -p "${pkgdir}/usr/lib"
  cp -d ./lib/libQt5Solutions_SingleCoreApplication-head.so* \
        "${pkgdir}/usr/lib"

  mkdir -p "${pkgdir}/usr/include/qt/QtSolutions"
  cp -p ./src/qtsinglecoreapplication.h \
        "${pkgdir}/usr/include/qt/QtSolutions"

  echo "#include \"qtsinglecoreapplication.h\"" > \
       "${pkgdir}/usr/include/qt/QtSolutions/QtSingleCoreApplication"

  mkdir -p "${pkgdir}/usr/lib/qt5/mkspecs/features"
  cp "${srcdir}/qtsinglecoreapplication.prf" "${pkgdir}/usr/lib/qt5/mkspecs/features"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -p LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_qt5-singleapplication-doc() {
  pkgdesc="Qt library to start applications only once per user (Documentation)"

  cd qt-solutions-${_commit}/qtsingleapplication

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -rp ./doc/html ./examples "${pkgdir}/usr/share/doc/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -p LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_qt5-singlecoreapplication-doc() {
  pkgdesc="Qt library to start applications only once per user, for non-GUI apps (Documentation)"

  cd qt-solutions-${_commit}/qtsingleapplication

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -rp ./doc/html ./examples "${pkgdir}/usr/share/doc/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -p LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
