# Maintainer: Victor <victor@xirion.net>
pkgname=krew
pkgver=0.4.3
pkgrel=1
pkgdesc='Krew is the package manager for kubectl plugins'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://krew.sigs.k8s.io/'
license=('Apache')
provides=('krew')
conflicts=('krew-bin')
depends=('kubectl' 'git')
makedepends=('go')
install=kubectl-krew.install
source=("https://github.com/kubernetes-sigs/krew/archive/v${pkgver}.tar.gz")
sha256sums=('77cc28f744e10ce33860e47c1465fddb9e1b171ac5c366792785df27e29bcd34')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  local _commit=
  _commit=$(bsdcat "v${pkgver}.tar.gz" | git get-tar-commit-id)
  local -a x=(
    sigs.k8s.io/krew/internal/version.gitCommit="${_commit:?}"
    sigs.k8s.io/krew/internal/version.gitTag="v${pkgver}"
  )
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS -fno-lto"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build -o . -ldflags "${x[*]/#/-X=} -linkmode=external" ./cmd/{krew,validate-krew-manifest}

  # check that binary includes commit id and pkgver
  if ! [[ $(grep -Fcm 2 -e "$_commit" -e "v${pkgver}" -- krew) -eq 2 ]]; then
    echo "commit id ($_commit) or version ($pkgver) not found in the binary" >&2
    return 1
  fi
}

check() {
  cd "${pkgname}-${pkgver}"
  # unit- and integration tests
  KREW_BINARY="${PWD}/${pkgname}" go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 krew "${pkgdir}/usr/bin/kubectl-krew"
  install -m755 validate-krew-manifest -t "${pkgdir}/usr/bin"

  # docs
  install -Dm755 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a docs/* -t "${pkgdir}/usr/share/doc/${pkgname}"
}

