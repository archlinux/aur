# Maintainer: agony <27015 at riseup dot net>

pkgname=versitygw
pkgver=1.10.0
pkgrel=1
pkgdesc='S3 object storage server for a filesystem'
arch=('x86_64' 'aarch64')
url='https://github.com/versity/versitygw'
license=('Apache-2.0')
depends=('glibc' 'bash')
makedepends=('go')
backup=('etc/versitygw.d/example.conf'
        'etc/versitygw.d/example-iam.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2412650615032f002f67fdc83e03e33f36298f8cfeeff9755c3f61c0df0b4fb8')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X main.Version=${pkgver}" -o versitygw ./cmd/versitygw
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  # TestIntegration listens on the fixed port 127.0.0.1:7070,
  # IPv6_loopback fails on hosts without ::1 on lo
  go test -skip '^TestIntegration$|^TestNewMultiAddrListener$/^IPv6_loopback$' ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 versitygw -t "${pkgdir}/usr/bin"
  install -Dm644 extra/versitygw@.service -t "${pkgdir}/usr/lib/systemd/system"
  install -dm700 "${pkgdir}/etc/versitygw.d"
  install -m644 extra/example.conf extra/example-iam.conf -t "${pkgdir}/etc/versitygw.d"
  install -Dm644 extra/versitygw.sh "${pkgdir}/usr/share/bash-completion/completions/versitygw"
  install -Dm644 extra/versitygw.zsh "${pkgdir}/usr/share/zsh/site-functions/_versitygw"
  install -Dm644 extra/versitygw.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
