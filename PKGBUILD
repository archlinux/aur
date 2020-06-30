# Maintainer: Arisu  <alice at gaudon dot pro>
# Contributor: Sylwek  <skmtrn at gmail dot com>
# Contributor: Poscat <poscat at mail dot poscat dot moe>

pkgname=caddy2
_pkgname=caddy
pkgver=2.1.1
_tag=v2.1.1
_distcommit='a509155e3cff18af793f6af5f930a71c89e05df8'
pkgrel=1
pkgdesc="Powerful, enterprise-ready, open source web server with automatic HTTPS written in Go"
arch=('x86_64')
url="https://github.com/caddyserver/caddy"
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
provides=('caddy')
backup=('etc/caddy/Caddyfile')
source=("git+https://github.com/caddyserver/caddy#tag=${_tag}?signed"
        "caddy-${_distcommit}-index.html::https://raw.githubusercontent.com/caddyserver/dist/${_distcommit}/welcome/index.html"
        'caddy.service'
        'caddy.tmpfiles'
        'Caddyfile')
sha512sums=('SKIP'
            '2abccd41f770daebf61285dc017249f20c707877ea3c870f4a2375bbbd2bf481a8652d1fd3c7afd7d6b5c54838e9d8474a33e2c9790ef67dcf9d79c4e52953b4'
            'cbda05e4472ac07455dd0a384dec2e7d2b1fbae356d6aa0f08e3de6d4fad06b51bee0352565861d57f3af5f83a39b84e14c9456eabf5f1ea940c4c06986c620a'
            '2c45974647859a6fa9096aeb9ec0a32270adc863b90932133886eadd87d94a9f59713e185b86e8c8f01c8e11742cabac2cc3abadeef9ebd2534ac2acb9b20061'
            '7599f0b0af3b0380d90d805a5b4b9ab8d377727f4a1f6d59d1d30cd4c767aa45b9bbde56dafc88936640fb375fed265ed0489a5039e2c9f5aafd53bd692031e5')
validpgpkeys=(
  '29D0817A67156E4F25DC24782A349DD577D586A5' # Matthew Holt <mholt@users.noreply.github.com>
)

pkgver() {
  cd ${_pkgname}
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed 's|/var/www/html|/srv/http|g' -i "${srcdir}/caddy-${_distcommit}-index.html"
}

build() {
  cd "${_pkgname}/cmd/caddy/"
  go build -trimpath -ldflags "-extldflags ${LDFLAGS}" -o $pkgname
}

check() {
  cd "caddy"
  go test ./...
}

package() {
  cd "caddy"
  install -Dm755 "cmd/caddy/${pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 "${srcdir}/caddy.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/caddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"
  install -Dm 644 "${srcdir}/Caddyfile" "${pkgdir}/etc/caddy/Caddyfile"
  install -Dm 644 "${srcdir}/caddy-${_distcommit}-index.html" "${pkgdir}/usr/share/caddy/index.html"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
