# Maintainer: Marat Moustafine <m-dash-moustafine-at-yandex-dot-ru>

pkgname=centrifugo
pkgver=1.5.1
pkgrel=1
pkgdesc="Real-time messaging server for web applications"
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/centrifugal/centrifugo/"
license=("MIT")
depends=('systemd')
makedepends=('go' 'git')
install=$pkgname.install
backup=("etc/$pkgname/config.json")
_vendor="github.com/centrifugal"
source=("git+https://$_vendor/$pkgname.git#tag=v$pkgver"
        "$pkgname.service"
        "$pkgname.sysusers")
sha256sums=('SKIP'
            'd1840e7ef5a3b31cad41f498ce02d33d5d88c70f408f9783511387b496ab99e1'
            '0e8c55453bb4c6ea868f4b095237523da85b478fbfda7f1518299cba5356c09f')

prepare() {
	mkdir -p ./$_vendor
	mv $pkgname ./$_vendor
}

build() {
	cd ../
	export GOPATH=$PWD

	cd $srcdir/$_vendor/$pkgname
	go build
}

package() {
	cd $srcdir/$_vendor/$pkgname
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

	install -Dm644 config.json $pkgdir/etc/centrifugo/config.json

	mkdir -p $pkgdir/etc/default
	touch $pkgdir/etc/default/centrifugo

	cd $srcdir
	install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -Dm644 $srcdir/$pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
}
