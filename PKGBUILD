# Maintainer: Your Name ralph.bariz@gmail.com
pkgname=flow-causal
pkgver=0.1.0
pkgrel=3
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
source=("flow-base.zip::https://github.com/RalphBariz/flow-base/archive/$pkgver.zip"
        "flow-util.zip::https://github.com/RalphBariz/flow-util/archive/$pkgver.zip"
        "flow-alien.zip::https://github.com/RalphBariz/flow-alien/archive/$pkgver.zip"
        "flow-causal.zip::https://github.com/RalphBariz/flow-causal/archive/$pkgver.zip"
	"web.json"
	"causal.json"
	"flow-causal.service")
noextract=()
md5sums=('4405289e93df0e71fc00abf1ce104ea0'
         'edd89037b2300464df3176d0f249c32a'
         'eb81517aeff6f13be25d4f9352ea0f54'
         'e75d7530f3bc1fa17909e7bdaf86ade6'
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

	# compiling libraries
	mkdir -p dub
	cd dub

	unzip -o -qq ../flow-base.zip
	dub add-local flow-base-$pkgver

	unzip -o -qq ../flow-util.zip
	dub add-local flow-util-$pkgver

	unzip -o -qq ../flow-alien.zip
	dub add-local flow-alien-$pkgver
	
	cd ..

	# compiling app
	unzip -o -qq flow-causal.zip
	cd flow-causal-$pkgver
	dub build --build release
	cd bin

	# putting everything to the right place
	mkdir -p $pkgdir/usr/share/flow-causal/
	mkdir -p $pkgdir/usr/bin/
	cp -Lfr public $pkgdir/usr/share/flow-causal/
	cp -Lfr flow-causal $pkgdir/usr/bin/

	# removing library registrations
	dub remove-local ../../dub/flow-base-$pkgver
	dub remove-local ../../dub/flow-util-$pkgver
	dub remove-local ../../dub/flow-alien-$pkgver
}
