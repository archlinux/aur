# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=quarto-cli
pkgver=0.9.594
pkgrel=1
_denodomver=0.1.17-alpha
pkgdesc="Quarto is an open-source scientific and technical publishing system built on [Pandoc](https://pandoc.org)."
arch=('x86_64' 'i686')
depends=('nodejs' 'deno>=1.23.0' 'dart-sass' 'esbuild' 'pandoc>=2.17')
makedepends=('git' 'npm' 'rust')
url="https://quarto.org/"
license=('MIT')
provides=("quarto")
conflicts=('quarto-cli-bin')
options=(!strip)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quarto-dev/quarto-cli/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/b-fuze/deno-dom/archive/refs/tags/v${_denodomver}.tar.gz"
       )

sha256sums=('96eb8555c994d3628b80c45912a4c228dde0be5313327d57aff14793f62ddb0b'
            '5d5f7f6f87966e8adc4106fb2e37d189b70a5f0935abfd3e8f48fce4131d3632')

build() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  source configuration
  export QUARTO_VERSION=${pkgver}
  mkdir -p package/dist/bin/tools/{dart-sass,deno_dom}
  cp /usr/bin/deno package/dist/bin/tools
  mv ./src/vendor ./src/vendor-`date +%Y-%m-%d`
  cd src
  ../package/dist/bin/tools/deno vendor quarto.ts ../tests/test-deps.ts --importmap=./import_map.json
  cd ..
  ./package/dist/bin/tools/deno run --unstable --allow-all --importmap=./src/import_map.json package/src/common/create-dev-import-map.ts

  msg "Building Deno Stdlib..."
  cd "${srcdir}/deno-dom-${_denodomver}"
  cargo build --release
  cp target/release/libplugin.so "${srcdir}/${pkgname}-${pkgver}/package/dist/bin/tools/deno_dom/libplugin.so"

}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ln -sfT /usr/bin/pandoc package/dist/bin/tools/pandoc
  ln -sfT /usr/bin/deno package/dist/bin/tools/deno
  ln -sfT /usr/bin/sass package/dist/bin/tools/dart-sass/sass
  ln -sfT /usr/bin/esbuild package/dist/bin/tools/esbuild

  ## 2. Remove symlinks created by build script in ~/bin and ~/.local/bin directories
  rm -f "~/.local/bin/quarto"
  rm -f "~/bin/quarto"

  install -d ${pkgdir}/usr/{bin,lib/${pkgname}/{bin,share}}
  cp -R package/dist/* "${pkgdir}/usr/lib/${pkgname}"
  ln -sf "/usr/lib/${pkgname}/bin/quarto" "$pkgdir/usr/bin/quarto"
}
