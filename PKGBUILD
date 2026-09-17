# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protoc-gen-js
pkgver=4.0.3
pkgrel=1
pkgdesc="Protocol Buffers for JavaScript"
arch=('x86_64' 'aarch64')
url="https://github.com/protocolbuffers/protobuf-javascript"
license=('Apache-2.0 AND BSD-3-Clause')
depends=('protobuf')
makedepends=(
  'bazel'
  'npm'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43ea40481e7b5efdeccf4a0926226b0bd4f61386cdb819a55ce55f5828e32025')

prepare() {
  cd "protobuf-javascript-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  npm ci
}

build() {
  cd "protobuf-javascript-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  npm run build
  bazel build plugin_files
}

check() {
  cd "protobuf-javascript-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  npm test
}

package() {
  cd "protobuf-javascript-$pkgver"
  install -Dm755 "bazel-bin/generator/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
