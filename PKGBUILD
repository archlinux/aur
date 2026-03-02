# Maintainer: Finn Coffey <aur@soxfox.me>
pkgname=codecrafters
pkgver=52
pkgrel=2
pkgdesc="CLI to interact with codecrafters.io"
arch=("x86_64" "aarch64")
url="https://github.com/codecrafters-io/cli"
license=("MIT")
depends=("git" "glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}::git+https://github.com/codecrafters-io/cli#tag=v${pkgver}")
sha256sums=('ca071f21303955527f15bb7c751c1203ee186410ba106a56c55a44b9c14dfb98')

prepare() {
	cd "${pkgname}-${pkgver}"
	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
	cd "${pkgname}-${pkgver}"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"
			-X github.com/codecrafters-io/cli/internal/utils.Version=${pkgver}
			-X github.com/codecrafters-io/cli/internal/utils.Commit=$(git rev-parse HEAD)" \
		-o codecrafters \
		cmd/codecrafters/main.go
}

check() {
	cd "${pkgname}-${pkgver}"
	# codecrafters gitignore tests depend on having a global config available
	# makepkg usually sets this to /dev/null
	export GIT_CONFIG_GLOBAL=$(mktemp)
	go test ./...
}

package() {
	cd "${pkgname}-${pkgver}"
	install -D codecrafters -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
