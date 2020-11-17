pkgname=screego-server
_pkgname=server
pkgver=1.1.1
pkgrel=1
pkgdesc='screen sharing for developers'
arch=('x86_64' 'arm64')
url="https://github.com/screego/$_pkgname"
license=('GPL3')
provides=("${pkgname}")
makedepends=('go' 'yarn')
optdepends=('nginx: to allow reverse proxy connections')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('8f698e8546bf3b21011d75fd498e770c104ee8a7783f93aaa72571708be0e30a')

prepare(){
	cd "$_pkgname-$pkgver"
	go mod download
	cd ui
	yarn
	yarn build
}

build() {
	cd "$_pkgname-$pkgver"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-s -w -X main.version=${pkgver} -X main.commitHash=tag-v${pkgver} -X main.mode=prod" \
		-o "screego-server"
	}

check() {
	cd "$_pkgname-$pkgver"
	go test -v -race ./...
	cd ui
	yarn testformat
}

package() {
	mkdir -p "${pkgdir}/var/lib/screego-server/logs" \
		 "${pkgdir}/etc/screego/"
	install -Dm755 "${srcdir}/$_pkgname-$pkgver/screego-server" \
		       "${pkgdir}/var/lib/screego-server/"
	install -m755 "${srcdir}/$_pkgname-$pkgver/screego.config.example" \
		      "${pkgdir}/etc/screego/server.config"
	install -Dm644 "../$pkgname.service" \
		       "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "../sysusers.conf" \
		       "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "../tmpfiles.conf" \
		       "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
