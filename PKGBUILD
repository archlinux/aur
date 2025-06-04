# Maintainer: Harriet O'Brien <harrietobrien at protonmail dot com>
# Contributor: Aleksandr Beliaev <trap000d at gmail dot com>

pkgname=quarto-cli
pkgver=1.7.31
pkgrel=1
_denodomver="0.1.41-alpha-artifacts"
_denover="2.2.9-1"
_deno_arch="deno-x86_64-unknown-linux-gnu"
pkgdesc="Quarto is an open-source scientific and technical publishing system built on [Pandoc](https://pandoc.org)"
arch=('x86_64')
depends=("nodejs"
         "deno" 
         "dart-sass" 
         "esbuild" 
         "pandoc" 
         "lua-lpeg" 
         "typst")
makedepends=("git" 
             "npm" 
             "rust")
url="https://quarto.org/"
license=("MIT")
provides=("quarto")
conflicts=("quarto-cli-bin"
           "quarto-cli-pre-release"
           "quarto-cli-bin-pre-release"
           "quarto-cli-git")
options=(!strip)
https://github.com/quarto-dev/quarto-cli/releases/download/v1.7.31/quarto-1.7.31-linux-amd64.tar.gz
source=("https://github.com/quarto-dev/$pkgname/releases/download/v$pkgver/$provides-$pkgver-linux-amd64.tar.gz"
        "https://archive.archlinux.org/packages/d/deno/deno-$_denover-x86_64.pkg.tar.zst"
        "https://github.com/b-fuze/deno-dom/archive/refs/tags/v$_denodomver.tar.gz"
        "000_pandoc_lua.diff")
sha256sums=("61149ee0c2dc2426aa0431b01e26313b100615c7a164b2150a45e34c4d1ecc57"
            "51386b2b6fade3fe46fc81180185996f8660d01fb87ca6ec28a83f053bf3cfc6"
            "5ab1a73e73b9edf9d2c81e655658d970e6212497a5368d8f0bc8613bbdf8d91d"
            "0f27dff1e1b16e4f2f21c43b838aaae18bf9f82339eb65878b24de128f89450f")

build() {
  cd "$srcdir/$provides-$pkgver/"
  export QUARTO_VERSION=$pkgver
  export QUARTO_VENDOR_BINARIES="false"
  export QUARTO_NO_SYMLINK="true"
  export DENO_DOM_PLUGIN="$srcdir/deno-dom-$_denodomver/target/release/libplugin.so"
  if [ -z "$QUARTO_DENO" ]; then
    export QUARTO_DENO=$SCRIPT_PATH/../dist/bin/tools/deno
  fi
  # Keep deno cache directory out of default $home/.cache/deno
  export DENO_DIR="$srcdir/$provides-$pkgver/package/cache"
  # Rust optimizations
  export CARGO_HOME="$srcdir/$provides-$pkgver/.cargo"
  export RUSTFLAGS="-C strip=symbols"

  mkdir -p package/dist/bin/tools/$arch/dart-sass
  mkdir -p package/dist/bin/tools/$arch/deno_dom
  cp $srcdir/usr/bin/deno package/dist/bin/tools
  ln -sfT /usr/bin/pandoc package/dist/bin/tools/$arch/pandoc
  ln -sfT /usr/bin/sass package/dist/bin/tools/$arch/dart-sass/sass
  ln -sfT /usr/bin/esbuild package/dist/bin/tools/$arch/esbuild

  msg "Building Deno Stdlib..."
  cd "$srcdir/deno-dom-$_denodomver"
  cargo build --release

  cd "$srcdir/$provides-$pkgver/package/dist/bin/tools"
  deno run --unstable --allow-env --allow-read --allow-write --allow-run --allow-net --allow-ffi --importmap=../../../../share/conf/jsx-import-map.json ../../../../share/conf/jsx-runtime.ts prepare-dist --log-level info
}

package() {
  cd "$srcdir/$provides-$pkgver"
  mkdir -p package/pkg-working/bin/tools/$arch/dart-sass
  mkdir -p package/pkg-working/bin/tools/$arch/deno_dom
  cp "$srcdir/deno-dom-$_denodomver/target/release/libplugin.so" "$srcdir/$provides-$pkgver/package/pkg-working/bin/tools/$arch/deno_dom"
  # keep legacy pandoc location, see https://github.com/quarto-dev/quarto/issues/237
  ln -sfT /usr/bin/pandoc package/pkg-working/bin/tools/pandoc
  ln -sfT /usr/bin/pandoc package/pkg-working/bin/tools/$arch/pandoc
  ln -sfT /usr/bin/deno package/pkg-working/bin/tools/$arch/deno
  ln -sfT /usr/bin/sass package/pkg-working/bin/tools/$arch/dart-sass/sass
  ln -sfT /usr/bin/esbuild package/pkg-working/bin/tools/$arch/esbuild
  ln -sfT /usr/bin/typst package/pkg-working/bin/tools/$arch/typst

  install -d $pkgdir/usr/{bin,lib/$pkgname/{bin,share}}
  cp -R package/pkg-working/* "$pkgdir/usr/lib/$pkgname"
  ln -sf "/usr/lib/$pkgname/bin/quarto" "$pkgdir/usr/bin/quarto"
}
