# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Fuad Saud <fuadfsaud@gmail.com>

_pkgname=damon
pkgname=${_pkgname}-git
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=0.1.0.r75.411021d
pkgrel=1
pkgdesc="A terminal UI (TUI) for HashiCorp Nomad"
arch=('i686' 'x86_64' 'arm' 'aarch64')
license=('MPL2')
url="https://github.com/hashicorp/damon"
depends=('glibc')
makedepends=('git' 'go')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	# TODO: possibly remove once package gets a versioned tag
	(
	set -o pipefail
	git describe --long --tags --match '[v0-9]*' 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	) ||
	printf "%s.r%s.%s" "$(sed -En '/Version = /{s/.*"([^"]+)"$/\1/;p}' version/version.go)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${_pkgname}"

	# create directory for build output
	mkdir -p build

	# download dependencies
	go mod download
}

build() {
	cd "${_pkgname}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOPATH="${srcdir}"
	git_commit=$(git rev-parse --short HEAD)
	go build \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags="-linkmode=external -compressdwarf=false -X github.com/hcjulz/damon/version.GitCommit=${git_commit}" \
		-o './build/damon' \
		'./cmd/damon'
}

check() {
	cd "${_pkgname}"
	export GOFLAGS="-ldflags=-linkmode=external"
	go test -v ./...
}

package() {
	cd "${_pkgname}"
	install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
