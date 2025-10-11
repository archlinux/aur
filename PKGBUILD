# Maintainer: fuero <fuerob@gmail.com>
pkgname=ksniff
# renovate: datasource=github-releases depName=eldadru/ksniff
pkgver=1.6.2
pkgrel=3
pkgdesc='kubectl plugin that utilizes tcpdump and Wireshark to start a remote capture on any pod in your Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/eldadru/ksniff'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('git' 'go')
provides=("kubectl-${pkgname}")
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('efc08d0a2a1d3db11488e80d75b1c1878cb0de1355f46a702eeb0cabd215fd9da51d6a953fed8c90fe9c6634c4e8a25c114eecfd21b9fccb6921dd99185aa952')
b2sums=('b60b84a44b0070ac3cbddf348a43b82d26a5fb3d832670a0e677b1d90969749de6369d3063a2a0eadd01716f644cfabc400fa0a24e0b9fb8fd8c94cbd3f8f740')

build() {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    version="v${pkgver}"
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
    -ldflags="${_x[*]/#/-X=${url/https:\/\/}/pkg/version.} -linkmode external" \
    -o bin/ \
    ./...
}

check() {
  cd "${pkgname}-${pkgver}"
  # Tests broken on build server:
  # https://github.com/eldadru/ksniff/pull/107
  # === RUN   TestComplete_PodNameSpecified
  #     sniff_test.go:55: 
  #         	Error Trace:	sniff_test.go:55
  #         	Error:      	Expected nil, but got: context doesn't exist
  #         	Test:       	TestComplete_PodNameSpecified
  # --- FAIL: TestComplete_PodNameSpecified (0.00s)
  # FAIL
  # FAIL	ksniff/pkg/cmd	0.022s
  # disables broken tests
  #go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "bin/cmd" "${pkgdir}/usr/bin/${pkgname}"
  ln -snf "${pkgname}" "${pkgdir}/usr/bin/kubectl-${pkgname/k}"

  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
