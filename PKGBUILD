# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=librechat
pkgver=0.8.0
pkgrel=1
pkgdesc="Open-source ChatGPT clone fully customizable and compatible with any AI provider"
arch=('x86_64')
url="https://github.com/danny-avila/LibreChat"
license=('MIT')
depends=(gcc-libs glibc nodejs libvips)
optdepends=(
  'mongodb: default DB used by LibreChat'
  'nginx: http service to optionally serve the librechat webapp'
  'meilisearch: improved chat indexing and search'
)
makedepends=('npm' 'node-gyp' 'pkgconf')

install=librechat.install
backup=(etc/librechat/librechat.env etc/librechat/librechat.yaml)
options=(!strip)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/danny-avila/LibreChat/archive/refs/tags/v$pkgver.tar.gz"
  librechat.install librechat.env librechat.service librechat.sysusers librechat-server.sh
)
sha256sums=('d105a6e2482465ab8562d240e1ed72279cea69a6043d29bb455425b417bbfbc3'
            '8e5b58ecbbf5b68f31b83a0e0e4a8ffeb46410f0794eec061f6510c98d611ddc'
            'c1996fb6baa3f6decfdf27cac916ab6a9eb49bd9ff28e5a350dc9396c96ff0e4'
            '6d8d9cbf687b9978ca33be6ae270fe2a6a65938ee945d3dca5435531ba5cadf8'
            '98e0aa0ac2e301a82d1d9cb567f361cb86af09a9b7b7bf65a526098fc4789339'
            '0dc9d536ad4740e19ac8346a7e8372b5e65cd0653755db339edc126d019ea955')

prepare(){
  cd "LibreChat-$pkgver"
# @langchain/community has a number of peerOptional deps that are not
# explicitly set in package.json
  npm install --save @smithy/signature-v4@^2.0.10 @smithy/eventstream-codec @smithy/protocol-http@^3.0.6
}
build() {
  cd "LibreChat-$pkgver"
  # Install dependencies
  npm config set cache "$srcdir/.npm-cache"
  npm ci

  # Build the frontend
  npm run frontend
  npm prune --omit=dev
}

package() {
  cd "LibreChat-$pkgver"
  # push compiled tree to usrlib restricted to user+group
  chmod -R g=u . #copy user->group perms

  # package node service
  install -dm2775 "$pkgdir/usr/lib/${pkgname}"
  cp -a . "$pkgdir/usr/lib/${pkgname}"

  # package client webapp
  install -dm775 "$pkgdir/usr/share/webapps/${pkgname}"
  cp -a client/dist/* "$pkgdir/usr/share/webapps/${pkgname}"

  # clean left over npm .cache directories
  find "${pkgdir}" -path "*/node_modules/.cache" -type d -exec rm -rf {} + 2>/dev/null || true

  # launch wrapper with env
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/librechat-server.sh" "$pkgdir/usr/bin/librechat-server"

  # service and service user creation
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # Config and sample
  install -Dm644 "$srcdir/LibreChat-$pkgver/librechat.example.yaml" "$pkgdir/etc/librechat/librechat.yaml"
  install -Dm644 "$srcdir/librechat.env" "$pkgdir/etc/librechat/librechat.env"

  # Add some docs
  install -Dm644 "$srcdir/LibreChat-$pkgver"/{client/nginx.conf,rag.yml,README.md,CHANGELOG.md} -t "$pkgdir/usr/share/doc/$pkgname/" || true

  # Populate sample env on top of our defaults
  cat .env.example >>"$pkgdir/etc/librechat/librechat.env"

  # Add latest examples from source package
  install -Dm644 "$srcdir/LibreChat-$pkgver/.env.example" "$pkgdir/etc/librechat/librechat.example.env"
  install -Dm644 "$srcdir/LibreChat-$pkgver/librechat.example.yaml" -t "$pkgdir/etc/librechat"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
