# Maintainer: fitu996 <fitu996 at gmail dot com>
pkgname=ffqueue-git
pkgver=r3.3e4c8ab
pkgrel=1
pkgdesc='FFQueue is (yet another) graphical user interface for FFMpeg with comprehensive support for both the basic features but also the more advanced features like filtergraphs.(git version)'
arch=('i686' 'x86_64')
url='http://ffqueue.bruchhaus.dk/'
license=('GPL3')
depends=('ffmpeg' 'wxgtk2' 'xterm')
depends_x86_64=()
optdepends_x86_64=()
makedepends=()
provides=('ffqueue')
conflicts=('ffqueue')
source=("$pkgname"::'git://github.com/bswebdk/FFQueue.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd "$pkgname/"
    sed -i "s?m_ConfigPath = exe;?m_ConfigPath = wxGetCwd();?g" ./src/utils/FFQConfig.cpp
    sed -i "s?WX:=../wxWidgets?WX:=/usr/lib/wx?g" ./Makefile.lin
    sed -i "s?\$(WX)/gtk-build/wx-config --version=3.1 --static=yes?wx-config?g" ./Makefile.lin
    sed -i "s?LINKVARS:=\$(shell wx-config --debug=no --libs) -s -static-libgcc -static-libstdc++?LINKVARS:=\$(shell wx-config --debug=no --libs)  -s -static-libgcc -static-libstdc++ -lz?g" ./Makefile.lin
}

build() {
    cd "$pkgname/"
    #you can change maximum compile threads. "-j5" means 5 threads.
    make -f Makefile.lin -j5
}

package() {
    cd "$pkgname"
    install -d $pkgdir/usr/bin/
    install -m 755 ./build/FFQueue $pkgdir/usr/bin/
    install -d $pkgdir/usr/share/pixmaps/
    install -m 644 ./res/MainLogo.png $pkgdir/usr/share/pixmaps/ffqueue.png
    echo "[Desktop Entry]" > ffqueue.desktop
    echo "Categories=AudioVideo;AudioVideoEditing;" >>ffqueue.desktop
    echo "Comment=Graphical user interface for FFMpeg with comprehensive support for both the basic features but also the more advanced features like filtergraphs." >>ffqueue.desktop
    echo "Name=FFQueue" >>ffqueue.desktop
    #You can change yourconfigure file directory below:
    echo "Path=~" >>ffqueue.desktop
    echo "GenericName=Graphical user interface for FFMpeg" >>ffqueue.desktop
    echo "Exec=FFQueue %U" >>ffqueue.desktop
    echo "Icon=ffqueue" >>ffqueue.desktop
    echo "Type=Application" >>ffqueue.desktop
    echo "Terminal=false" >>ffqueue.desktop
    install -d $pkgdir/usr/share/applications/
    install -m 644 ffqueue.desktop $pkgdir/usr/share/applications/
} 
