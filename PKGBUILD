# Maintainer: Daniele Basso <d dot bass 05 at proton dot me>
pkgname=bun
pkgver=1.0.11
_zigver=0.12.0-dev.1297+a9e66ed73
pkgrel=2
pkgdesc="Bun is a fast JavaScript all-in-one toolkit. This PKGBUILD builds from source, resulting into a minor binary depending on your CPU."
arch=(x86_64)
url="https://github.com/oven-sh/bun"
license=('GPL')
makedepends=(
	npm clang cmake esbuild git go icu libiconv libtool lld llvm ninja pkg-config python ruby rust unzip zig
)
conflicts=(bun-bin)
source=(git+$url.git#tag=bun-v$pkgver https://ziglang.org/builds/zig-linux-x86_64-$_zigver.tar.xz)
sha256sums=('SKIP'
            '673c13d27e024d7403d15d800a57f7e97c4fec81c20421dcf23db18c7ecbcafb')

prepare() {
  bun i -g @oven/zig
  rm -rf ~/.bun/install/global/node_modules/@oven/zig-linux-x64
  ln -sf  $srcdir/zig-linux-x86_64-$_zigver ~/.bun/install/global/node_modules/@oven/zig-linux-x64
  # bun update -g @oven/zig

  cd "$pkgname"
  bun i

  make assert-deps
  git -c submodule.src/javascript/jsc/WebKit.update=checkout submodule update --init --recursive --depth=1 --progress

  bash ./scripts/all-dependencies.sh
  make runtime_js fallback_decoder bun_error node-fallbacks #identifier-cache clean-bindings
}

build() {
  # Copied from https://github.com/oven-sh/WebKit/blob/main/Dockerfile#L57
#   export CFLAGS="$CFLAGS -ffat-lto-objects"
#   export CXXFLAGS="$CXXFLAGS -ffat-lto-objects"
#   cmake \
#       -S $srcdir/bun/src/bun.js/WebKit/ \
#       -B $srcdir/bun/src/bun.js/WebKit/build \
#       -DPORT="JSCOnly" \
#       -DENABLE_STATIC_JSC=ON \
#       -DENABLE_BUN_SKIP_FAILING_ASSERTIONS=ON \
#       -DCMAKE_BUILD_TYPE=Release \
#       -DUSE_THIN_ARCHIVES=OFF \
#       -DUSE_BUN_JSC_ADDITIONS=ON \
#       -DENABLE_FTL_JIT=ON \
#       -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
#       -DALLOW_LINE_AND_COLUMN_NUMBER_IN_BUILTINS=ON \
#       -DENABLE_SINGLE_THREADED_VM_ENTRY_SCOPE=ON \
#       -G Ninja
# 
#   cmake --build $srcdir/bun/src/bun.js/WebKit/build --target "jsc"
#   
#   cp -r $srcdir/bun/src/bun.js/WebKit/build/lib/*.a /output/lib
#   cp $srcdir/bun/src/bun.js/WebKit/build/*.h /output/include
#   find $srcdir/bun/src/bun.js/WebKit/build/JavaScriptCore/Headers/JavaScriptCore/ -name "*.h" -exec cp {} /output/include/JavaScriptCore/ \
#   find $srcdir/bun/src/bun.js/WebKit/build/JavaScriptCore/PrivateHeaders/JavaScriptCore/ -name "*.h" -exec cp {} /output/include/JavaScriptCore/ \
#   cp -r $srcdir/bun/src/bun.js/WebKit/build/WTF/Headers/wtf/ /output/include
#   cp -r $WEBKI$srcdir/bun/src/bun.js/WebKit/buildOUT_DIR/bmalloc/Headers/bmalloc/ /output/include
#   mkdir -p /output/Source/JavaScriptCore
#   cp -r /webkit/Source/JavaScriptCore/Scripts /output/Source/JavaScriptCore
#   cp /webkit/Source/JavaScriptCore/create_hash_table /output/Source/JavaScriptCore

  cmake -B $pkgname/build -S $pkgname -DCMAKE_BUILD_TYPE=Release -GNinja -DUSE_STATIC_LIBATOMIC=OFF
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
