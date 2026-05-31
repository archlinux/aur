# Maintainer: Fuero <fuerob@gmail.com>

pkgname=pv-migrate
# renovate: datasource=github-releases depName=utkuozdemir/pv-migrate
pkgver=3.5.0
pkgrel=6
pkgdesc='kubectl plugin to easily migrate the contents of one Kubernetes PersistentVolumeClaim to another'
arch=('x86_64')
url=https://github.com/utkuozdemir/pv-migrate
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
optdepends=(
  'kubectl: can be used as a plugin for kubectl',
  'bash-completion: auto-completion for flux in Bash',
  'zsh-completions: auto-completion for flux in ZSH'
)
provides=("kubectl-${pkgname}")
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('227bc5a4e4dd52c0efeb0d790b11454da9a297f84df80bbcb94a83445ed6dc20e1443be3a147d5f889c9faea9fd49dc60af92e563cef7f52e4a8b9c9b9fddb9b')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="${pkgver}"
    commit="${_commit:?}"
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
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  "bin/${pkgname}" completion bash \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  "bin/${pkgname}" completion zsh  \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  install -Dm755 -t "${pkgdir}/usr/bin" "bin/${pkgname}"
  ln -snf "${pkgname}" "${pkgdir}/usr/bin/kubectl-${pkgname}"

  for i in *.md
  do
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${i}"
  done
}

# vim:set ts=2 sw=2 et:
