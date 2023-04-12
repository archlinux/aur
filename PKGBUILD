# Maintainer: qubidt <qubidt at gmail dot com>

pkgname=fienode-git
_pkgname=fienode
pkgver=1.0.r9.g57ab25b
pkgrel=1
pkgdesc="Discover identical CoW copies, analogous to an inode"
arch=("x86_64")
url="https://github.com/pwaller/fienode"
license=("MIT")
depends=('glibc')
makedepends=("git" "go")
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!lto)
source=(
  "${_pkgname}::git+${url}.git"
  "go-fibmap::git+https://github.com/frostschutz/go-fibmap"
)
validpgpkeys=("5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --match'=v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git clean -f
  git submodule init
  git config submodule.vendor/github.com/frostschutz/go-fibmap.url "$srcdir/go-fibmap"
  git -c protocol.file.allow=always submodule update
  go mod init "${url#*://}"
  go mod tidy
  go mod vendor
}

build() {
  cd "${_pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=vendor -modcacherw"
  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode=external -compressdwarf=false -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
