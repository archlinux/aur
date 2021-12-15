# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=gitrob
pkgdesc='Reconnaissance tool for GitLab and GitHub organizations'
arch=(x86_64 i686 armv7h)
url='https://github.com/codeEmitter/gitrob'
_branch='master'
pkgver=3.4.4_beta
pkgrel=1
license=('MIT')
makedepends=(go)
source=("${pkgname}-${pkgver//_/-}.tar.gz::${url}/archive/v${pkgver//_/-}.tar.gz")
b2sums=('9eb98407b385798254e3913da828c8ddb982e7463be5fbce1e80966c8ba8fd1127f4f09077ac6a89e86c1825bf21e90801034abe5c7c9566cab03d1eda6f26a1')
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
