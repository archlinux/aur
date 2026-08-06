# Maintainer: Aaron Lindsay <aaron@aclindsay.com>

pkgname=davie-git
_pkgname=davie
pkgver=r92.d27d364
pkgrel=1
pkgdesc='Terminal contact manager backed by CardDAV, with a mutt query mode'
arch=('x86_64' 'aarch64')
url='https://github.com/aclindsa/davie'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('neomutt: address book queries via "davie query"'
            'mutt: address book queries via "davie query"')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	# Prefer the most recent tag once upstream starts tagging releases; fall
	# back to a commit count while the history is untagged.
	( set -o pipefail
	  git describe --long --abbrev=7 --tags 2>/dev/null |
	    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p build
	# Keep the module cache inside $srcdir instead of growing the user's ~/go.
	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
	cd "${srcdir}/${_pkgname}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOPATH="${srcdir}"
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
	# davie is pure Go (modernc.org/sqlite, no cgo), so CGO_LDFLAGS alone does
	# not reach the linker -- pass makepkg's LDFLAGS through -extldflags
	# explicitly to get full RELRO. -linkmode=external also gets us a build-id.
	go build -o build \
		-ldflags "-linkmode=external -extldflags \"${LDFLAGS}\"" \
		./cmd/...
}

check() {
	cd "${srcdir}/${_pkgname}"
	export GOPATH="${srcdir}"
	export GOFLAGS='-mod=readonly -modcacherw'
	# The suite is offline by design; the tests that need a live server are
	# behind the "integration" build tag and are deliberately not run here.
	go test ./...
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 build/davie "${pkgdir}/usr/bin/davie"
	install -Dm644 man/davie.1 "${pkgdir}/usr/share/man/man1/davie.1"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 docs/tutorial.md docs/how-to.md docs/reference.md \
		-t "${pkgdir}/usr/share/doc/${pkgname}"
}
