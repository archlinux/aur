# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=quarto-cli-pre-release
pkgver=1.4.6
pkgrel=1
_pkgbasename=quarto-cli
_denodomver="0.1.35-alpha-artifacts"
_deno_arch="deno-x86_64-unknown-linux-gnu"
pkgdesc="Quarto is an open-source scientific and technical publishing system built on [Pandoc](https://pandoc.org). This package tracks pre-release tags of Quarto."
arch=('x86_64' 'i686')
depends=('nodejs' 'deno>=1.29' 'dart-sass' 'esbuild' 'pandoc' 'lua-lpeg')
makedepends=('git' 'npm' 'rust')
url="https://quarto.org/"
license=('MIT')
provides=("quarto")
conflicts=('quarto-cli-bin' 'quarto-cli' 'quarto-cli-git')
options=(!strip)

source=("${_pkgbasename}-${pkgver}.tar.gz::https://github.com/quarto-dev/quarto-cli/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/b-fuze/deno-dom/archive/refs/tags/v${_denodomver}.tar.gz"
        "https://github.com/c4spar/deno-cliffy/archive/refs/tags/v0.25.7.tar.gz"
        "https://github.com/denoland/deno_std/archive/refs/tags/0.170.0.tar.gz"
        "deno_2.31.diff"
        "deno_2.32.diff"
       )

sha256sums=('f2690ca486c4688815c668f424daaf3fe07738f5d8017ef863ffe26295fcb5ce'
            '14fb042a6912041b9fda91fd643cf278764d075bc9539aa1e107475915cd896c'
            '519709be1dfcf4743930b7f21a513d8fbf3663380020eac8ba629081395f6cc0'
            '369bc68b848532bedcb786a8fce5e52000624b9262f05ceeeb16bc851b6cf752'
            'def3b77a009d86ca2c563dab0bce1b9cbb28db1695547c4c8b0b10e2621a7ea4'
            '461dad45c3800418ccdc9deafd44e03f826c31f60eab4004f7393c6d5bebcbff')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  # The most dumb way to sort it out...
  find . -type f -exec sed -i 's/std@0.166.0/std@0.170.0/g' {} \;
  find . -type f -exec sed -i 's/cliffy@v0.25.4/cliffy@v0.25.7/g' {} \;
  mkdir src/vendor/deno.land/x/cliffy@v0.25.7
  mkdir src/vendor/deno.land/std@0.170.0
  tar -zxf ../v0.25.7.tar.gz --strip-components=1 --directory src/vendor/deno.land/x/cliffy@v0.25.7
  tar -zxf ../0.170.0.tar.gz --strip-components=1 --directory src/vendor/deno.land/std@0.170.0
  # Deno >= 2.31 and 2.32 support
  patch -p1 < ../deno_2.31.diff
  patch -p1 < ../deno_2.32.diff
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  source configuration
  source "${srcdir}/${_pkgbasename}-${pkgver}/package/src/set_package_paths.sh"
  export QUARTO_VERSION=${pkgver}
  if [ -z "$QUARTO_DENO" ]; then
    export QUARTO_DENO=$SCRIPT_PATH/../dist/bin/tools/deno
  fi

  #mkdir -p package/dist/bin/tools/${_deno_arch}/{deno_dom,dart-sass}
  mkdir -p package/dist/bin/tools/${_deno_arch}
  #mkdir -p package/dist/bin/tools/dart-sass
  cp /usr/bin/deno package/dist/bin/tools
 
  cd package/src
  # update checksums for new version of deno_std
  ../dist/bin/tools/deno cache --unstable --lock ../../src/resources/deno_std/deno_std.lock --lock-write ../scripts/deno_std/deno_std.ts  
  # Business as usual...
  ../dist/bin/tools/deno run --unstable --allow-env --allow-read --allow-write --allow-run --allow-net --allow-ffi --importmap=../../src/dev_import_map.json bld.ts configure --log-level info
  ../dist/bin/tools/deno run --unstable --allow-env --allow-read --allow-write --allow-run --allow-net --allow-ffi --importmap=../../src/import_map.json bld.ts prepare-dist --log-level info

  msg "Building Deno Stdlib..."
  cd "${srcdir}/deno-dom-${_denodomver}"
  cargo build --release

}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  msg "Tidying up..."
  ## 1. We have got pandoc already installed in /usr/bin
  rm package/dist/bin/tools/pandoc
  ln -sfT /usr/bin/pandoc package/dist/bin/tools/pandoc
  ## And deno
  rm package/dist/bin/tools/deno
  ln -sfT /usr/bin/deno package/dist/bin/tools/${_deno_arch}/deno
  ## And dart-sass
  rm -rf package/dist/bin/tools/dart-sass/*
  ln -sfT /usr/bin/sass package/dist/bin/tools/dart-sass/sass
  ## as well as esbuild
  rm package/dist/bin/tools/esbuild
  ln -sfT /usr/bin/esbuild package/dist/bin/tools/esbuild
  ## 2. Remove symlinks created by build script in ~/bin and ~/.local/bin directories
  rm -f "$HOME/.local/bin/quarto"
  rm -f "$HOME/bin/quarto"

  install -d ${pkgdir}/usr/{bin,lib/${_pkgbasename}/{bin,share}}
  cp -R package/dist/* "${pkgdir}/usr/lib/${_pkgbasename}"
  ln -sf "/usr/lib/${_pkgbasename}/bin/quarto" "$pkgdir/usr/bin/quarto"
}
