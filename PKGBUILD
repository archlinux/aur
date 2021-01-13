# Maintainer : Jakob (XDjackieXD) <aur at chaosfield dot at>

pkgname='vault-acme'
pkgdesc='A Vault secret engine to retrieve TLS certificates validated by an ACME provider'
pkgver='0.0.6'
pkgrel='1'
url="https://github.com/remilapeyre/vault-acme"
license=('MPL')
arch=('x86_64')
makedepends=('go' 'git' 'glibc')
install='vault-acme.install'
source=("git+https://github.com/remilapeyre/vault-acme#tag=v${pkgver}")
sha512sums=('SKIP')

prepare () {
  export GOPATH="${srcdir}"
  mkdir -p "src/github.com/remilapeyre/" "$GOPATH/bin"
  rm -rf "src/github.com/remilapeyre/${pkgname}"
  mv "${pkgname}" "src/github.com/remilapeyre/${pkgname}"
  export PACKAGE_ROOT="${GOPATH}/src/github.com/remilapeyre/${pkgname}"
  cd $PACKAGE_ROOT
}

build () {
  cd $PACKAGE_ROOT
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw" # -ldflags=-linkmode=external is currently broken with go for some reason. see https://github.com/golang/go/issues/31544
  mkdir -p "build"
  XC_OSARCH='linux/amd64' CGO_ENABLED=0 go build -o build ./...
}

package () {
  cd ${PACKAGE_ROOT}
  install -Dm755 build/acme "${pkgdir}/usr/lib/vault/acme"
  install -Dm755 build/sidecar "${pkgdir}/usr/bin/vault-acme-sidecar"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
