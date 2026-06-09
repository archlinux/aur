# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=librechat
pkgver=0.8.6
pkgrel=2
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
sha256sums=('14d812ad0f36dd214db2a58df229fb5b8edd9609da4f459ecef59421ea737b03'
            '063927ce15c895c49252b1d0e12dbf7aa15c6a335630576db7cee0c4beaf964f'
            'c1996fb6baa3f6decfdf27cac916ab6a9eb49bd9ff28e5a350dc9396c96ff0e4'
            '6d8d9cbf687b9978ca33be6ae270fe2a6a65938ee945d3dca5435531ba5cadf8'
            '98e0aa0ac2e301a82d1d9cb567f361cb86af09a9b7b7bf65a526098fc4789339'
            '0dc9d536ad4740e19ac8346a7e8372b5e65cd0653755db339edc126d019ea955')

prepare(){
  cd "LibreChat-$pkgver"
  # Fix rollup build: npm workspaces + filesystem symlinks cause preserveModules
  # to produce relative paths in [name] placeholder. Replace preserveModules
  # with explicit multi-input config matching package.json exports.
  cat > packages/data-schemas/rollup.config.js << 'ROLLUP_EOF'
import json from '@rollup/plugin-json';
import typescript from '@rollup/plugin-typescript';
import commonjs from '@rollup/plugin-commonjs';
import nodeResolve from '@rollup/plugin-node-resolve';
import peerDepsExternal from 'rollup-plugin-peer-deps-external';

const plugins = [
  json(),
  peerDepsExternal(),
  nodeResolve(),
  commonjs(),
  typescript({
    tsconfig: './tsconfig.build.json',
    declaration: false,
    declarationDir: undefined,
  }),
];

const external = ['mongoose'];

export default [
  {
    input: 'src/index.ts',
    output: [
      { file: 'dist/index.es.js', format: 'es', sourcemap: true },
      { file: 'dist/index.cjs', format: 'cjs', sourcemap: true, exports: 'named' },
    ],
    plugins,
    external,
  },
  {
    input: 'src/admin/capabilities.ts',
    output: [
      { file: 'dist/admin/capabilities.es.js', format: 'es', sourcemap: true },
      { file: 'dist/admin/capabilities.cjs', format: 'cjs', sourcemap: true, exports: 'named' },
    ],
    plugins,
    external,
  },
];
ROLLUP_EOF
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
