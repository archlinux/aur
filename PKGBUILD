# Maintainer: Your Name ralph.bariz@gmail.com
pkgname=flow-causal
pkgver=0.1.1
pkgrel=1
epoch=0
pkgdesc="flow causal studio"
arch=('i685' 'x86_64')
url="https://github.com/RalphBariz/flow"
license=('GPL3')
groups=('flow')
depends=()
makedepends=('dub' 'unzip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=pkg.install
changelog=
source=("flow-$pkgver.zip::https://codeload.github.com/RalphBariz/flow/zip/v$pkgver"
	"web.json"
	"causal.json"
	"flow-causal.service")
noextract=()
md5sums=('6f3df3e12c524c5cb1a52d5f0d220f18'
         'b92fb60eac286af67f3d9c811ae5959a'
         '60705357a2f2d74107f5570ff41ac2d0'
         '006839636fa061ad5397ae95e2cfe887')
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#build() {
#	cd "$pkgname-$pkgver"
#	./configure --prefix=/usr
#	make
#}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	# creating configuration
	mkdir -p $pkgdir/etc/flow-causal/
	cp -Lfr *.json $pkgdir/etc/flow-causal/

	# creating systemd service
	mkdir -p $pkgdir/usr/lib/systemd/system/
	cp -Lfr flow-causal.service $pkgdir/usr/lib/systemd/system/flow-causal.service
	chmod 644 $pkgdir/usr/lib/systemd/system/flow-causal.service

	# unpacking
	unzip -o -qq flow-$pkgver.zip
	cd flow-$pkgver

	# compiling
	dub add-path ./
	cd causal
	dub build --build release --force
	cd ..
	dub remove-path ./

	# putting everything to the right place
	cd causal/bin
	mkdir -p $pkgdir/usr/share/flow-causal/
	mkdir -p $pkgdir/usr/bin/
	cp -Lfr public $pkgdir/usr/share/flow-causal/
	cp -Lfr flow-causal $pkgdir/usr/bin/
}
