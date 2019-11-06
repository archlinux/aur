# Maintainer: PastLeo <chgu82837@gmail.com>
pkgname=ooni-probe-cli-git
pkgver=r232.946289d
pkgrel=3
pkgdesc="Next generation OONI Probe CLI"
arch=('i686' 'x86_64')
url='https://github.com/ooni/probe-cli'
license=('BSD')
groups=()
depends=('zlib' 'libevent' 'openssl' 'libnghttp2' 'curl' 'libmaxminddb')
makedepends=('git' 'gcc' 'go' 'measurement-kit')
provides=('ooni-probe-cli')
conflicts=('ooni-probe-cli')
source=(
	'git+git://github.com/ooni/probe-cli.git#commit=946289d6fe34c5f0f1c37c891b4af7c281d36e9d'
	'ooni-engine-measurementkit-task_gco.go.patch'
)
noextract=()
md5sums=(
	'SKIP'
	'e36ee10a071236d376c3b1971f987210'
)

pkgver() {
	cd "$srcdir/probe-cli"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/probe-cli"
	export GOPATH="$srcdir/go"

	go mod download
	chmod -R 755 "$srcdir/go/pkg/mod"
	patch "$srcdir/go/pkg/mod/github.com/ooni/probe-engine@v0.1.2-0.20191028114635-c87abaaf94e7/measurementkit/task_cgo.go" "$srcdir/ooni-engine-measurementkit-task_gco.go.patch"

	go build -o dist/linux/amd64/ooniprobe -v ./cmd/ooniprobe
}

package() {
	cd "$srcdir/probe-cli"
	install -Dm755 dist/linux/amd64/ooniprobe "$pkgdir"/usr/bin/ooniprobe
}
