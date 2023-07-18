pkgname=flecli-git
_pkgname=flecli
pkgver=0.1.5.r18.g9f0664d
pkgrel=1
pkgdesc='Multi-platform "Fast Log Entry"(FLE) processing tool'
arch=('x86_64')
url='https://github.com/on4kjm/FLEcli'
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
makedepends=('git' 'go' 'goreleaser')
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/FLEcli"
    # Only build Linux
    perl -0777 -i -pe 's/  goos:\s+- linux\s+- windows\s+- darwin/  goos:\n    - linux/' .goreleaser.yml
    # Only build x86_64
    perl -0777 -i -pe "s/  goarch:\s+- '386'\s+- amd64\s+- arm\s+- arm64/  goarch:\n    - amd64/" .goreleaser.yml
    # Do not build Docker images
    perl -0777 -i -pe "s/dockers:\s+(?:.|\s)+?archives:/archives:/" .goreleaser.yml
}

pkgver() {
  cd "$srcdir/FLEcli"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH="$srcdir"/gopath
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  cd "$srcdir/FLEcli"
  goreleaser --snapshot --skip-publish --clean
}

package() {
  cd "$srcdir/FLEcli"
  install -Dm755 dist/FLEcli_linux_amd64_v1/FLEcli "${pkgdir}/usr/bin/${_pkgname}"
}
