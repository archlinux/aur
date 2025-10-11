# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubectl-plugin_completion
# renovate: datasource=github-releases depName=MartinSimango/kubectl-plugin_completion
pkgver=0.1.2
pkgrel=2
pkgdesc='kubectl plugin for allowing kubectl plugin completions'
arch=('x86_64' 'aarch64')
url='https://github.com/MartinSimango/kubectl-plugin_completion'
license=('MIT')
depends=('kubectl' 'glibc')
optdepends=('bash: for bash completion' 'zsh: for zsh completion')
makedepends=('go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d88ae9c044db64ca0ebe4fe7d20b8cbeed9d136eb83b8db19ed4f23d4ec136dd7084bbbb38103072243c7df306287804b521c1ad35616f28f694fb6f59713fbe')
b2sums=('d190c41aba60ceb9e50c525665b535f0d6dfb51ca96f662b7cb7457d979cc7d56e7e4e16c94a4376869eec204c8cd1e17b5ebbf613c739acf0824c9dc339265b')

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
  #go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
