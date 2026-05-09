# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Vladislav Minakov <v@minakov.pro>
# Contributor: Markus Richter <mqus at disroot dot org>

pkgname=oidcwarden-web
_pkgname=vaultwarden-web
pkgver=2026.4.2
pkgrel=1
pkgdesc='Bitwarden web vault with the patches to make it work with oidcwarden'
arch=(any)
url=https://github.com/Timshel/oidc_web_vault
license=(GPL-3.0-only)
depends=(oidcwarden)
conflicts=(vaultwarden-web)
makedepends=(
  git
  nodejs-lts-iron
  npm
)
install=$pkgname.install
#source=("$pkgname::git+$url#tag=v$pkgver-$pkgrel")
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}-${pkgrel}.tar.gz)
sha512sums=('ece4283f5926d0f08152757fba35bfc66048cd442e8694bf2e09fab0a804b141548ba8a9267ea20b573022a20f46c4e68f2bb25b1c12a06c1903dd1b4e1654a2')
b2sums=('14993346b147731e810b3eabb82f107f3da7e5dad000c8052edf431e55a3e2b5d1c56becf3f5b182f92c221f3637e42a3ebfc424be14f0a21241ee3811ddf781')

prepare() {
  cd oidc_web_vault-${pkgver}-${pkgrel}
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  npm install
  npm ci
#  uncomment to build version with SSO override instead of button
  patch -Np1 -i ./patches/oidc_override.patch
}

build() {
  cd "oidc_web_vault-${pkgver}-${pkgrel}/apps/web"
  # https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
  # Workaround for "JavaScript heap out of memory" on 32-bit systems
  if [[ $(getconf LONG_BIT) -eq 32 ]]; then
    export NODE_OPTIONS="--max-old-space-size=1536"
  fi
  npm run dist:oss:selfhost
  # https://github.com/dani-garcia/bw_web_builds/blob/a84aca58170a60ac04a695851eeb6e70f577de09/scripts/build_web_vault.sh#L30-L33
  printf '{"version":"%s"}' "$pkgver" > build/vw-version.json
}

package() {
  cd oidc_web_vault-${pkgver}-${pkgrel}
  install -d "$pkgdir/usr/share/webapps/$_pkgname"
  cp -R ./apps/web/build/* "$pkgdir/usr/share/webapps/$_pkgname"
}
