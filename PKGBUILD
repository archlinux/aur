# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
pkgname=tetra-kit-git
pkgver=r110.3a18aec
pkgrel=2
pkgdesc="TETRA downlink decoder/recorder kit"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('gnuradio-companion' 'gnuradio-osmosdr' 'rapidjson' 'sox' 'zlib' 'ncurses')
url="https://gitlab.com/larryth/tetra-kit"
source=($pkgname::"git+$url.git")

sha256sums=('SKIP')
#replacing the GUI with the patch
prepare(){
    cd $srcdir/$pkgname/phy/gnuradio-3.10/
    rm *.grc
    echo -e "Applying gnuradio patch...\n"
    curl -fLO https://gitlab.com/ericek111/tetra-kit/-/raw/master/phy/gnuradio-3.10/pi4dqpsk_rx.grc

}

build(){
    cd $srcdir/$pkgname
    ./build.sh
}

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $srcdir
    install -dm755 $pkgdir/usr/bin
    install -dm755 $pkgdir/opt/tetra-kit
    cp -r $pkgname/* $pkgdir/opt/tetra-kit/
    cd $pkgdir/usr/bin
    ln -s ../../opt/tetra-kit/recorder/recorder ./tetra-recorder
    ln -s ../../opt/tetra-kit/decoder/decoder ./tetra-decoder
    echo "gnuradio-companion /opt/tetra-kit/phy/gnuradio-3.10/pi4qpsk_rx.grc" > tetra-gui
    chmod +x tetra-gui
    echo "sh /opt/tetra-kit/recorder/wav/out2wav.sh" > tetra-stream
    chmod +x tetra-stream
    echo -e "Done!\nAll the source files are located in /opt/tetra-kit!"
}

