# Maintainer: HRKings <hrkings@***.com>
pkgname=gitgudcli-git
_pkgname=gitgud-cli
pkgver=2.2.1.r0.g4e4b573
pkgrel=1
pkgdesc="An easy to use CLI for the GitGud modular Git model."
arch=(any)
url="https://github.com/HRKings/gitgud-cli.git"
license=('unknown')
makedepends=('git' 'go')
provides=(gitgudcli)
source=("git+${url}#branch=stable")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o ${_pkgname} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}" main.go
}

package() {
	# Install the README
	install -Dm644 ${_pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# Install the CLI
  install -Dm755 ${_pkgname}/gitgud-cli "${pkgdir}"/usr/bin/gitgud
}
