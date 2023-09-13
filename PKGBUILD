# Maintainer: Daniele Basso <d dot bass 05 at proton dot me>
pkgname=bun
pkgver=1.0.1
pkgrel=3
pkgdesc="Bun is a fast JavaScript all-in-one toolkit. This PKGBUILD builds from source, resulting into a minor binary depending on your CPU."
arch=(x86_64)
url="https://github.com/oven-sh/bun"
license=('GPL')
makedepends=(
	base-devel cmake esbuild git go libiconv libtool ninja pkg-config python rust unzip zig bun clang15 llvm15 ruby
)
conflicts=(bun-bin)
source=(git+$url.git#tag=bun-v$pkgver)
		#https://patch-diff.githubusercontent.com/raw/oven-sh/bun/pull/4998.diff
		#https://patch-diff.githubusercontent.com/raw/oven-sh/bun/pull/4315.diff)
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git checkout .
  #git apply ../4315.diff
  #git apply ../4998.diff

  bun install -g @oven/zig
  export PATH="/usr/lib/llvm15/bin:$PATH" LDFLAGS="$LDFLAGS -L/usr/lib/llvm15/lib" CPPFLAGS="$CPPFLAGS -I/usr/lib/llvm15/include"
  make assert-deps
  git -c submodule.src/javascript/jsc/WebKit.update=checkout submodule update --init --recursive --depth=1 --progress
  make node-fallbacks runtime_js fallback_decoder bun_error mimalloc picohttp zlib
  make boringssl libarchive -j1
  make lolhtml sqlite uws tinycc c-ares zstd base64  
  # clang16 comps
  make \
    UWS_INCLUDE="-Wno-implicit-function-declaration -Wno-implicit-int -Wno-incompatible-function-pointer-types" \
    usockets # or another target
  make npm-install
  make identifier-cache clean-bindings jsc-check
}

build() {
  export PATH="/usr/lib/llvm15/bin:$PATH" LDFLAGS="$LDFLAGS -L/usr/lib/llvm15/lib" CPPFLAGS="$CPPFLAGS -I/usr/lib/llvm15/include"
  cd "$pkgname"

  # export JSC_BASE_DIR=$srcdir/bun/src/bun.js/WebKit/WebKitBuild/Release
  # make jsc -j1

  make release -j1
}

package() {
  install -Dm755 $srcdir/$pkgname/packages/bun-linux-x64/bun $pkgdir/usr/bin/bun
  ln -s /usr/bin/bun $pkgdir/usr/bin/bunx

  SHELL=zsh $pkgdir/usr/bin/bun completions > bun.zsh
  SHELL=bash $pkgdir/usr/bin/bun completions > bun.bash
  SHELL=fish $pkgdir/usr/bin/bun completions > bun.fish

  install -Dm644 bun.zsh $pkgdir/usr/share/zsh/site-functions/_bun
  install -Dm644 bun.bash $pkgdir/usr/share/bash-completion/completions/bun
  install -Dm644 bun.fish $pkgdir/usr/share/fish/vendor_completions.d/bun.fish
}
