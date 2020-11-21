# Maintainer: Christopher P. Fair <christopherpfair@comcast.net> 

pkgname=lacap
longname=latin-catholic-prayers
pkgver=0.5.2
pkgrel=5
pkgdesc="Memorize Catholic prayers in Latin."
arch=('i686' 'x86_64')
url="https://gitlab.com/chrisfair/latin-catholic-prayers"
license=('GPL3')
makedepends=('npm')
depends=('gtk3' 'webkit2gtk')
provides=('lacap')
source=("https://gitlab.com/chrisfair/latin-catholic-prayers/-/archive/V${pkgver}/latin-catholic-prayers-V${pkgver}.tar.gz")
sha256sums=('621a3b43dd90160a60b056fc8cdda82b54e7f85f169aad1444df28a7bf1ba989')

build() {
     export GOPATH="$srcdir"/gopath
     export GOBIN="$srcdir"/gopath/bin
     export PATH=$GOBIN:$PATH
     cd "$srcdir/$longname-V$pkgver"
     go get -u github.com/wailsapp/wails/cmd/wails >/dev/null 2>&1
     wails build -f >/dev/null 2>&1
}


package() {
	install -Dm755 $srcdir/$longname-V$pkgver/build/$longname $pkgdir/opt/chrisfair/$longname/$pkgname
	rsync -av --no-o --no-g $srcdir/$longname-V$pkgver/Prayers $pkgdir/opt/chrisfair/$longname/ >/dev/null 2>&1
	rsync -av --no-o --no-g $srcdir/$longname-V$pkgver/Sounds $pkgdir/opt/chrisfair/$longname/ >/dev/null 2>&1
	install -Dm755 $srcdir/$longname-V$pkgver/config_default.json $pkgdir/etc/$longname/config.json
     mkdir -p $pkgdir/usr/bin/
     cd $pkgdir/usr/bin
     ln -s /opt/chrisfair/$longname/$pkgname
     chmod -R uag+rw $srcdir
}
