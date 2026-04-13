# Maintainer: Fuero <fuerob@gmail.com>

pkgname=pv-migrate
# renovate: datasource=github-releases depName=utkuozdemir/pv-migrate
pkgver=3.3.0
pkgrel=5
pkgdesc='kubectl plugin to easily migrate the contents of one Kubernetes PersistentVolumeClaim to another'
arch=('x86_64')
url=https://github.com/utkuozdemir/pv-migrate
license=('Apache-2.0')
depends=('glibc' 'kubectl' 'goreleaser')
makedepends=('go' 'git')
optdepends=(
  'bash-completion: auto-completion for flux in Bash',
  'zsh-completions: auto-completion for flux in ZSH'
)
provides=("kubectl-${pkgname}")
groups=('kubectl-plugins')
source=("${pkgname}.git::git+${url}#tag=v${pkgver}")
b2sums=('bc074226195f979a9f93f5d7d5d3f954bfbd489710985bcc31590c050ff093f47a16d7c2b6412ed11e848884a5cfcda9c2a292900bb9b221dc2b05b082be296d')

build() {
  local _x _commit

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " debug " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgname}.git"

  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -v -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on

  sed -i -e '/CGO_ENABLED/d' .goreleaser.yml
  
  mkdir bin
  goreleaser build \
    --parallelism $(nproc) \
    --single-target \
    --skip=validate \
    --output bin/${pkgname}
# go build -v \
#   -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
#   -o bin/ \
#   ./...
}

check() {
  cd "${pkgname}.git"
  go test ./...
}

package() {
  cd "${pkgname}.git"
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
