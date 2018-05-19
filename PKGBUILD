pkgname=aylinux-plymouth-tema-ayar
pkgver=0.7
pkgrel=1
pkgdesc="Plymouth tema ayarlama programı"
arch=('i686' 'x86_64')
license=('GPL')
depends=('plymouth')
makedepends=('git' 'qt5-base')

url='https://github.com/oltulu/Aylinux-Plymouth-Tema-Ayar'

source=("${pkgname}::git+https://github.com/oltulu/Aylinux-Plymouth-Tema-Ayar.git")
md5sums=('SKIP')

prepare() {
    cd ${srcdir}/${pkgname}
}

build() {
cd ${srcdir}/${pkgname}
qmake-qt5 Aylinux-Plymouth.pro -spec linux-g++ CONFIG+=debug CONFIG+=qml_debug 
make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
    

# Başlatıcı 
mkdir -pv $pkgdir/usr/share/applications &&
cat > $pkgdir/usr/share/applications/$pkgname.desktop << "EOF" &&
#!/usr/bin/env xdg-open
[Desktop Entry]
Exec=sudo -i Aylinux-Plymouth
Icon=/usr/share/aylinux-plymouth/archlinux.png
Name=Aylinux-Plymouth
StartupNotify=true
Comment=Plymouth Teması Ayarlama
Terminal=false
Type=Application
Categories=System;
EOF

    mkdir -pv $pkgdir/usr/share/aylinux-plymouth
    mkdir -pv $pkgdir/usr/share/plymouth/themes
    mv Aylinux-Plymouth $pkgdir/usr/share/aylinux-plymouth/
    mv archlinux.png $pkgdir/usr/share/aylinux-plymouth/
    mkdir -pv $pkgdir/usr/bin
    ln -s "/usr/share/aylinux-plymouth/Aylinux-Plymouth"  "$pkgdir/usr/bin/Aylinux-Plymouth"
    cp -r resimler $pkgdir/usr/share/aylinux-plymouth/
    cp -r temalar/* $pkgdir/usr/share/plymouth/themes/
}
