pkgname=kndiswrapper-qt5
pkgver=20151216.gfe796ea
pkgrel=1
pkgdesc='Frontend for ndiswrapper'
url='http://kde-apps.org/content/show.php/KNDISWrapper?content=86885'
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-base' 'ndiswrapper')
makedepends=('qt5-tools')
provides=(kndiswrapper)
conflicts=(kndiswrapper)
source=("git+https://github.com/maz-1/kndiswrapper.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/kndiswrapper"
  echo "$(git show -s --format="%ci"|grep -oP '\d{4}-\d{2}-\d{2}'|sed 's:-::g').g$(git describe --always)"
}

build() {
  cd "$srcdir/kndiswrapper"
  mkdir -p build
  cd build
  qmake-qt5 ..
  make
  cd ..
  cp -r translations ./build/
  lrelease-qt5 ./build/translations/*.ts
}
package() {
  cd "$srcdir/kndiswrapper"
  #./install.sh "$pkgdir"
  mkdir -p ${pkgdir}/usr/share/{kndiswrapper,applications,pixmaps}
  mkdir -p ${pkgdir}/usr/bin
  
  cp "./icons/kndiswrapper.svg" "${pkgdir}/usr/share/kndiswrapper/kndiswrapper.svg"
  cp "./icons/kndiswrapper.svg" "${pkgdir}/usr/share/pixmaps/kndiswrapper.svg"
  cp build/kndiswrapper ${pkgdir}/usr/bin
  chmod 755 "${pkgdir}/usr/bin/kndiswrapper"
  cp "./build/translations/"*.qm "${pkgdir}/usr/share/kndiswrapper"
  cp "./build/translations/cards_known_to_work.txt" "${pkgdir}/usr/share/kndiswrapper"
  cat > "${pkgdir}/usr/share/applications/kndiswrapper.desktop" <<EOF
[Desktop Entry]
Encoding=UTF-8
Name=kndiswrapper
Name[de]=kndiswrapper
GenericName=kndiswrapper
GenericName[de]=kndiswrapper
Comment=A GUI for ndiswrapper
Comment[de]=Eine GUI fuer ndiswrapper.
Exec=kndiswrapper
Icon=kndiswrapper
Terminal=false
Type=Application
StartupNotify=true
Categories=Network;
EOF

}
