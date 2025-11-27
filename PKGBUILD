# Maintainer: Daniele Basso <d dot bass 05 at proton dot me>
pkgname=bun
pkgver=1.3.3
pkgrel=2
pkgdesc="Bun is a fast JavaScript all-in-one toolkit. This PKGBUILD builds from source, resulting into a smaller and faster binary depending on your CPU."
arch=(x86_64)
url="https://github.com/oven-sh/bun"
license=('MIT')
#depends=(c-ares libarchive libuv mimalloc tcc zlib zstd)
makedepends=(
  clang cmake git go icu libdeflate libiconv libtool lld llvm ninja pkgconf python ruby ruby-getoptlong rust sccache unzip zig
)
conflicts=(bun-bin bun-git)
source=(bun::git+$url.git#tag=bun-v$pkgver
        bun-linux-x64-$pkgver.zip::https://github.com/oven-sh/bun/releases/download/bun-v$pkgver/bun-linux-x64.zip # add "baseline" here to download the avx2-less build of bun!
        brotliFlag.patch)
b2sums=('cbd6a92d36c249707fb65e107eed36be43d32d0b45995a30831858b2efb5c6457cfae9d955d42125ce5dcfbc8714ab4f6c0155c0a8a75b5888b57eeac37d1a15'
        'a9b1261a222a8e156a5d39c963be47cb31da420f2e6e5779385f30f1a896c94a117c85c6476732871ac9e309021c23d8588146040c7150d05c6a0147bed8c7a9'
        'ba86bf7d8ff3c6b0aa1b26a2eaf7d0ca480ff42fde59b75f3290de3f197a07ec8fd926c96287436e29d5dedb9632ffe9e1f8d44ebfa7f9df804874bc889afc2d')
options=(lto)

_j=$(( $(nproc) / 2 + 1 )) # Chooses parallel job count automatically

prepare() {
  _webkitver=$(grep -Eom1 [a-f0-9]{40} $srcdir/bun/cmake/tools/SetupWebKit.cmake) #https://github.com/oven-sh/bun/blob/main/cmake/tools/SetupWebKit.cmake#L5

  if ! [[ -d WebKit ]]; then
      git clone --filter=tree:0 --sparse https://github.com/oven-sh/WebKit.git -b autobuild-$_webkitver
  else
      git -C WebKit fetch --filter=tree:0 # --sparse
      git -C WebKit switch --detach autobuild-$_webkitver
  fi

  git -C WebKit sparse-checkout set Source

  cd $srcdir/bun

  # mkdir -p ./vendor
  # ln -sf $srcdir/WebKit ./vendor/WebKit

  patch -Np1 -i ../brotliFlag.patch
}

build() {
  export PATH="${srcdir}/bun-linux-x64:$PATH"
  export CMAKE_POLICY_VERSION_MINIMUM=3.30

  mkdir -p ./build

  build_webkit

  # CXXFLAGS="-Wno-unused-result ${CXXFLAGS}" bun run build

  # rm -vf build/CMakeCache.txt
  cd bun

  rm -rf vendor/zig
  mkdir -p vendor/zig
  ln -sf /usr/lib/zig vendor/zig/lib 
  ln -sf /usr/bin/zig vendor/zig/zig
  
  CXXFLAGS="-Wno-unused-result -Wno-character-conversion ${CXXFLAGS}" cmake -GNinja -B $srcdir/build -S $srcdir/bun -Wno-dev -DCMAKE_BUILD_TYPE=Release -DUSE_STATIC_LIBATOMIC=OFF \
        -DENABLE_LTO=ON -DENABLE_ASAN=OFF -DUSE_STATIC_SQLITE=OFF -DWEBKIT_LOCAL=ON -DWEBKIT_PATH=$srcdir/WebKitBuild/output \
        -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" -DZIG_PATH="/usr/lib/zig" -DLLVM_VERSION=21.1.4

  ninja -C $srcdir/build -j$_j bun
}

build_webkit(){

  pushd $srcdir/WebKit/

#   cd $srcdir/bun
# 
#   WEBKIT_DIR=$srcdir/WebKit make jsc-copy-headers
# 
#   cd ..

  mkdir -p WebKitBuild/Release

  # Adapted from https://github.com/oven-sh/WebKit/blob/main/Dockerfile#L109

  export DEFAULT_CFLAGS="-mno-omit-leaf-frame-pointer -g -fno-omit-frame-pointer -ffunction-sections -fdata-sections -faddrsig -fno-unwind-tables -fno-asynchronous-unwind-tables -DU_STATIC_IMPLEMENTATION=1 -DNDEBUG=1 "
  export LTO_FLAG="-flto=full -fwhole-program-vtables -fforce-emit-vtables "

  export CFLAGS="${DEFAULT_CFLAGS} $CFLAGS $LTO_FLAG "
  export CXXFLAGS="${DEFAULT_CFLAGS} $CXXFLAGS $LTO_FLAG -fno-c++-static-destructors "

  CC="/usr/bin/clang" CXX="/usr/bin/clang++" \
  cmake \
      -S . \
      -B $srcdir/WebKitBuild \
      -DCMAKE_BUILD_TYPE=Release \
      -Wno-dev \
      -GNinja \
      -DPORT="JSCOnly" \
      -DENABLE_STATIC_JSC=ON \
      -DALLOW_LINE_AND_COLUMN_NUMBER_IN_BUILTINS=ON \
      -DUSE_THIN_ARCHIVES=OFF \
      -DUSE_BUN_JSC_ADDITIONS=ON \
      -DUSE_BUN_EVENT_LOOP=ON \
      -DENABLE_FTL_JIT=ON \
      -DALLOW_LINE_AND_COLUMN_NUMBER_IN_BUILTINS=ON \
      -DJSEXPORT_PRIVATE=WTF_EXPORT_DECLARATION \
      -DUSE_VISIBILITY_ATTRIBUTE=1 \
      -DENABLE_REMOTE_INSPECTOR=ON \
      -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld"

  cd $srcdir/WebKitBuild
  ninja jsc -j$_j

  mkdir -p ./output/{lib,include/JavaScriptCore,Source/JavaScriptCore}

  cp -r ./lib ./output/
  cp ./*.h ./output/include
  cp -r ./bin ./output/
  # cp ./*.json ./output

  find ./JavaScriptCore/DerivedSources/ -name "*.h" -exec sh -c 'cp "$1" "./output/include/JavaScriptCore/$(basename "$1")"' sh {} \;
  find ./JavaScriptCore/DerivedSources/ -name "*.json" -exec sh -c 'cp "$1" "./output/$(basename "$1")"' sh {} \;
  find ./JavaScriptCore/Headers/JavaScriptCore/ -name "*.h" -exec cp {} ./output/include/JavaScriptCore/ \;
  find ./JavaScriptCore/PrivateHeaders/JavaScriptCore/ -name "*.h" -exec cp {} ./output/include/JavaScriptCore/ \;
  cp -r ./WTF/Headers/wtf/ ./output/include
  cp -r ./bmalloc/Headers/bmalloc/ ./output/include
  mkdir -p ./output/Source/JavaScriptCore
  cp -r $srcdir/WebKit/Source/JavaScriptCore/Scripts ./output/Source/JavaScriptCore
  cp $srcdir/WebKit/Source/JavaScriptCore/create_hash_table ./output/Source/JavaScriptCore

  ln -sf /lib/libicudata.so ./output/lib/libicudata.a
  ln -sf /lib/libicui18n.so ./output/lib/libicui18n.a
  ln -sf /lib/libicuuc.so ./output/lib/libicuuc.a

  popd
}

package() {
  install -Dm755 $srcdir/build/bun $pkgdir/usr/bin/bun
  ln -s /usr/bin/bun $pkgdir/usr/bin/bunx

  install -Dm644 $srcdir/bun/completions/bun.zsh $pkgdir/usr/share/zsh/site-functions/_bun
  install -Dm644 $srcdir/bun/completions/bun.bash $pkgdir/usr/share/bash-completion/completions/bun
  install -Dm644 $srcdir/bun/completions/bun.fish $pkgdir/usr/share/fish/vendor_completions.d/bun.fish
}
