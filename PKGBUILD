# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=goploader-server
_pkgname=goploader
pkgver=1.0
pkgrel=1
pkgdesc="Easy file sharing with server-side encryption, curl/httpie/wget compliant"
arch=("x86_64")
depends=()
makedepends=("go" "dep")
url="https://gpldr.in"
license=("MIT")
backup=('etc/goploader/conf.yml')
source=("goploader-server-v1.0.tar.gz::https://github.com/Depado/$_pkgname/archive/v$pkgver.tar.gz"
		"$pkgname.sysusers")


sha256sums=('0310c9616ad14fed3c253940a12f37678e5ec6cc18f761f9c5f7abe68e9be020'
			'3a33d7a1353376018713ac9ca683ecc967a9b2e0c13695c3037edd55b1366510')

build() {
	cd "$srcdir"
	rm -rf src/github.com/Depado
	mkdir -p src/github.com/Depado/
	mv $_pkgname-$pkgver src/github.com/Depado/$_pkgname
	export GOPATH="$srcdir"
	cd src/github.com/Depado/$_pkgname/server
	dep ensure
	go get github.com/GeertJohan/go.rice/rice
	"$srcdir"/bin/rice embed-go -i=github.com/Depado/goploader/server
	go build .
}

package() {
	install -Dm644 "$pkgname.sysusers"  "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	
	install -Dm755 "src/github.com/Depado/$_pkgname/server/server"  "$pkgdir/usr/bin/$_pkgname"
	
	install -Dm644 "src/github.com/Depado/$_pkgname/server/examples/conf.yml.example"  "$pkgdir/etc/$_pkgname/conf.yml"
	sed -i  "s@/up@/var/lib/$_pkgname@" "$pkgdir/etc/$_pkgname/conf.yml"
	
	install -Dm644 "src/github.com/Depado/$_pkgname/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
	
	install -Dm644 "src/github.com/Depado/$_pkgname/server/examples/systemd/$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	sed -i  "s@WorkingDirectory=/data/goploader-server@@;s@www-data@goploader@;s@/data/goploader-server/server@/usr/bin/$_pkgname -c /etc/$_pkgname/conf.yml@g" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	
	install -Dm644 "src/github.com/Depado/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
