# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=gitrob
pkgdesc='Reconnaissance tool for GitLab and GitHub organizations'
arch=(x86_64 i686 armv7h)
url='https://github.com/codeEmitter/gitrob'
_branch='master'
pkgver=3.4.1_beta
pkgrel=1
license=('MIT')
makedepends=(go)
source=("${pkgname}-${pkgver//_/-}.tar.gz::${url}/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('b70e44eabc4e3ded8f44bebbd65e98d23631b3be2e7f2ae08045a01ca3cddabb')
sha512sums=('8f837a6d799ebc18f7574b06a41a65da5b2cb2d678af17b11fc9e3404d1a9ad696902d84bc71056c47b8a68fea38e3b7bec0a53cef5635a1630086e337c55194')
b2sums=('542cc9cd6789009fe0cb8a1d222683c5feda7f777be707fccd66e370983fd0a8afb396866684a46c2961eefe5ed8fa9e7b906f945bc6b2829459cab69b663b19')
provides=($pkgname)
conflicts=($pkgname)

prepare() {
  mkdir -p "${pkgname}-${pkgver//_/-}/build"
}

build() {
  cd "${pkgname}-${pkgver//_/-}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ .
}

check() {
  cd "${pkgname}-${pkgver//_/-}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver//_/-}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
