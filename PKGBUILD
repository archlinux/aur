# Maintainer: Pieter Joost van de Sande <pj@born2code.net>
pkgname=gitsu
pkgver=0.1.1
pkgrel=1
pkgdesc='A simple cli tool for switching git user easily.'
url='https://github.com/matsuyoshi30/gitsu'
arch=('any')
license=('MIT')
makedepends=('git')
depends=('go' 'git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6e17b8e73559543e902cc6e2066fa0b5f9543d7073216f28e5d6f6de49b10df3')

provides=("${pkgname}")
conflicts=("${pkgname}")

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${pkgname} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}"
}

package() {
  git_exec_path=$(git --exec-path)
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/$git_exec_path/git-su"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim: ft=sh ts=2 sw=2 et
