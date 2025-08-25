# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Vladislav Minakov <v@minakov.pro>
# Contributor: Markus Richter <mqus at disroot dot org>

pkgname=oidcwarden-web
_pkgname=vaultwarden-web
pkgver=2025.8.0
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
sha512sums=('5590adb931bee492200fa9aebcf4be467241a7ab42c7a8815e876414fc3093f32ed32f7e8574ec03bd71e30ed6fb7b48e62950246ed94f6f76b4089153a116c4')
b2sums=('f7d9677e6c86a9eba15b693ec851d697a59025260e80153c6d2f6d3ce18a8bb8e8f09751d60b7a3b93752779b0ca90951e470408ddea60caf22cd2e0f0568702')

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
