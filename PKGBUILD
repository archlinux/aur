# Maintainer: fish4terrisa-MSDSM <fish4terrisa@fishinix.org>
pkgname=urnetwork-provider-git
pkgver=v2025.9.12.728916620.r0.g8f63359
pkgrel=1
pkgdesc="A web-standards VPN marketplace with an emphasis on fast, secure internet everwhere."
arch=("x86_64")
url="https://ur.io"
license=("MPL 2.0")
makedepends=("git" "go")
depends=("glibc")
provides=(urnetwork-provider)
conflicts=(urnetwork-provider)
source=("git+https://github.com/urnetwork/connect.git")
sha256sums=('SKIP')

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

    go build -ldflags "$GO_LDFLAGS" 
}

package() {
  cd "${srcdir}/connect/provider"
  install -Dm755 provider "$pkgdir/usr/bin/urnetwork-provider"

  cd "${srcdir}/connect"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
