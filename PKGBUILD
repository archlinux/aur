# Maintainer: Pieter Joost van de Sande <pj@born2code.net>
pkgname=gitsu
pkgver=1.0.0
pkgrel=1
pkgdesc='A simple cli tool for switching git user easily.'
url='https://github.com/matsuyoshi30/gitsu'
arch=('any')
license=('MIT')
makedepends=('git')
depends=('go' 'git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a00ea6fd4088f737d8dbf70e91185dcb330105444206681306815fcd05461866')

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
