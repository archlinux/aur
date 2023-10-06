# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: Prem Saraswat <prmsrswt@gmail.com>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname='dex-idp'
pkgdesc='OpenID Connect Identity (OIDC) and OAuth 2.0 Provider with Pluggable Connectors'
pkgver='2.37.0'
_tag=08bb7fb98b164ab078be17ecda4077b2d21c9bb3
pkgrel='1'
url="https://github.com/dexidp/dex"
license=('Apache')
arch=('x86_64')
makedepends=('go')
depends=('glibc')
backup=('etc/dex.yaml')
source=("git+https://github.com/dexidp/dex#tag=${_tag}"
        "dex.service"
	"dex.sysusers")
sha256sums=('SKIP'
            '4e49dc8d12d123fdd78c33cb3b9f903811f93d415c1c650feffc1d52ed176ef8'
            '610ae818f2ff08ac41f6beb227510bff5c55699041e94cbcfec44dfa5553e688')
prepare () {
  export GOPATH="${srcdir}"
  mkdir -p src/github.com/dexidp/
  mv "dex" "src/github.com/dexidp/dex"
  export PACKAGE_ROOT="${GOPATH}/src/github.com/dexidp/dex"
}

build () {
  cd "$PACKAGE_ROOT"
  make build
}

package () {
  cd "$PACKAGE_ROOT"
  install -Dm755 bin/dex "${pkgdir}/usr/bin/dex" &&
  install -Dm644 config.yaml.dist "${pkgdir}/etc/dex.yaml" &&
  install -Dm644 "${srcdir}/dex.sysusers" "${pkgdir}/usr/lib/sysusers.d/dex.conf" &&
  install -Dm644 "${srcdir}/dex.service" "${pkgdir}/usr/lib/systemd/system/dex.service" &&
  install -dm755 "${pkgdir}/usr/share/dex" &&
  cp -r web "${pkgdir}/usr/share/dex"
}
