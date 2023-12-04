# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=quarto-cli-pre-release
pkgver=1.4.517
pkgrel=1
_pkgbasename=quarto-cli
_denodomver="0.1.35-alpha-artifacts"
_deno_arch="deno-x86_64-unknown-linux-gnu"
pkgdesc="Quarto is an open-source scientific and technical publishing system built on [Pandoc](https://pandoc.org). This package tracks pre-release tags of Quarto."
arch=('x86_64' 'i686')
depends=('nodejs' 'deno' 'dart-sass' 'esbuild' 'pandoc' 'lua-lpeg' 'typst')
makedepends=('git' 'npm' 'rust')
url="https://quarto.org/"
license=('MIT')
provides=("quarto")
conflicts=('quarto-cli-bin' 'quarto-cli' 'quarto-cli-git')
options=(!strip)

source=("${_pkgbasename}-${pkgver}.tar.gz::https://github.com/quarto-dev/quarto-cli/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/b-fuze/deno-dom/archive/refs/tags/v${_denodomver}.tar.gz"
       )

sha256sums=('24053b8f39dbe0b65562b84e7450eb3baeb33c92f041be30c0bd740f8075020a'
            '14fb042a6912041b9fda91fd643cf278764d075bc9539aa1e107475915cd896c')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  source configuration
  source "${srcdir}/${_pkgbasename}-${pkgver}/package/src/set_package_paths.sh"
  export QUARTO_VERSION=${pkgver}
  export QUARTO_VENDOR_BINARIES='false'
  export DENO_DOM_PLUGIN="${srcdir}/deno-dom-${_denodomver}/target/release/libplugin.so"
  if [ -z "$QUARTO_DENO" ]; then
    export QUARTO_DENO=$SCRIPT_PATH/../dist/bin/tools/deno
  fi
  # keep deno cache directory out of default $home/.cache/deno
  export DENO_DIR="${srcdir}/${_pkgbasename}-${pkgver}/package/cache"
  # Rust optimizations
  export CARGO_HOME="${srcdir}/${_pkgbasename}-${pkgver}/.cargo"
  export RUSTFLAGS="-C strip=symbols"

  mkdir -p package/dist/bin/tools/${arch}/dart-sass
  mkdir -p package/dist/bin/tools/${arch}/deno_dom
  cp /usr/bin/deno package/dist/bin/tools
  ln -sfT /usr/bin/pandoc package/dist/bin/tools/${arch}/pandoc
  ln -sfT /usr/bin/sass package/dist/bin/tools/${arch}/dart-sass/sass
  ln -sfT /usr/bin/esbuild package/dist/bin/tools/${arch}/esbuild

  msg "Building Deno Stdlib..."
  cd "${srcdir}/deno-dom-${_denodomver}"
  cargo build --release

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  # unsure if it's needed at all
  # package/dist/bin/tools/deno run --allow-all package/src/common/create-deno-config.ts > deno.jsonc
  cd package/src
  #../dist/bin/tools/deno run --unstable --allow-env --allow-read --allow-write --allow-run --allow-net --allow-ffi --importmap=../../src/dev_import_map.json bld.ts configure --log-level info
  ../dist/bin/tools/deno run --unstable --allow-env --allow-read --allow-write --allow-run --allow-net --allow-ffi --importmap=../../src/import_map.json bld.ts prepare-dist --log-level info

}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  mkdir -p package/pkg-working/bin/tools/${arch}/dart-sass
  mkdir -p package/pkg-working/bin/tools/${arch}/deno_dom
  cp "${srcdir}/deno-dom-${_denodomver}/target/release/libplugin.so" "${srcdir}/${_pkgbasename}-${pkgver}/package/pkg-working/bin/tools/${arch}/deno_dom"
  # keep legacy pandoc location, see https://github.com/quarto-dev/quarto/issues/237
  ln -sfT /usr/bin/pandoc package/pkg-working/bin/tools/pandoc
  ln -sfT /usr/bin/pandoc package/pkg-working/bin/tools/${arch}/pandoc
  ln -sfT /usr/bin/deno package/pkg-working/bin/tools/${arch}/deno
  ln -sfT /usr/bin/sass package/pkg-working/bin/tools/${arch}/dart-sass/sass
  ln -sfT /usr/bin/esbuild package/pkg-working/bin/tools/${arch}/esbuild
  ln -sfT /usr/bin/typst package/pkg-working/bin/tools/${arch}/typst
  ## 2. Remove symlinks created by build script in ~/bin and ~/.local/bin directories
  rm -f "$HOME/.local/bin/quarto"
  rm -f "$HOME/bin/quarto"

  install -d ${pkgdir}/usr/{bin,lib/${_pkgbasename}/{bin,share}}
  cp -R package/pkg-working/* "${pkgdir}/usr/lib/${_pkgbasename}"
  ln -sf "/usr/lib/${_pkgbasename}/bin/quarto" "$pkgdir/usr/bin/quarto"
}
