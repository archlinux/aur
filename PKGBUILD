# Maintainer: Christopher Kreft <email@christopherkreft.de>

pkgname=snclient-git
pkgver=0.44.r48.g71c00c1
pkgrel=1
pkgdesc='General-purpose monitoring agent supporting REST, NRPE and Prometheus (git)'
arch=('x86_64')
url='https://github.com/ConSol-Monitoring/snclient'
license=('MIT')
depends=('glibc' 'iputils' 'openssl' 'systemd' 'util-linux')
makedepends=('git' 'go' 'help2man')
optdepends=('logrotate: rotate SNClient log files'
            'prometheus-node-exporter: node_exporter support')
provides=("snclient=${pkgver}")
conflicts=('snclient')
backup=('etc/logrotate.d/snclient'
        'etc/snclient/snclient.ini')
install=snclient.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$pkgname"
  export GOPATH="${srcdir}"
  export GOWORK=off
  go mod download -modcacherw
  mkdir -p build
  sed -i 's|/usr/lib/snclient/node_exporter|/usr/bin/prometheus-node-exporter|' \
    packaging/snclient.ini
}

build() {
  cd "$pkgname"
  local _build _revision
  _build=$(git rev-parse --short=7 HEAD)
  printf -v _revision '%04d' \
    "$(git rev-list --count "$(git describe --tags --abbrev=0)"..HEAD)"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOWORK=off
  export GOFLAGS='-buildmode=pie -mod=readonly -modcacherw'

  go build \
    -ldflags "-compressdwarf=false -linkmode external -extldflags \"${LDFLAGS}\" \
      -X github.com/consol-monitoring/snclient/pkg/snclient.Build=${_build} \
      -X github.com/consol-monitoring/snclient/pkg/snclient.Revision=${_revision}" \
    -o build/snclient \
    ./cmd/snclient

  build/snclient completion bash > build/snclient.bash
  build/snclient completion fish > build/snclient.fish
  build/snclient completion zsh > build/snclient.zsh

  help2man --no-info --section=1 --version-string="snclient ${pkgver}" \
    --help-option=-h --include=packaging/help2man.include \
    -n 'Agent that runs and provides system checks and metrics.' \
    build/snclient > build/snclient.1
  help2man --no-info --section=8 --version-string="snclient ${pkgver}" \
    --help-option=-h --include=packaging/help2man.include \
    -n 'Agent that runs and provides system checks and metrics.' \
    build/snclient > build/snclient.8
}

check() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOWORK=off
  export GOFLAGS='-buildmode=pie -mod=readonly -modcacherw'
  go test -short ./pkg/...
}

package() {
  cd "$pkgname"
  install -Dm755 build/snclient "${pkgdir}/usr/bin/snclient"

  install -Dm600 packaging/snclient.ini "${pkgdir}/etc/snclient/snclient.ini"
  install -Dm644 packaging/snclient.logrotate "${pkgdir}/etc/logrotate.d/snclient"

  install -Dm644 packaging/snclient.service \
    "${pkgdir}/usr/lib/systemd/system/snclient.service"
  install -Dm644 packaging/snclient.sysusers \
    "${pkgdir}/usr/lib/sysusers.d/snclient.conf"
  install -Dm644 packaging/snclient.tmpfiles \
    "${pkgdir}/usr/lib/tmpfiles.d/snclient.conf"

  install -Dm644 build/snclient.1 "${pkgdir}/usr/share/man/man1/snclient.1"
  install -Dm644 build/snclient.8 "${pkgdir}/usr/share/man/man8/snclient.8"
  install -Dm644 build/snclient.bash \
    "${pkgdir}/usr/share/bash-completion/completions/snclient"
  install -Dm644 build/snclient.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/snclient.fish"
  install -Dm644 build/snclient.zsh \
    "${pkgdir}/usr/share/zsh/site-functions/_snclient"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/snclient/README"
  install -Dm644 Changes "${pkgdir}/usr/share/doc/snclient/Changes"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
