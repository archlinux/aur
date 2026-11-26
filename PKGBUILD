# Maintainer: sarp <sarp@vanlakemonstercorp.com>
_pkgname=authfy
pkgname="${_pkgname}-git"
pkgver=0.1.0.r0.g54b5e50
pkgrel=1
pkgdesc='PAM exec two-factor authenticator backed by ntfy push notifications'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/ssarpv/authfy'
license=('GPL-3.0-or-later')
depends=('glibc' 'pam')
makedepends=('git' 'go>=1.27')
optdepends=('fail2ban: ban IPs after repeated rejected 2FA attempts')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/authfy/authfy_config.json')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local _desc
  if _desc="$(git describe --long --tags --abbrev=7 2>/dev/null)"; then
    printf '%s\n' "${_desc}" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local _commit
  _commit="$(git rev-parse --short HEAD)"

  go build \
    -ldflags="-linkmode=external -X main.version=${pkgver} -X main.commit=${_commit}" \
    -o authfy ./cmd/authfy
}

check() {
  cd "${srcdir}/${_pkgname}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgname}"

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
