# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=cryptpad-sso
pkgver=1.0.0
pkgrel=7
pkgdesc="SSO plugin for Cryptpad"
arch=(any)
url="https://github.com/cryptpad/sso"
license=(AGPL-3.0-or-later)
depends=('cryptpad>=2026.9.0')
makedepends=(npm)
# sso.js isn't installed any more: upstream deprecated its example, sso.example.js, as SSO is now
# configured in CryptPad itself. It stays here as in earlier releases, so a changed sso.js isn't
# removed on upgrade: pacman keeps it as sso.js.pacsave.
backup=(etc/webapps/cryptpad/sso.js)
options=(!strip !debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('5e5b5b974c75be65a7bdb15953dcef0b5d42c39fe61dc2227e83dec7f630ba7e43b2f082e2458143eb44f94d1d6941076c3ab5ec3fe23832eb5d22e1acefd220')
b2sums=('8f5cf64150748c52d61f2b6d2b8c4d91c2345b0b378c957db7e9ba4b6eb6994e6981b391c0088802b03e46806b5c7908847a18e849a83215dd506d09c638ebbe')

build() {
  cd "sso-$pkgver" || exit
  # The OIDC and SAML libraries of protocols/, which CryptPad doesn't have. The plugin finds the rest,
  # like express, in CryptPad's node_modules.
  npm ci --omit=dev --cache "$srcdir/npm-cache"
}

package() {
  cd "sso-$pkgver" || exit
  # All of the plugin's modules, 1.0.0 added storage.js
  install -Dm644 -t "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" ./*.js package.json
  cp -rt "$pkgdir/usr/share/webapps/cryptpad/lib/plugins/sso" client protocols node_modules
}
