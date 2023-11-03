# Maintainer: Daniele Basso <d dot bass 05 at proton dot me>
pkgname=bun
pkgver=1.0.8
_zigver=0.12.0-dev.1297+a9e66ed73
pkgrel=1
pkgdesc="Bun is a fast JavaScript all-in-one toolkit. This PKGBUILD builds from source, resulting into a minor binary depending on your CPU."
arch=(x86_64)
url="https://github.com/oven-sh/bun"
license=('GPL')
makedepends=(
	bun clang cmake esbuild git go icu libiconv libtool lld llvm ninja pkg-config python ruby rust unzip zig
)
conflicts=(bun-bin)
source=(git+$url.git#tag=bun-v$pkgver https://ziglang.org/builds/zig-linux-x86_64-$_zigver.tar.xz)
sha256sums=('SKIP'
            '673c13d27e024d7403d15d800a57f7e97c4fec81c20421dcf23db18c7ecbcafb')

prepare() {
  cd "$pkgname"

  bun i -g @oven/zig
  rm -rf ~/.bun/install/global/node_modules/@oven/zig-linux-x64/*
  cp -r ../zig-linux-x86_64-0.12.0-dev.1297+a9e66ed73/* ~/.bun/install/global/node_modules/@oven/zig-linux-x64/
  # bun update -g @oven/zig
  # bun i

  make assert-deps
  git -c submodule.src/javascript/jsc/WebKit.update=checkout submodule update --init --recursive --depth=1 --progress

  bash ./scripts/all-dependencies.sh
  make runtime_js fallback_decoder bun_error node-fallbacks #identifier-cache clean-bindings
}

build() {
  # mkdir -p $srcdir/bun/src/bun.js/WebKit/WebKitBuild/Release/lib/
  # ln -sf /usr/lib/libicui18n.so $srcdir/bun/src/bun.js/WebKit/WebKitBuild/Release/lib/libicui18n.a
  # ln -sf /usr/lib/libicudata.so $srcdir/bun/src/bun.js/WebKit/WebKitBuild/Release/lib/libicudata.a
  # ln -sf /usr/lib/libicuuc.so $srcdir/bun/src/bun.js/WebKit/WebKitBuild/Release/lib/libicuuc.a
  # make jsc-build jsc-copy-headers -j1

  cmake -B $pkgname/build -S $pkgname -DCMAKE_BUILD_TYPE=Release -GNinja -DUSE_STATIC_LIBATOMIC=OFF #-DCMAKE_C_COMPILER="$CC" -DCMAKE_CXX_COMPILER="$CXX"
  ninja -C $pkgname/build
}

package() {
  install -Dm755 $srcdir/$pkgname/build/bun $pkgdir/usr/bin/bun
  ln -s /usr/bin/bun $pkgdir/usr/bin/bunx

  SHELL=zsh $pkgdir/usr/bin/bun completions > bun.zsh
  SHELL=bash $pkgdir/usr/bin/bun completions > bun.bash
  SHELL=fish $pkgdir/usr/bin/bun completions > bun.fish

  install -Dm644 bun.zsh $pkgdir/usr/share/zsh/site-functions/_bun
  install -Dm644 bun.bash $pkgdir/usr/share/bash-completion/completions/bun
  install -Dm644 bun.fish $pkgdir/usr/share/fish/vendor_completions.d/bun.fish
}
