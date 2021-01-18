pkgname=screego-server-git
_pkgname=screego-server
pkgver=1.1.2
pkgrel=1
pkgdesc='screen sharing for developers (development version)'
arch=('x86_64' 'arm64')
url="https://github.com/screego/server"
license=('GPL3')
provides=("${_pkgname}")
conflict=("screego-server")
makedepends=('go' 'yarn')
optdepends=('nginx: to allow reverse proxy connections')
source=("$pkgname-repo::git+$url.git"
	"screego-server.service"
	"tmpfiles.conf"
	"sysusers.conf"
)
sha256sums=('SKIP'
            '7467398db76e4c14f7c4bd402b8dc1dce71866856ac9ae3d54cec6e5ce93155c'
            '1d4494d5328700b304b0837dafc7a5772b8abe3435a0a24337a89f25ad5acd1b'
            '5804e54e4af5704fd5066c45313d7635798bd4389cd8312ee965c911d9d75e85')

prepare(){
	cd "${_pkgname}-git-repo"
	go mod download
	cd ui
	yarn
	yarn build
}

build() {
	cd "${_pkgname}-git-repo"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-s -w -X main.version=${pkgver} -X main.commitHash=tag-v${pkgver} -X main.mode=prod" \
		-o "screego-server"
	}

check() {
	cd "${_pkgname}-git-repo"
	go test -v -race ./...
	cd ui
	yarn testformat
}

package() {
	mkdir -p "${pkgdir}/var/lib/screego-server/logs" \
		 "${pkgdir}/etc/screego/"
	install -Dm755 "${srcdir}/${_pkgname}-git-repo/screego-server" \
		       "${pkgdir}/var/lib/screego-server/"
	install -m755 "${srcdir}/${_pkgname}-git-repo/screego.config.example" \
		      "${pkgdir}/etc/screego/server.config"
	install -Dm644 "../$_pkgname.service" \
		       "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -Dm644 "../sysusers.conf" \
		       "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	install -Dm644 "../tmpfiles.conf" \
		       "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
