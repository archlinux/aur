# Maintainer: Mario Finelli <mario at finel dot li>

_github=https://github.com/mfinelli/modctl
pkgname=modctl
pkgver=0.7.1
pkgrel=1
pkgdesc="command line mod manager"
arch=(aarch64 x86_64)
url=https://modctl.org
license=(GPL-3.0-or-later)
depends=(glibc libarchive)
makedepends=(go scdoc)
source=(${_github}/releases/download/v${pkgver}/${pkgname}_v${pkgver}.tar.zst{,.asc})
validpgpkeys=(2AF87031171950F11C460B5AEF5F1F6026B2C9C5)
sha256sums=('204525d247c9358e47bb8026c3bdc9a0d42303d8d2afbfeefdc1fe1c28477c9a'
            'SKIP')

check() {
  cd ${pkgname}_v${pkgver}
  go test -mod=vendor -v ./...
}

build() {
  cd ${pkgname}_v${pkgver}

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  make sample.tar.gz
  make modctl.1

  go build -o modctl \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -tags='no_clickhouse no_libsql no_mssql no_mysql no_postgres \
      no_vertica no_ydb' \
    main.go
}

package() {
  cd ${pkgname}_v${pkgver}

  install -vDm0755 modctl "$pkgdir/usr/bin/modctl"

  install -vDm0644 modctl.1 "$pkgdir/usr/share/man/man1/modctl.1"
  ./modctl completion bash | install -vDm0644 /dev/stdin \
    "${pkgdir}/usr/share/bash-completion/completions/modctl"
  ./modctl completion fish | install -vDm0644 /dev/stdin \
    "${pkgdir}/usr/share/fish/vendor_completions.d/modctl.fish"
  ./modctl completion zsh | install -vDm0644 /dev/stdin \
    "${pkgdir}/usr/share/zsh/site-functions/_modctl"

  install -vDm0644 README.md "$pkgdir/usr/share/doc/modctl/README.md"
  install -vDm0644 CHANGELOG.md "$pkgdir/usr/share/doc/modctl/CHANGELOG.md"
  ./pkg/copydocs.bash "$pkgdir/usr/share/doc/modctl"
}

# vim: set ts=2 sw=2 et:
