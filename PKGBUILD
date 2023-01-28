# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=quarto-cli
pkgver=1.2.329
pkgrel=1
_pkgbasename=quarto-cli
_denodomver="0.1.23-alpha-artifacts"
_deno_arch="deno-x86_64-unknown-linux-gnu"
pkgdesc="Quarto is an open-source scientific and technical publishing system built on [Pandoc](https://pandoc.org)."
arch=('x86_64' 'i686')
depends=('nodejs' 'deno<1.26.0' 'dart-sass' 'esbuild' 'pandoc' 'lua-lpeg')
makedepends=('git' 'npm' 'rust')
url="https://quarto.org/"
license=('MIT')
provides=("quarto")
conflicts=('quarto-cli-bin' 'quarto-cli')
options=(!strip)

source=("${_pkgbasename}-${pkgver}.tar.gz::https://github.com/quarto-dev/quarto-cli/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/b-fuze/deno-dom/archive/refs/tags/v${_denodomver}.tar.gz"
       )

sha256sums=('60663a9d65e82fe8feb4c8318d6eec6ee8f144db94aa820e8626547275949618'
            '9eeb81df4e674bb5dea1a371b0e1731b42edd81f212c395e0a25071ac16c27cd')

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
