pkgname=kndiswrapper-qt5
pkgver=0.4.0
pkgrel=1
pkgdesc='Frontend for ndiswrapper'
url='http://kde-apps.org/content/show.php/KNDISWrapper?content=86885'
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-base' 'ndiswrapper' 'polkit')
makedepends=('qt5-tools')
provides=kndiswrapper
conflicts=kndiswrapper
source=("http://ftp.riken.jp/Linux/momonga/development/source/SOURCES/kndiswrapper-${pkgver}.tgz" "qt5.patch")
sha1sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir/kndiswrapper-${pkgver}"
  patch -p1 -i $srcdir/qt5.patch
}

build() {
  cd "$srcdir/kndiswrapper-${pkgver}"
  mkdir -p build
  cd build
  qmake-qt5 ..
  make
  cd ..
  cp -r translations ./build/
  lrelease-qt5 ./build/translations/*.ts
}
package() {
  cd "$srcdir/kndiswrapper-${pkgver}"
  #./install.sh "$pkgdir"
  mkdir -p ${pkgdir}/usr/share/{kndiswrapper,applications,pixmaps}
  mkdir -p ${pkgdir}/usr/bin
  
  cp "./icons/kndiswrapper.xpm" "${pkgdir}/usr/share/kndiswrapper/kndiswrapper.xpm"
  cp "./icons/kndiswrapper.xpm" "${pkgdir}/usr/share/pixmaps/kndiswrapper.xpm"
  cp build/kndiswrapper ${pkgdir}/usr/bin
  chmod 755 "${pkgdir}/usr/bin/kndiswrapper"
  cp "./translations/"*.qm "${pkgdir}/usr/share/kndiswrapper"
  cp "./translations/cards_known_to_work.txt" "${pkgdir}/usr/share/kndiswrapper"
  cat > "${pkgdir}/usr/share/applications/kndiswrapper.desktop" <<EOF
[Desktop Entry]
Encoding=UTF-8
Name=kndiswrapper
Name[de]=kndiswrapper
GenericName=kndiswrapper
GenericName[de]=kndiswrapper
Comment=A GUI for ndiswrapper
Comment[de]=Eine GUI fuer ndiswrapper.
Exec=pkexec env DISPLAY=\$DISPLAY XAUTHORITY=\$XAUTHORITY kndiswrapper
Icon=kndiswrapper
Terminal=false
Type=Application
StartupNotify=true
Categories=Network;
EOF

}
