# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
pkgname=tetra-kit-player-git
pkgver=r65.ea258fc
pkgrel=2
pkgdesc="Web application that streams events and files produced by tetra kit."
arch=('any')
license=('CUSTOM')
makedepends=('git' 'npm')
options=(!strip)
depends=('tetra-kit-git' 'npm')
url="https://github.com/sonictruth/tetra-kit-player"
source=($pkgname::"git+$url.git")

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

sha256sums=('SKIP')
build(){
    cd $srcdir/$pkgname
    npm i
}

package() {
    cd $srcdir
    install -dm755 $pkgdir/usr/bin
    install -dm755 $pkgdir/opt/$pkgname
    #removing experimental feature since version 16
    echo "applying patch..."
    sed -i "s/--experimental-wasm-bigint//g" $pkgname/package.json 
    cp -r $pkgname $pkgdir/opt/
    cd $pkgdir/usr/bin
    echo "tetra-decoder & tetra-recorder & cd /opt/$pkgname && npm run start" > tetra-kit-player
    chmod +x tetra-kit-player
    echo -e "Done!\nAll the source files are located in /opt/$pkgname!\nPlease edit the .env file to your needs."
}

