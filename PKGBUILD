# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=quarto-cli
pkgver=0.9.579
pkgrel=1
_denodomver=0.1.17-alpha
pkgdesc="Quarto is an open-source scientific and technical publishing system built on [Pandoc](https://pandoc.org)."
arch=('x86_64' 'i686')
depends=('nodejs' 'deno>=1.20.1' 'dart-sass' 'esbuild' 'pandoc>=2.17')
makedepends=('git' 'npm' 'rust')
url="https://quarto.org/"
license=('MIT')
provides=("quarto")
conflicts=('quarto-cli-bin')
options=(!strip)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quarto-dev/quarto-cli/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/b-fuze/deno-dom/archive/refs/tags/v${_denodomver}.tar.gz"
       )

sha256sums=('eb930d0e3aa0a9b97372c3040140516c8e820c3fb304a369f1b5a40e903f71e5'
            '5d5f7f6f87966e8adc4106fb2e37d189b70a5f0935abfd3e8f48fce4131d3632')

build() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  source configuration
  export QUARTO_VERSION=${pkgver}

  mkdir -p "package/dist/bin/tools"
  cp /usr/bin/deno package/dist/bin/tools

  cd package/src
  ../dist/bin/tools/deno run --unstable --allow-env --allow-read --allow-write --allow-run --allow-net --allow-ffi --importmap=../../src/import_map.json bld.ts configure --log-level info
  ../dist/bin/tools/deno run --unstable --allow-env --allow-read --allow-write --allow-run --allow-net --allow-ffi --importmap=../../src/import_map.json bld.ts prepare-dist --log-level info

  msg "Building Deno Stdlib..."
  cd "${srcdir}/deno-dom-${_denodomver}"
  cargo build --release
  cp target/release/libplugin.so "${srcdir}/${pkgname}-${pkgver}/package/dist/bin/tools/deno_dom"

}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg "Tidying up..."
  ## 1. We have got pandoc already installed in /usr/bin
  rm package/dist/bin/tools/pandoc
  ln -sfT /usr/bin/pandoc package/dist/bin/tools/pandoc
  ## And deno
  ln -sfT /usr/bin/deno package/dist/bin/tools/deno
  ## And dart-sass
  rm -rf package/dist/bin/tools/dart-sass/*
  ln -sfT /usr/bin/sass package/dist/bin/tools/dart-sass/sass
  ## as well as esbuild
  rm package/dist/bin/tools/esbuild
  ln -sfT /usr/bin/esbuild package/dist/bin/tools/esbuild

  ## 2. Remove symlinks created by build script in ~/bin and ~/.local/bin directories
  rm -f "~/.local/bin/quarto"
  rm -f "~/bin/quarto"

  install -d ${pkgdir}/usr/{bin,lib/${pkgname}/{bin,share}}
  cp -R package/dist/* "${pkgdir}/usr/lib/${pkgname}"
  ln -sf "/usr/lib/${pkgname}/bin/quarto" "$pkgdir/usr/bin/quarto"
}
