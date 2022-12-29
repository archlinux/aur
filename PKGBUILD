# Maintainer: Brent Mackey <bjdm.92 at gmail dot com>
pkgname='qml-lsp-git'
_binname='qml-lsp'
_reponame='qml-lsp'
pkgrel=3
pkgver=rjienrlwey.number.two.r33.g19c7dec
pkgdesc='QML Language Server'
arch=('x86_64')
url="https://invent.kde.org/sdk/$_reponame"
license=('GPLv3')
makedepends=('go' 'git')
provides=('qml-lsp')
conflicts=('qml-lsp' 'qml-lsp-static')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$_reponame"
	( set -o pipefail
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
  cd "$_reponame"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build --ldflags '-linkmode external -extldflags "-static"' -o qml-lsp ./cmd/qml-lsp
  go build --ldflags '-linkmode external -extldflags "-static"' -o qml-lint ./cmd/qml-lint
  go build --ldflags '-linkmode external -extldflags "-static"' -o qml-refactor-fairy ./cmd/qml-refactor-fairy
  # TODO - upstream build fixes and segfault
  # go build --ldflags '-linkmode external -extldflags "-static"' -o build/qml-dap ./cmd/qml-dap
  # go build --ldflags '-linkmode external -extldflags "-static"' -o build/qml-dbg ./cmd/qml-dbg
}

package() {
  cd "$_reponame"
  install -Dm755 qml-lsp "$pkgdir"/usr/bin/qml-lsp
  install -Dm755 qml-lint "$pkgdir"/usr/bin/qml-lint
  install -Dm755 qml-refactor-fairy "$pkgdir"/usr/bin/qml-refactor-fairy
}
