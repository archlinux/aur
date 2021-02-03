# Maintainer: Danila Fedotov <mail at danilafedotov dot com>
# Previous Maintainer: Gökberk Yaltıraklı <webdosusb at gmail dot com>
pkgname=notes
pkgver=1.5.0
_commmit=4840afcf0ea87f9b9eecc849ef3e4ec2e36894d7
pkgrel=1
pkgdesc="Note taking application, write down your thoughts."
arch=('i686' 'x86_64')
url="https://github.com/nuttyartist/notes"
license=('MPL')
depends=('qt5-base')
makedepends=(git)
provides=('notes')
conflicts=('notes')

prepare() {
    cd "$srcdir"
    git clone https://github.com/nuttyartist/notes.git
    cd "$srcdir/notes"
    git reset --hard $_commit
    git submodule init
    git submodule update
}

build() {
  cd "$pkgname"

  cat > $pkgname.desktop << EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Terminal=false
StartupNotify=true
Name=Notes
Comment=$pkgdesc
Categories=Utility;Application;
Exec=/usr/bin/${pkgname}
Icon=/usr/share/pixmaps/${pkgname}_icon.ico
EOF

  mkdir build
  cd build
  qmake ../src/
  make
}

package() {
  cd "$pkgname"
  install -Dm755 build/notes $pkgdir/usr/bin/$pkgname
  install -Dm644 src/images/notes_icon.ico $pkgdir/usr/share/pixmaps/${pkgname}_icon.ico
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
