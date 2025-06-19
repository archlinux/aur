# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Vladislav Minakov <v@minakov.pro>
# Contributor: Markus Richter <mqus at disroot dot org>

pkgname=oidcwarden-web
_pkgname=vaultwarden-web
pkgver=2025.6.0
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
sha512sums=('af592bb98810cc216476503cbfdf8873d1daa777287dec1effac2352f776af9295139ad1720005717050549139f21954b6bbace9dc6227e0bfae6beed66e4f9a')
b2sums=('f35316b732e8b6f8f767085f1aee2f5f458e5a6271eb0eb986b10f8b27555b732146aef849399e00b665f433a3ec3ef1f368b14450d27751de4ac3bac2280ec7')

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
