# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
pkgname=fwbuilder-qt5
pkgver=5.3.6
pkgrel=1
pkgdesc="Object-oriented GUI and set of compilers for various firewall platforms. Qt5 version."
url="http://www.fwbuilder.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxslt' 'net-snmp' 'qt5-base')
conflicts=('libfwbuilder' 'fwbuilder')
provides=('fwbuilder')
install=fwbuilder.install
source=("fwbuilder-${pkgver}.tar.gz::https://github.com/UNINETT/fwbuilder/archive/v${pkgver}.tar.gz"
		'fwbuilder.xml'
		'fwbuilder-gcc47.patch')
md5sums=('4d375b8bb98442f94c9dfaabc274387b'
            '520e08069addcdb946794458f49f3d10'
            'e603318d2874c0eb7674fc81b7b93ba8')

prepare() {
  cd "${srcdir}/fwbuilder-${pkgver}"
  patch -p1 -i "$srcdir/fwbuilder-gcc47.patch"
  echo "#include <QObject>" | tee -a \
     src/import/IOSImporter.h \
     src/pflib/RoutingCompiler_openbsd.h \
     >/dev/null
     
}

			
build() {
  cd "${srcdir}/fwbuilder-${pkgver}"
  export CXXFLAGS="$CXXFLAGS -fno-var-tracking-assignments"
  ./autogen.sh
  ./configure --prefix=/usr --with-qmake=qmake-qt5
  make
}

package() {
  cd "${srcdir}/fwbuilder-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  echo "MimeType=text/x-xml-fwbuilder;" >> "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "$srcdir/fwbuilder.xml" "$pkgdir/usr/share/mime/packages/fwbuilder.xml"
}
