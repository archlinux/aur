# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=quarto-cli
pkgver=0.9.88
pkgrel=1
_denodomver=0.1.17-alpha
pkgdesc="Quarto is an open-source scientific and technical publishing system built on [Pandoc](https://pandoc.org)."
arch=('x86_64' 'i686')
depends=('nodejs' 'deno' 'dart-sass' 'esbuild' 'pandoc>=2.17.1')
makedepends=('git' 'npm' 'rust')
url="https://quarto.org/"
license=('MIT')
provides=("quarto")
conflicts=('quarto-cli-bin')
options=(!strip)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quarto-dev/quarto-cli/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/b-fuze/deno-dom/archive/refs/tags/v${_denodomver}.tar.gz"
       )

sha256sums=('db73904298eba988001f27c23a81759a13e76084f20cb8c86f00a518619222c1'
            '5d5f7f6f87966e8adc4106fb2e37d189b70a5f0935abfd3e8f48fce4131d3632'
           )

build() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  source configuration
  export QUARTO_VERSION=${pkgver}

  mkdir -p "package/dist/bin"
  cd "package/dist/bin"
  cp /usr/bin/deno .
  ./deno cache --reload ../../../src/quarto.ts --unstable --importmap=../../../src/import_map.json
  cd ../../src/
  ../dist/bin/deno run --unstable --allow-env --allow-read --allow-write --allow-run --allow-net --allow-ffi --importmap=import_map.json bld.ts configure --log-level info
  ../dist/bin/deno run --unstable --allow-env --allow-read --allow-write --allow-run --allow-net --allow-ffi --importmap=import_map.json bld.ts prepare-dist --log-level info

  msg "Building Deno Stdlib..."
  cd "${srcdir}/deno-dom-${_denodomver}"
  cargo build --release
  cp target/release/libplugin.so "${srcdir}/${pkgname}-${pkgver}/package/dist/bin/deno_dom"

}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg "Tidying up..."
  ## 1. We have got pandoc already installed in /usr/bin
  rm package/dist/bin/pandoc
  ln -sfT /usr/bin/pandoc package/dist/bin/pandoc
  ## And deno
  ln -sfT /usr/bin/deno package/dist/bin/deno
  ## And dart-sass
  rm -rf package/dist/bin/dart-sass/*
  ln -sfT /usr/bin/sass package/dist/bin/dart-sass/sass
  ## as well as esbuild
  rm package/dist/bin/esbuild
  ln -sfT /usr/bin/esbuild package/dist/bin/esbuild

  ## 2. Remove symlink created by build script in $HOME/bin directory (in case if it exists)
  rm $HOME/bin/quarto

  install -d ${pkgdir}/usr/{bin,lib/${pkgname}/{bin,share}}
  cp -R package/dist/* "${pkgdir}/usr/lib/${pkgname}"
  ln -sf "/usr/lib/${pkgname}/bin/quarto" "$pkgdir/usr/bin/quarto"
}
