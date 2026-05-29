# Maintainer: fuero <fuerob@gmail.com>
pkgname=sshpiper
_sshpiper_commit=c785453d857dbf33dd9431a50ced4c11694c6e92
# renovate: datasource=github-releases depName=tg123/sshpiper
pkgver=1.5.3
pkgrel=1
pkgdesc='reverse proxy for ssh scp'
arch=('x86_64' 'aarch64')
url='https://github.com/tg123/sshpiper'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "sshpiper.crypto-${_sshpiper_commit}.tar.gz::https://github.com/tg123/sshpiper.crypto/archive/${_sshpiper_commit}.tar.gz"
)
sha512sums=('6e2a542a53415ec75d3f387effbb667846d4e77d0da7da4cb2a57bfdc6826da381ce4021f9ebaede88325e494f6d0f1b371a7208a896d614da0442951e687392'
            'b676ec81507f974e736b73b1df77322367b23e46732f6dc60cd3feeca26d0392aaf900ed9fae6f75baa46acd03aa47544a54947930b0350ac45e555fff342438')
b2sums=('883fc0369307c07110886575edce18465fd0e23536ffa10c433c312977343ac5a5293e0effed6ef0b4dd0f4a20e0a9c90e55c17881abe2365cac5f1fb3681ee6'
        '66c830585f8a85b2ac2520b74f97f537aa4c5565b6f197a4f1144c08ec22cee9b619721e34a9b5fa918857145748df2531b512975550386f0c195584f1b01384')

prepare() {
  cd "${pkgname}-${pkgver}"
  tar xf "${srcdir}/sshpiper.crypto-${_sshpiper_commit}.tar.gz"
  rm -rf crypto
  ln -snf "sshpiper.crypto-${_sshpiper_commit}" crypto
}

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
    -tags full \
    -o bin/ \
    ./...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "bin/sshpiperd" "${pkgdir}/usr/bin/sshpiperd"
  rm -f bin/sshpiperd
  for i in bin/*
  do
    install -Dm755 "${i}" "${pkgdir}/usr/libexec/sshpiper/${i/bin\//}"
  done

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  for i in *.md
  do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}"
  done
}
