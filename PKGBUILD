# Maintainer: Yoan Blanc <yoan@dosimple.ch>
# Contributor: JR Boyens <jboyens@fooninja.org>
# Contributor: Dmitri Goutnik <dg@syrec.org>

pkgname=pgcenter
pkgver=0.9.2
pkgrel=1
pkgdesc='Command-line admin tool for observing and troubleshooting Postgres'
arch=('x86_64')
url='https://github.com/lesovsky/pgcenter'
license=('custom:BSD3')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4fb90da5f76cb88e2ea19b84bfaccdf65e808f40e244011b37297256e40c94c7')

prepare() {
  cd ${pkgname}-${pkgver}
  go mod download
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  _commit=$(zcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _flags=(
    -installsuffix cgo
    -X=main.gitTag=v${pkgver}
    -X=main.gitCommit=${_commit::7}
    -X=main.gitBranch=master
  )

  cd ${pkgname}-${pkgver}
  go build \
    -o ${pkgname} \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "${_flags[*]} -extldflags=\"${LDFLAGS}\"" \
    ./cmd
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}

# vim:set ts=2 sw=2 et:
