# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-find
# renovate: datasource=github-releases depName=alikhil/kubectl-find
pkgver=0.15.0
pkgrel=1
pkgdesc='plugin for kubectl that gives you a UNIX find-like experience'
arch=('x86_64' 'aarch64')
url='https://github.com/alikhil/kubectl-find'
license=('Apache-2.0')
depends=('kubectl' 'glibc' 'bash')
makedepends=('go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9d75e5092a92939059887bdaa08fc6c20c8becf71eaa8ea3e26a3e10b3dd587b35287a08f1e2638fbd8187dd234bf7312fccc06da59e739c45941ded7c345b1c')
b2sums=('03470bf8467784c811f6733bb069d7cc639bb78a0caecf4f9586b8cc5cff4f418206cad59e330cdfe518474f614dda8b019c60f76214812fc2f0977a5cc367e2')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
    commit="${_commit:?}"
    date="$(date +%F)"
  )

  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " debug " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgname}-${pkgver}"
  go build -v \
    -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
    -o bin/ \
    ./...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "bin/cmd" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "kubectl_complete-fd" "${pkgdir}/usr/bin/kubectl_complete-find"

  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
