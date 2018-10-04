# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pgcenter
pkgver=0.5.0
pkgrel=2
pkgdesc='Command-line admin tool for observing and troubleshooting Postgres'
arch=('x86_64')
url='https://github.com/lesovsky/pgcenter'
license=('custom:BSD3')
depends=('glibc')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e25e6c7f5f608b89fd6fb68dc24896ab489abbf23e56ec7428867286c469d056')

prepare() {
  mkdir -p src/github.com/lesovsky
  mv ${pkgname}-${pkgver} src/github.com/lesovsky/pgcenter
  cd src/github.com/lesovsky/pgcenter
  env GOPATH="${srcdir}" GO111MODULE=on go mod download
}

build() {
    cd src/github.com/lesovsky/pgcenter
    env GOPATH="${srcdir}" GO111MODULE=on go build -o ${pkgname}
}

package() {
  cd src/github.com/lesovsky/pgcenter
  install -Dm755 pgcenter "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  env GOPATH="${srcdir}" GO111MODULE=on go clean -modcache
}
