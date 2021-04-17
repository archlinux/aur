pkgname=screego-server
_pkgname=screego-server
pkgver=1.2.2
pkgrel=1
pkgdesc='screen sharing for developers'
arch=('x86_64' 'arm64')
url="https://github.com/screego/server"
license=('GPL3')
provides=("${pkgname}")
onflict=("screego-server")
makedepends=('go' 'yarn')
optdepends=('nginx: to allow reverse proxy connections')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"screego-server.service"
	"tmpfiles.conf"
	"sysusers.conf"
)
sha256sums=('0d32cdd4af15ae37c138b90fcab7537841ee43209dee5441cdf154a7b9e5d6ea'
            '7467398db76e4c14f7c4bd402b8dc1dce71866856ac9ae3d54cec6e5ce93155c'
            '1d4494d5328700b304b0837dafc7a5772b8abe3435a0a24337a89f25ad5acd1b'
            '5804e54e4af5704fd5066c45313d7635798bd4389cd8312ee965c911d9d75e85')

prepare(){
	cd "server-$pkgver"
	go mod download
	cd ui
	yarn
	yarn build
}

build() {
	cd "server-$pkgver"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-s -w -X main.version=${pkgver} -X main.commitHash=tag-v${pkgver} -X main.mode=prod" \
		-o "screego-server"
	}

check() {
	cd "server-$pkgver"
	go test -v -race ./...
	cd ui
	yarn testformat
}

package() {
	mkdir -p "${pkgdir}/var/lib/screego-server/logs" \
		 "${pkgdir}/etc/screego/"
	install -Dm755 "${srcdir}/server-$pkgver/screego-server" \
		       "${pkgdir}/var/lib/screego-server/"
	install -m755 "${srcdir}/server-$pkgver/screego.config.example" \
		      "${pkgdir}/etc/screego/server.config"
	install -Dm644 "../$pkgname.service" \
		       "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "../sysusers.conf" \
		       "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "../tmpfiles.conf" \
		       "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
