# Maintainer: Alexander Bocken <alexander@bocken.org>
# Contributor: Prem Saraswat <prmsrswt@gmail.com>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>

pkgname='dex-idp'
pkgdesc='OpenID Connect Identity (OIDC) and OAuth 2.0 Provider with Pluggable Connectors'
pkgver=2.42.1
_tag=4c3e83b90135339575b66d7cf878fb1a6326c243
pkgrel=1
url="https://github.com/dexidp/dex"
license=('Apache')
arch=('x86_64')
makedepends=('go' 'git')
depends=('glibc')
backup=('etc/dex.yaml')
source=("git+https://github.com/dexidp/dex#tag=${_tag}"
        "dex.service"
	"dex.sysusers")
sha256sums=('SKIP'
            'd8383089d904ad2407101f71ae08fbfddc50d888fe61c6203a7a9fd7b45181ac'
            '610ae818f2ff08ac41f6beb227510bff5c55699041e94cbcfec44dfa5553e688')
prepare () {
  export GOPATH="${srcdir}"
  export PACKAGE_ROOT="${srcdir}/src/github.com/dexidp/dex"
  mkdir -p src/github.com/dexidp/
  mv "dex" "src/github.com/dexidp/dex"
}

build () {
  export PACKAGE_ROOT="${srcdir}/src/github.com/dexidp/dex"
  cd "$PACKAGE_ROOT"
  make build
}

package () {
  export PACKAGE_ROOT="${srcdir}/src/github.com/dexidp/dex"
  cd "$PACKAGE_ROOT"
  install -Dm755 bin/dex "${pkgdir}/usr/bin/dex" &&
  install -Dm644 config.yaml.dist "${pkgdir}/etc/dex.yaml" &&
  install -Dm644 "${srcdir}/dex.sysusers" "${pkgdir}/usr/lib/sysusers.d/dex.conf" &&
  install -Dm644 "${srcdir}/dex.service" "${pkgdir}/usr/lib/systemd/system/dex.service" &&
  install -dm755 "${pkgdir}/usr/share/dex" &&
  cp -r web "${pkgdir}/usr/share/dex"
}
