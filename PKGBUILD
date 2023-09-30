# Maintainer: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=quarto-cli-pre-release
pkgver=1.4.394
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
        "https://github.com/c4spar/deno-cliffy/archive/refs/tags/v0.25.7.tar.gz"
        "https://github.com/denoland/deno_std/archive/refs/tags/0.170.0.tar.gz"
        "001_vendor_patch_1.diff"
        "001_vendor_patch_2.diff"
        "002_multi_def_patch_2.diff"
       )

sha256sums=('0a6a93e067687f13244c0c7f075ca2097a15ab9eb92f15c6c1cb9d629318f506'
            '14fb042a6912041b9fda91fd643cf278764d075bc9539aa1e107475915cd896c'
            '519709be1dfcf4743930b7f21a513d8fbf3663380020eac8ba629081395f6cc0'
            '369bc68b848532bedcb786a8fce5e52000624b9262f05ceeeb16bc851b6cf752'
            '937a39f116c4310c4989cf71b9e174b6dc7bfdd84c6632e5dd0b47508cffef86'
            '144101b799267869395ba2fe85ab8549be277b18af9545c106675f620e73a85b'
            '1ee399808579aa05f38b9c27dfd23e9102f38fffb437233d360b0c076118312f')
prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  msg "Patching cookiejar..."
  patch -p1 < ../001_vendor_patch_1.diff
  patch -p1 < ../001_vendor_patch_2.diff
  msg "Patching multi definitions..."
  patch -p1 < ../002_multi_def_patch_2.diff

}

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
