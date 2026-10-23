# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=librechat
pkgver=0.8.8
pkgrel=3
pkgdesc="Open-source ChatGPT clone fully customizable and compatible with any AI provider"
arch=('x86_64')
url="https://github.com/LibreChat-AI/LibreChat"
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
  "$pkgname-$pkgver.tar.gz::https://github.com/LibreChat-AI/LibreChat/archive/refs/tags/v$pkgver.tar.gz"
  librechat.install librechat.env librechat.service librechat.sysusers librechat-server.sh
)
sha256sums=('3a2811324c95f7d851ebf6a12a5238fd10a96190a473854d8bcbf05ca96e46b8'
            '3783a51758c37fa1585a887e2ff8cce26422c831141f0b26dbceb811de3c58c7'
            'a6b3e7a2c859d504a7274f0b6a8c5dce5d3549714874e7cae80016db55a586ec'
            '6d8d9cbf687b9978ca33be6ae270fe2a6a65938ee945d3dca5435531ba5cadf8'
            '98e0aa0ac2e301a82d1d9cb567f361cb86af09a9b7b7bf65a526098fc4789339'
            '0dc9d536ad4740e19ac8346a7e8372b5e65cd0653755db339edc126d019ea955')

build() {
  cd "LibreChat-$pkgver"
  # Scope npm config to this build only via env vars.
  # Do NOT use `npm config set` here: it persists into the invoking
  # user's ~/.npmrc and breaks npm after the build dir is deleted.
  export npm_config_cache="$srcdir/.npm-cache"
  # ponytail: xlsx is pinned to a CDN tarball in package-lock.json, EALLOWREMOTE blocks it
  export npm_config_allow_remote=true
  npm ci

  # tsdown requires unrun module which isn't resolved by npm ci
  npm install --no-save unrun

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

  # Add some docs. Files move between upstream releases, so install
  # them one by one and skip any that are absent in this release
  # (e.g. CHANGELOG.md was removed from the 0.8.8 tree).
  for f in client/nginx.conf rag.yml README.md; do
    if [ -f "$srcdir/LibreChat-$pkgver/$f" ]; then
      install -Dm644 "$srcdir/LibreChat-$pkgver/$f" "$pkgdir/usr/share/doc/$pkgname/$(basename "$f")"
    fi
  done

  # Populate sample env on top of our defaults
  cat .env.example >>"$pkgdir/etc/librechat/librechat.env"

  # Add latest examples from source package
  install -Dm644 "$srcdir/LibreChat-$pkgver/.env.example" "$pkgdir/etc/librechat/librechat.example.env"
  install -Dm644 "$srcdir/LibreChat-$pkgver/librechat.example.yaml" -t "$pkgdir/etc/librechat"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
