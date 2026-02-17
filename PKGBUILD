# Maintainer: fish4terrisa-MSDSM <fish4terrisa@fishinix.org>
pkgname=urnetwork-provider-git
pkgver=v2026.2.14.863258010.r0.g7fb78eb
pkgrel=1
pkgdesc="A web-standards VPN marketplace with an emphasis on fast, secure internet everwhere."
arch=("x86_64")
url="https://ur.io"
license=("MPL 2.0")
makedepends=("git" "go")
depends=("glibc")
provides=(urnetwork-provider)
conflicts=(urnetwork-provider)
source=("git+https://github.com/urnetwork/connect.git"
        "git+https://github.com/urnetwork/glog.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/connect"
  printf v"%s" "$(git describe --long --tags $(git rev-list --tags --max-count=1) | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/connect/provider"

    # https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    export GO_LDFLAGS="-linkmode=external" 

    go get github.com/urnetwork/connect/provider
    go build -ldflags "$GO_LDFLAGS" 
}

package() {
  cd "${srcdir}/connect/provider"
  install -Dm755 provider "$pkgdir/usr/bin/urnetwork-provider"

  cd "${srcdir}/connect"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
