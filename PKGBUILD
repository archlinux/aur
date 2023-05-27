# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=quarto-cli-git
pkgver=1.4.96.r1.gf23b0ad34
pkgrel=1

_pkgbasename=quarto-cli
_denodomver="0.1.35-alpha-artifacts"
_deno_arch="deno-x86_64-unknown-linux-gnu"
_denocliffyver="0.25.7"
_denostdver="0.170.0"

pkgdesc="Quarto is an open-source scientific and technical publishing system built on [Pandoc](https://pandoc.org). This package tracks main git branch of Quarto."
arch=('x86_64' 'i686')
depends=('nodejs' 'deno' 'dart-sass' 'esbuild' 'pandoc' 'lua-lpeg')
makedepends=('git' 'npm' 'rust')
url="https://quarto.org/"
license=('MIT')
provides=("quarto")
conflicts=('quarto-cli-bin' 'quarto-cli' 'quarto-cli-pre-release')
options=(!strip)

source=("git+https://github.com/quarto-dev/quarto-cli.git"
        "https://github.com/b-fuze/deno-dom/archive/refs/tags/v${_denodomver}.tar.gz"
        "https://github.com/c4spar/deno-cliffy/archive/refs/tags/v${_denocliffyver}.tar.gz"
        "https://github.com/denoland/deno_std/archive/refs/tags/${_denostdver}.tar.gz"
       )

sha256sums=('SKIP'
            '14fb042a6912041b9fda91fd643cf278764d075bc9539aa1e107475915cd896c'
            '519709be1dfcf4743930b7f21a513d8fbf3663380020eac8ba629081395f6cc0'
            '369bc68b848532bedcb786a8fce5e52000624b9262f05ceeeb16bc851b6cf752')

pkgver() {
  cd ${_pkgbasename}
  git describe --tags | sed 's/^v//' | sed 's/\([^-v]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgbasename}"
  source configuration
  source "${srcdir}/${_pkgbasename}/package/src/set_package_paths.sh"
  export QUARTO_VERSION=${pkgver}
  export QUARTO_VENDOR_BINARIES='false'
  export DENO_DOM_PLUGIN="${srcdir}/deno-dom-${_denodomver}/target/release/libplugin.so"
  if [ -z "$QUARTO_DENO" ]; then
    export QUARTO_DENO=$SCRIPT_PATH/../dist/bin/tools/deno
  fi

  #mkdir -p package/dist/bin/tools/${_deno_arch}/{deno_dom,dart-sass}
  mkdir -p package/dist/bin/tools/${_deno_arch}
  mkdir -p package/dist/bin/tools/dart-sass
  mkdir -p package/dist/bin/tools/deno_dom
  cp /usr/bin/deno package/dist/bin/tools
  ln -sfT /usr/bin/pandoc package/dist/bin/tools/pandoc
  ln -sfT /usr/bin/sass package/dist/bin/tools/dart-sass/sass
  ln -sfT /usr/bin/esbuild package/dist/bin/tools/esbuild

  msg "Building Deno Stdlib..."
  cd "${srcdir}/deno-dom-${_denodomver}"
  cargo build --release

  cd "${srcdir}/${_pkgbasename}/package/src"
  ../dist/bin/tools/deno run --unstable --allow-env --allow-read --allow-write --allow-run --allow-net --allow-ffi --importmap=../../src/import_map.json bld.ts prepare-dist --log-level info

}

package() {
  cd "${srcdir}/${_pkgbasename}"
  mkdir -p package/pkg-working/bin/tools/${_deno_arch}
  mkdir -p package/pkg-working/bin/tools/dart-sass
  mkdir -p package/pkg-working/bin/tools/deno_dom
  cp "${srcdir}/deno-dom-${_denodomver}/target/release/libplugin.so" "${srcdir}/${_pkgbasename}/package/pkg-working/bin/tools/deno_dom"
  ln -sfT /usr/bin/pandoc package/pkg-working/bin/tools/pandoc
  ln -sfT /usr/bin/deno package/pkg-working/bin/tools/${_deno_arch}/deno
  ln -sfT /usr/bin/sass package/pkg-working/bin/tools/dart-sass/sass
  ln -sfT /usr/bin/esbuild package/pkg-working/bin/tools/esbuild
  ## 2. Remove symlinks created by build script in ~/bin and ~/.local/bin directories
  rm -f "$HOME/.local/bin/quarto"
  rm -f "$HOME/bin/quarto"

  install -d ${pkgdir}/usr/{bin,lib/${_pkgbasename}/{bin,share}}
  cp -R package/pkg-working/* "${pkgdir}/usr/lib/${_pkgbasename}"
  ln -sf "/usr/lib/${_pkgbasename}/bin/quarto" "$pkgdir/usr/bin/quarto"
}
