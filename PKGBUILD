# Maintainer: sarp <sarp@vanlakemonstercorp.com>
pkgname=authfy
pkgver=0.2.0
pkgrel=1
pkgdesc='PAM exec two-factor authenticator backed by ntfy push notifications'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/ssarpv/authfy'
license=('GPL-3.0-or-later')
depends=('glibc' 'pam')
makedepends=('go>=1.27')
optdepends=('fail2ban: ban IPs after repeated rejected 2FA attempts')
backup=('etc/authfy/authfy_config.json')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('26afeb7eaa57f49756c492f7a84bef4497f29f93bb366d4b8bf01450f8cb905d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags="-linkmode=external -X main.version=v${pkgver}" \
    -o authfy ./cmd/authfy
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 authfy "${pkgdir}/usr/bin/authfy"
  install -Dm600 config.example.json "${pkgdir}/etc/authfy/authfy_config.json"
  install -Dm644 packaging/fail2ban/filter.d/authfy.conf \
    "${pkgdir}/etc/fail2ban/filter.d/authfy.conf"
  install -Dm644 packaging/logrotate/authfy \
    "${pkgdir}/etc/logrotate.d/authfy"
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
