# Maintainer: Daniele Basso <d dot bass 05 at proton dot me>
pkgname=bun
pkgver=1.0.26
#_zigver=0.12.0-dev.1604+caae40c21 #https://github.com/oven-sh/bun/blob/bun-v1.0.18/build.zig#L9
pkgrel=1
pkgdesc="Bun is a fast JavaScript all-in-one toolkit. This PKGBUILD builds from source, resulting into a smaller and faster binary depending on your CPU."
arch=(x86_64)
url="https://github.com/oven-sh/bun"
license=('GPL')
makedepends=(
	clang cmake esbuild git go icu libiconv libtool lld llvm ninja pkg-config python ruby rust unzip
)
conflicts=(bun-bin)
source=(git+$url.git#tag=bun-v$pkgver
        bun-linux-x64-$pkgver.zip::https://github.com/oven-sh/bun/releases/download/bun-v$pkgver/bun-linux-x64-baseline.zip)
b2sums=('SKIP'
        'ba3df8e4d8a3f5b72c61cd8a510da6b1e16bd03ec5eb8d4b38228c587aba9c02fc28f332ab54b7ce315d3e50b4e45d8d2dcf30a801533eb237c044a63ba4abe4')

_j=$(($(nproc)/2)) #change for your system

prepare() {
  cd "$pkgname"

  export PATH="${srcdir}/bun-linux-x64-baseline:$PATH"
# 
#   export PATH="$PATH":$srcdir/zig-linux-x86_64-$_zigver
# 
#   mkdir -p $srcdir/bun/.cache/
#   # ln -sf $srcdir/zig-linux-$_zigver $srcdir/bun/.cache/zig
#   # ln -sf $srcdir/zig-linux-$_zigver.tar.xz $srcdir/bun/.cache/
  git -c submodule.src/javascript/jsc/WebKit.update=checkout submodule update --init --recursive --depth=1 --progress

  bun i
  bash ./scripts/all-dependencies.sh
  bash ./scripts/download-zig.sh
  make runtime_js fallback_decoder bun_error node-fallbacks
}

build() {
  # Copied from https://github.com/oven-sh/WebKit/blob/main/Dockerfile#L60
  #export CFLAGS="$CFLAGS -ffat-lto-objects"
  #export CXXFLAGS="$CXXFLAGS -ffat-lto-objects"

  CC="clang" CXX="clang++" cmake \
      -S $srcdir/bun/src/bun.js/WebKit/ \
      -B $srcdir/bun/src/bun.js/WebKit/build \
      -DPORT="JSCOnly" \
      -DENABLE_STATIC_JSC=ON \
      -DENABLE_BUN_SKIP_FAILING_ASSERTIONS=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DUSE_THIN_ARCHIVES=OFF \
      -DUSE_BUN_JSC_ADDITIONS=ON \
      -DENABLE_FTL_JIT=ON \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
      -DALLOW_LINE_AND_COLUMN_NUMBER_IN_BUILTINS=ON \
      -DENABLE_SINGLE_THREADED_VM_ENTRY_SCOPE=ON \
      -GNinja


  ninja -C $srcdir/bun/src/bun.js/WebKit/build jsc -j$_j

  mkdir -p $srcdir/bun/src/bun.js/WebKit/output/{lib,include/JavaScriptCore,Source/JavaScriptCore}

  cp -r $srcdir/bun/src/bun.js/WebKit/build/lib/*.a $srcdir/bun/src/bun.js/WebKit/output/lib
  cp $srcdir/bun/src/bun.js/WebKit/build/*.h $srcdir/bun/src/bun.js/WebKit/output/include
  find $srcdir/bun/src/bun.js/WebKit/build/JavaScriptCore/Headers/JavaScriptCore/ -name "*.h" -exec cp {} $srcdir/bun/src/bun.js/WebKit/output/include/JavaScriptCore/ \;
  find $srcdir/bun/src/bun.js/WebKit/build/JavaScriptCore/PrivateHeaders/JavaScriptCore/ -name "*.h" -exec cp {} $srcdir/bun/src/bun.js/WebKit/output/include/JavaScriptCore/ \;
  cp -r $srcdir/bun/src/bun.js/WebKit/build/WTF/Headers/wtf/ $srcdir/bun/src/bun.js/WebKit/output/include
  cp -r $srcdir/bun/src/bun.js/WebKit/build/bmalloc/Headers/bmalloc/ $srcdir/bun/src/bun.js/WebKit/output/include
  cp -r $srcdir/bun/src/bun.js/WebKit/Source/JavaScriptCore/Scripts $srcdir/bun/src/bun.js/WebKit/output/Source/JavaScriptCore
  cp $srcdir/bun/src/bun.js/WebKit/Source/JavaScriptCore/create_hash_table $srcdir/bun/src/bun.js/WebKit/output/Source/JavaScriptCore

  ln -sf /lib/libicudata.so $srcdir/bun/src/bun.js/WebKit/output/lib/libicudata.a
  ln -sf /lib/libicui18n.so $srcdir/bun/src/bun.js/WebKit/output/lib/libicui18n.a
  ln -sf /lib/libicuuc.so $srcdir/bun/src/bun.js/WebKit/output/lib/libicuuc.a

  cmake -B $pkgname/build -S $pkgname -DCMAKE_BUILD_TYPE=Release -GNinja -DUSE_STATIC_LIBATOMIC=OFF -DWEBKIT_DIR=$srcdir/bun/src/bun.js/WebKit/output -DUSE_DEBUG_JSC=ON -DZIG_OPTIMIZE=ReleaseFast
  ninja -C $pkgname/build -j$_j
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
