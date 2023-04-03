# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=levant
pkgver=0.3.0
pkgrel=1
pkgdesc='An open source templating and deployment tool for HashiCorp Nomad jobs'
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/hashicorp/levant"
license=('MPL2')
depends=('glibc')
provides=('levant')
makedepends=('go')
changelog=levant.changelog
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('71d8e1556925a1aa0394829513a7b124b8ac80b66c9b0d9e89dad0e8e2d8f9a4')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -Ei 's/release = "dev"/release = ""/' "version/version.go"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o "./bin/levant" .
}

check() {
  cd "${pkgname}-${pkgver}"
  # requires running nomad agent
  # go test "./test"
  version=$("./bin/levant" --version) || return
  echo version="${version#Levant v}" >&2
  [ "${version#Levant v}" = "$pkgver" ]
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "./bin/levant" "$pkgdir"/usr/bin/levant
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
