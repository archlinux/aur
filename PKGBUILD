# Maintainer: Ross <git@ross.ch>

pkgname=docker-secrets-engine-shim
pkgver=0.3.0 # renovate: datasource=github-releases depName=chadsr/docker-secrets-engine-shim
pkgrel=1
pkgdesc="Unofficial Docker Secrets Engine implementation, via docker-credential-helpers"
arch=('x86_64' 'aarch64')
url='https://github.com/chadsr/docker-secrets-engine-shim'
license=('MIT')
depends=('docker' 'glibc')
makedepends=('go')
optdepends=(
	'docker-credential-pass: credential helper using pass'
	'docker-credential-secretservice: credential helper using D-Bus secret service'
)
provides=('docker-secrets-engine')
conflicts=('docker-secrets-engine' 'docker-secrets-engine-bin')
install=docker-secrets-engine-shim.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b543950adcaabe28aa5fd21662c7d81365b5402ab460e41c3eaa26bbe06f9353448e03d23fd3d35021062f380e25bb74f7d34a25df40aa07970112fa86daabfd')

prepare() {
	cd "$pkgname-$pkgver"
	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOPATH="${srcdir}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	_date="$(date -u --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT%H:%M:%SZ)"
	_ldflags="-linkmode external -extldflags \"${LDFLAGS}\""
	go build \
		-ldflags "$_ldflags -X main.version=v$pkgver -X main.date=$_date" \
		-o build/docker-secrets-engine-shim \
		./cmd/secrets-engine-shim
}

check() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOPATH="${srcdir}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/docker-secrets-engine-shim \
		"$pkgdir/usr/bin/docker-secrets-engine-shim"

	# Named to match the official docker-pass plugin, so docker's plugin discovery works
	ln -s docker-secrets-engine-shim "$pkgdir/usr/bin/docker-pass"
	install -d "$pkgdir/usr/lib/docker/cli-plugins"
	ln -s ../../../bin/docker-secrets-engine-shim \
		"$pkgdir/usr/lib/docker/cli-plugins/docker-pass"

	# Shared docker NRI plugin directory
	install -d "$pkgdir/usr/lib/docker/nri-plugins"
	ln -s ../../../bin/docker-secrets-engine-shim \
		"$pkgdir/usr/lib/docker/nri-plugins/10-secrets-engine"

	install -Dm644 packaging/systemd/user/docker-secrets-engine-shim.service \
		"$pkgdir/usr/lib/systemd/user/docker-secrets-engine-shim.service"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
