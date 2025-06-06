# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Vladislav Minakov <v@minakov.pro>
# Contributor: Markus Richter <mqus at disroot dot org>

pkgname=oidcwarden-web
_pkgname=vaultwarden-web
pkgver=2025.5.1
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
sha512sums=('8a98f3f5e52268e06afbba78dda09f6b64cdd90b83908f0606b52896d27b8a51424dc07e9876bbd52c5cab4f2897c5348ed8d81d35b0d0c3e48bb7f032fe9cf3')
b2sums=('fdcb16a3405d7068e11a8657f07164e1b924109e39cd1231bb54e96dd6b54181a3f6f3cad069f1cd7e1c8744afa03c84c87f0ba567d8b1a9ae04fe36750c92a7')

prepare() {
  cd oidc_web_vault-${pkgver}-${pkgrel}
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
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
