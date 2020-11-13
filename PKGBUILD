# Maintainer: Christopher P. Fair <christopherpfair@comcast.net> 

pkgname=lacap
longname=latin-catholic-prayers
pkgver=0.3.2
pkgrel=1
pkgdesc="Memorize Catholic prayers in Latin."
arch=('i686' 'x86_64')
url="https://gitlab.com/chrisfair/latin-catholic-prayers"
license=('GPL3')
makedepends=('npm')
depends=('gtk3' 'webkit2gtk')
provides=('lacap')
source=("https://gitlab.com/chrisfair/latin-catholic-prayers/-/archive/v${pkgver}/latin-catholic-prayers-v${pkgver}.tar.gz")
sha256sums=('f36eca7d74345df26c6341df8501d6ed8157be870cb59b2c4df42f14b39300c5')

build() {
     export GOPATH="$srcdir"/gopath
     export GOBIN="$srcdir"/gopath/bin
     export PATH=$GOBIN:$PATH
     cd "$srcdir/$longname-v$pkgver"
     go get -u github.com/wailsapp/wails/cmd/wails
     wails build -f
}


package() {
	install -Dm755 $srcdir/$longname-v$pkgver/build/$longname $pkgdir/opt/chrisfair/$longname/$pkgname
	rsync -av --no-o --no-g $srcdir/$longname-v$pkgver/Prayers $pkgdir/opt/chrisfair/$longname/ >/dev/null 2>&1
	rsync -av --no-o --no-g $srcdir/$longname-v$pkgver/Sounds $pkgdir/opt/chrisfair/$longname/ >/dev/null 2>&1
	rsync -av --no-o --no-g $srcdir/$longname-v$pkgver/Words $pkgdir/opt/chrisfair/$longname/ >/dev/null 2>&1
	install -Dm755 $srcdir/$longname-v$pkgver/config_default.json $pkgdir/etc/$longname/config.json
     mkdir -p $pkgdir/usr/bin/
     cd $pkgdir/usr/bin
     ln -s /opt/chrisfair/$longname/$pkgname
     chmod -R uag+rw $srcdir
}
