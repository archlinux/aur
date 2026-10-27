# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: Giovanni Harting <539@idlegandalf.com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=cryptpad
pkgver=2026.10.0
pkgrel=3
pkgdesc="Realtime collaborative visual editor with zero knowledge server"
arch=('x86_64' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=(AGPL-3.0-only)
depends=(glibc nodejs)
makedepends=(npm git unzip)
optdepends=("nginx: HTTP server providing TLS"
  "certbot: Let's Encrypt – automatically receive and install X.509 certificates to enable TLS"
  "certbot-nginx: Nginx plugin for Let's Encrypt client"
  "cryptpad-sso: SSO plugin for Cryptpad")
conflicts=("cryptpad-sso<1.0.0")
backup=(etc/webapps/"$pkgname"/config.js
  etc/nginx/sites-available/"$pkgname".conf)
options=(!strip !debug) # The only ELF files are upstream's sodium-native prebuilds
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "$pkgname.service"
  "$pkgname.sysusers"
  "$pkgname.tmpfiles")
sha512sums=('1e20a1aae956984f9329ad87d59cefe435615f8ab00fa50b35e30736051fe12f4b2e944045e258362a19a281b0517e7fddd27814f0a9e233fe1fea7e321afd2e'
  '79bc9c4c95ae339e3aece7e198fd20f7998fa67b757814abd6b04a15066188725190b88411068a185819c531ea361528de19aa210a26673237ec5d21f006e8f4'
  'cf7151157eb09f91ec01aa5bb638e427302d5f51d0cf41cd4aabcedd87bf5acb359f9d1491bb05d228c4fde8f8ee91b6e0bd1cb9ca901ecb285da0ac84519c49'
  '6cf9e737155077e5880170688a61fee0a4cc4e2624d4f4a6d948bf77cdeb46c21c4c6e9c34ecd3ee79f5a175ec36f9440b0f1ef5a5def7b6603d0a23c5e2a6b6')
b2sums=('ef2d9b8d343a4e7d0269f3309c5e1210921abbe959ef34ea0b7e087ee526fe8d63eb3b825d3f04a4d457e658fbf6df2cfb4cc1ad45bb64c01179a8aba4703dc5'
  '38e879d30176188516b31101f7e0ea6a29d22fbc7c702cbbbf58673e8c2301d817f895db6914aa90e6416cbcc7ade4054506eb20ac154964f176a8114a307cd2'
  'd7f3bf88683288759ab6b0fc12c26d74563779b3fcc073c6e91f5e12ab6ce1167d1d5c5645956ba1f534445b67ef9eaa758e56b6fb3fa8206c61725f4507392e'
  '6126d51f7d84f07102082d5c65c483665e2fe52968b5d62d9c1bcacbc447f8b5eb02356f5b9c536f92b0b69f850d4320a94d511e1a2a6bcc87a0668fcea32db5')

build() {
  cd "$pkgname-$pkgver" || exit
  export NODE_ENV=production
  npm ci --cache "$srcdir"/npm-cache
  npm run install:components --cache "$srcdir"/npm-cache
  ./install-office.sh --accept-license

  # sodium-native ships prebuilds for every platform, keep only ours
  # The .bare files are for the Bare runtime, Node only loads the .node file
  local _node_arch
  case "$CARCH" in
    x86_64) _node_arch=x64 ;;
    aarch64) _node_arch=arm64 ;;
  esac
  find node_modules/sodium-native/prebuilds -mindepth 1 -maxdepth 1 \
    ! -name "linux-$_node_arch" -exec rm -rf {} +
  find node_modules/sodium-native/prebuilds -name '*.bare' -delete

  # drawio is only served from www/components, the copy in node_modules is unused.
  # WEB-INF is draw.io's Java servlet backend, which CryptPad doesn't use.
  rm -rf node_modules/drawio www/components/drawio/src/main/webapp/WEB-INF
}

package() {
  cd "$pkgname-$pkgver" || exit

  # Documentation
  install -t "$pkgdir/usr/share/doc/$pkgname" -Dm 644 docs/{ARCHITECTURE.md,example.nginx.conf} CHANGELOG.md

  # Cryptpad
  install -Dt "$pkgdir/usr/share/webapps/$pkgname" package.json server.js
  cp -rt "$pkgdir/usr/share/webapps/$pkgname" customize.dist lib node_modules scripts src www

  # Config
  sed -e "s|\(Path: '\)\./|\1/var/lib/cryptpad/|" \
    -e "s|'/var/lib/cryptpad/data/logs'|false|" \
    -e "s|logToStdout: false|logToStdout: true|" \
    -i config/config.example.js
  install -Dm 644 config/config.example.js "${pkgdir}/etc/webapps/$pkgname/config.js"

  # Nginx config
  sed -Ee "s|^( *root  *)/.*|\1/usr/share/webapps/$pkgname/www;|" \
    -e "s|/home/cryptpad/.acme.sh/|/etc/letsencrypt/live/|" \
    -i docs/example.nginx.conf
  install -Dm 644 docs/example.nginx.conf "${pkgdir}/etc/nginx/sites-available/$pkgname.conf"

  ln -s /etc/webapps/"$pkgname" "$pkgdir/usr/share/webapps/$pkgname/config"
  # /var/lib/cryptpad and its subdirectories are created by systemd-tmpfiles
  ln -s /var/lib/"$pkgname"/{blob,block,data{,store}} "$pkgdir/usr/share/webapps/$pkgname"

  # systemd
  install -Dm 644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm 644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
