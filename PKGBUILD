# Maintainer: fuero <fuerob@gmail.com>
pkgname=kubepug
# renovate: datasource=github-releases depName=kubepug/kubepug
pkgver=1.7.1
pkgrel=2
pkgdesc='kubernetes Pre UpGrade (Checker)'
arch=('x86_64' 'aarch64')
url='https://github.com/kubepug/kubepug'
license=('Apache-2.0')
depends=('kubectl' 'glibc')
makedepends=('go')
groups=('kubectl-plugins')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a04411b6e51a9ffa49c80c23391546478dc912bafffff85dcdaf931167f9cc4844120360871d177120c7f50b04e01a40fbf0694759dc5973ec5ee18d8d285d6d')
b2sums=('75bbfcf15c8cba49f58c33f9ffd43c180d54f9cecd766068c9f1fcd3dc855a02a387a9803f81369c31ed608e4657a035899b85d2422171b89e8fd45ac3300df9')

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
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  "bin/${pkgname}" completion bash \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  "bin/${pkgname}" completion zsh \
    | install -Dpm0644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  "bin/${pkgname}" completion fish \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
