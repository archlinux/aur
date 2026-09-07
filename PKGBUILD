# Maintainer: Jason Huang <jasonhuang20035@gmail.com>
pkgname=podkit
pkgver=0.6.0
pkgrel=1
pkgdesc='Modern sync toolkit and CLI for classic iPods'
arch=('x86_64')
url='https://github.com/jvgomg/podkit'
license=('MIT')
depends=('ffmpeg' 'libgpod' 'glib2' 'glibc' 'gcc-libs' 'icu')
makedepends=('bun' 'nodejs' 'python')
conflicts=('podkit-bin')
options=('!strip')
source=("podkit-${pkgver}.tar.gz::https://github.com/jvgomg/podkit/archive/refs/tags/podkit%40${pkgver}.tar.gz")
sha256sums=('7d7ae34c9cf89454f9b8e13dbe8babf34965ea42fca0b283f3943f069feab1fd')

prepare() {
  cd "podkit-podkit-$pkgver"
  bun install --frozen-lockfile --ignore-scripts
}

build() {
  cd "podkit-podkit-$pkgver/packages/libgpod-node"
  npm_config_nodedir=/usr bun run build:native
  bun build src/index.ts --outdir dist --target node
  cd ../podkit-core
  bun build src/index.ts --outdir dist --target node
  cd ../podkit-cli
  bash scripts/compile.sh
}

check() {
  cd "podkit-podkit-$pkgver"
  bun -e 'const binding = require("./packages/libgpod-node/build/Release/gpod_binding.node"); console.log("libgpod:", binding.getVersion()); binding.create();'
  packages/podkit-cli/bin/podkit --version | grep -Fx "$pkgver"
  packages/podkit-cli/bin/podkit --help >/dev/null
}

package() {
  cd "podkit-podkit-$pkgver"
  install -Dm755 packages/podkit-cli/bin/podkit "$pkgdir/usr/bin/podkit"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
