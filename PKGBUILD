# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>
pkgname=upyloader-git
pkgver=0.3245c72
pkgrel=2
pkgdesc="File transfer and communication tool for MicroPython boards."
arch=('any')
url="https://github.com/zindy/uPyLoader"
license=('MIT')
depends=(
  'python'
  'sudo'
  'git'
  'python-pyqt5'
  'python-pyserial'
  'kdesu'
)
source=("$pkgname::git+https://github.com/zindy/uPyLoader.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo 0.$( git describe --always | sed 's#-#_#g;s#v##' )
}

package() {
    cd "$srcdir"
    
cat > upyloader << EOF
#!/bin/bash
kdesu chmod 666 /dev/ttyUSB* # Required if using direct connexion
cd /usr/share/upyloader
python3 main.py

EOF

cat > upyloader.desktop << EOF
[Desktop Entry]
Type=Application
Version=1.4
Name=uPyLoader
Comment=File transfer and communication tool for MicroPython boards
Exec=upyloader
Icon=upyloader
Categories=Languages;Python;Development
EOF
    
    chmod a+x upyloader

    install -Dm755 upyloader -t $pkgdir/usr/bin
    install -Dm755 upyloader.desktop $pkgdir/usr/share/applications/upyloader.desktop
    install -Dm644 $pkgname/icons/main.svg $pkgdir/usr/share/pixmaps/upyloader.svg
    
    
    if [ -d $pkgdir/usr/share/upyloader ]; then
        rm -Rf $pkgdir/usr/share/upyloader
    fi
    mkdir -p $pkgdir/usr/share/upyloader
    
    cp -Rv $pkgname/src $pkgdir/usr/share/upyloader/
    cp -Rv $pkgname/icons $pkgdir/usr/share/upyloader/
    cp -Rv $pkgname/gui $pkgdir/usr/share/upyloader/
    cp -Rv $pkgname/mcu $pkgdir/usr/share/upyloader/
    
    install -Dm755 $pkgname/*.py -t $pkgdir/usr/share/upyloader
    #install -D $pkgname/main.spec -t $pkgdir/usr/share/upyloader
}
