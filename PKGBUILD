# Maintainer: Jaime Martínez Rincón <jaime(at)jamezrin(dot)name>

pkgname=bit-git
pkgver=0.6.5.r1.g2a3262e
pkgrel=1
pkgdesc="Bit is a modern Git CLI"
arch=("x86_64")
url="https://github.com/chriswalz/bit"
license=('Apache 2.0')
depends=(git)
makedepends=(go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_pkgrepo="https://github.com/chriswalz/bit"
source=("${pkgname}::git+${_pkgrepo}.git")
md5sums=('SKIP')
noextract=()
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export GOPATH="$srcdir/gopath"
  go clean -modcache
}

build() {
  cd "$srcdir/$pkgname"
  export GO111MODULE=on
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build .
  go build -o bitcomplete/bitcomplete

  go clean -modcache
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licenses"

  install -Dm755 "${srcdir}/${pkgname}/bit" "${pkgdir}/usr/bin/bit"
  install -Dm755 "${srcdir}/${pkgname}/bitcomplete/bitcomplete" "${pkgdir}/usr/bin/bitcomplete"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
