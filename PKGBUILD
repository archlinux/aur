# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Vladislav Minakov <v@minakov.pro>
# Contributor: Markus Richter <mqus at disroot dot org>

pkgname=oidcwarden-web
_pkgname=vaultwarden-web
pkgver=2026.6.0
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
sha512sums=('47b44dfcdf6b80f64c4ed403fab74a23090f2409a782db19057b073cde5f4493eb773e8ecf9d996e23163e09bf096eca2e0b43347aba85fcfef5bb17b18c3168')
b2sums=('61b7a9f979492ff24e592b72bd9f8619b66e24a08ceb53bed8730854fc0a196fcc07676b67e0dac5e96336b5662d29e92869bfe1691b844610d0008d69319e82')

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
