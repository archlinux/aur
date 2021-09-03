# Maintainer: Tim Meusel <tim@bastelfreak.de>

pkgname=choria-io
pkgver=0.23.0
pkgrel=1
pkgdesc='Go based server to host Choria agents, networks, federations and discovery'
arch=('x86_64')
url='https://choria.io'
license=('Apache')
depends=('glibc' 'logrotate' 'puppet>=6.0.0' 'facter')
makedepends=('go')
checkdepends=('ruby')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/choria-io/go-choria/archive/v${pkgver}.tar.gz"
        'choria-broker.service'
        'choria-server.service'
        'choria-server'
        'server.conf'
        'broker.conf'
        'choria')
backup=('etc/default/choria-server' 'etc/choria/server.conf' 'etc/choria/broker.conf')
sha512sums=('4dd636d80ab3926fe63f6158fdf2fce5830638b34bf517596469912b76fab323004024a1be41ae2378c762fd41dfc26b8970f8b3ecf6432f4aee4a6829f0bd34'
            '78337d1cd28aa5f6206f85b0a5998c96a974e148149498183057f7e2d9b5adbe9ebe37ceb3add117d4229ca84312fd870ea541512dd29e57dade81f10efe3583'
            '7d889360b06fdd5e297cb781e898c8f3e87b17b3c7a33f952edd40a35f215032abfdee52e458b8f47678c06ff674e339d99c79fa435d3dd4841c96f28226a9ec'
            'fa1dbba2353051d9f9c6cd5f6ac8ef9daa179b87a6f12fd476e34a51d17568dfce5f35e92868b7eb277e6f6f114484816062e70cf1219a2ddedd3362d46aa6e2'
            'fee8f5ce202400d3fe29b7d83df50c59c7a378d41c752356ba27e9a442c39e332f98e4d0316cf67f3994c1b099b88fc76b9c1f41a1415bc072861fe3b740c8af'
            '29574a94301961abda5140aeec1e97042285b5af027822e55f39be332111a68d2d1054c965d394d9f30a25bc94439f481c9f4e83b977b1c278a5aa7ae5d50416'
            'c28b500df5728d6880a49d4e02b400f7408fe49ff1ae8372e49ad7e741254feddc3e28815a5922a49522f77978d2d4f85e283721580e4495b5367996d6e7bce9')
export CGO_LDFLAGS="${LDFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
# we cannot add `-mod=readonly` to GOFLAGS because that would break `go generate`
export GOFLAGS="-buildmode=pie -trimpath"
export GOOS='linux'
export GOARCH='amd64'
export XC_OSARCH='linux/amd64'

prepare() {
  cd "${srcdir}/go-choria-${pkgver}"
  mkdir binary
}
build() {
  cd "${srcdir}/go-choria-${pkgver}"

  #go generate -v
  go generate -v -run plugin

  go build -o "binary/${pkgname}-${pkgver}" -ldflags "-X 'github.com/choria-io/go-choria/build.Version=${pkgver}' -X 'github.com/choria-io/go-choria/build.SHA=02bdef23185b843931d9c92e054de8dc534d157a' -X 'github.com/choria-io/go-choria/build.BuildDate=$(date -u '+%F %T %z' -d @$SOURCE_DATE_EPOCH)' -X 'github.com/choria-io/go-choria/build.ProvisionJWTFile=/etc/choria/provisioning.jwt' -s -w -buildid="
}

check() {
  cd "${srcdir}/go-choria-${pkgver}"

  # TLS certificate name referenced in the tests
  # https://github.com/choria-io/go-choria/blob/aa7901a99dd91cd247fdf07fe2d09e6961b5fed5/Rakefile#L3
  export MCOLLECTIVE_CERTNAME='rip.mcollective'

  # advise GO to not require SAN certificates. choria has built-in certs as test fixtures. They don't contain a SAN yet
  # because upstream choria builts on go 1.14 and also supports legacy puppet envs without SAN certs
  # https://golang.org/doc/go1.15#commonname
  export GODEBUG='x509ignoreCN=0'
  go test -v -p $(nproc) -parallel $(nproc) './...'
}

package() {
  cd "${srcdir}/go-choria-${pkgver}"
  install -Dm755 "binary/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/choria"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md CHANGELOG.md CONFIGURATION.md NOTICE Dockerfile -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/choria-server.service" "${srcdir}/choria-broker.service" -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 "${srcdir}/choria-server" -t "${pkgdir}/etc/default/"
  install -Dm644 "${srcdir}/choria" -t "${pkgdir}/etc/logrotate.d/"
  install -Dm640 "${srcdir}/broker.conf" "${srcdir}/server.conf" -t "${pkgdir}/etc/choria/"
}

# vim:set ts=2 sw=2 et:
