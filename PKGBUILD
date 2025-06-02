# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=librechat
pkgver=0.7.8
pkgrel=2
pkgdesc="Open-source ChatGPT clone fully customizable and compatible with any AI provider"
arch=('x86_64')
url="https://github.com/danny-avila/LibreChat"
license=('MIT')
depends=('nodejs' 'libvips')
optdepends=('mongodb: default DB used by LibreChat')
makedepends=('npm' 'node-gyp' 'pkgconf')

install=librechat.install
backup=(etc/librechat/librechat.env etc/librechat/librechat.yaml)
options=(!strip)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/danny-avila/LibreChat/archive/refs/tags/v$pkgver.tar.gz"
  librechat.install librechat.env librechat.service librechat.sysusers
)
sha256sums=('f2bc4f0a447e1de6d5e3c34c810bb3206649f95c4d97a7e5a4901616ac96f8e5'
            'dcce2eeececc8c53bec11f686ba42f57ea5e39e7d73b7dccae08e765de0dc3f7'
            'c1996fb6baa3f6decfdf27cac916ab6a9eb49bd9ff28e5a350dc9396c96ff0e4'
            '6d8d9cbf687b9978ca33be6ae270fe2a6a65938ee945d3dca5435531ba5cadf8'
            '98e0aa0ac2e301a82d1d9cb567f361cb86af09a9b7b7bf65a526098fc4789339')

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
  install -dm775 "$pkgdir/usr/lib/${pkgname}"
  cp -a . "$pkgdir/usr/lib/${pkgname}"

  # package client webapp
  install -dm775 "$pkgdir/usr/share/webapps/${pkgname}"
  cp -a client/dist/* "$pkgdir/usr/share/webapps/${pkgname}"

  # clean left over npm .cache directories
  find "${pkgdir}" -path "*/node_modules/.cache" -type d -exec rm -rf {} + 2>/dev/null || true

  # launch wrapper with env
  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/librechat-server" <<'EOF'
#!/bin/bash
set -a
source /etc/librechat/librechat.env 2>/dev/null || true
set +a
exec node /usr/share/webapps/librechat/api/server/index.js "$@"
EOF

  # service and service user creation
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # Config and sample
  install -Dm644 "$srcdir/LibreChat-$pkgver/librechat.example.yaml" "$pkgdir/etc/librechat/librechat.yaml"
  install -Dm644 "$srcdir/librechat.env" "$pkgdir/etc/librechat/librechat.env"

  # Add some docs
  install -Dm644 "$srcdir/LibreChat-$pkgver"/{client/nginx.conf,rag.yml,README.md,CHANGELOG.md} -t "$pkgdir/usr/share/doc/$pkgname/" || true

  # Populate sample env on top of our defaults
  cat .env.example >> "$pkgdir/etc/librechat/librechat.env"

  # Add latest examples from source package
  install -Dm644 "$srcdir/LibreChat-$pkgver/.env.example" "$pkgdir/etc/librechat/librechat.example.env"
  install -Dm644 "$srcdir/LibreChat-$pkgver/librechat.example.yaml" -t "$pkgdir/etc/librechat"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
