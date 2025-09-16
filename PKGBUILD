# Maintainer: Daniele Basso <d dot bass 05 at proton dot me>
pkgname=bun
pkgver=1.2.22
pkgrel=1
pkgdesc="Bun is a fast JavaScript all-in-one toolkit. This PKGBUILD builds from source, resulting into a smaller and faster binary depending on your CPU."
arch=(x86_64)
url="https://github.com/oven-sh/bun"
license=('GPL')
#depends=(c-ares libarchive libuv mimalloc tcc zlib zstd)
makedepends=(
	ccache clang cmake git go icu libdeflate libiconv libtool lld llvm ninja mold pkgconf python ruby ruby-getoptlong rust unzip
)
conflicts=(bun-bin bun-git)
source=(bun::git+$url.git#tag=bun-v$pkgver
		        bun-linux-x64-$pkgver.zip::https://github.com/oven-sh/bun/releases/download/bun-v$pkgver/bun-linux-x64.zip # add "baseline" here to download the avx2-less build of bun!
        brotliFlag.patch)
b2sums=('a44e6aeda3a92d42243f9db59ea958b530f7e53467486753bcf23e642cce5649705554eede280c7aa2e4d15c9ff9cff0c4122fc93f3da1f664d360ffe90714e1'
        'd3f01dc8e900a37895e9e1550d968cd59e53818dce5b82384db5bc43178d5673e936d3d0a549222e565ad1930e544351724f7f359636760bd6a471bebe40675c'
        'ba86bf7d8ff3c6b0aa1b26a2eaf7d0ca480ff42fde59b75f3290de3f197a07ec8fd926c96287436e29d5dedb9632ffe9e1f8d44ebfa7f9df804874bc889afc2d')
options=(ccache lto)

_j=$(( $(nproc) / 2 + 1 )) # Chooses parallel job count automatically

prepare() {
  _webkitver=$(grep -Eom1 [a-f0-9]{40} $srcdir/bun/cmake/tools/SetupWebKit.cmake) #https://github.com/oven-sh/bun/blob/main/cmake/tools/SetupWebKit.cmake#L5
  # rm -rf WebKit
  if ! [[ -d WebKit ]]; then
      git clone --filter=tree:0 https://github.com/oven-sh/WebKit.git -b autobuild-$_webkitver
  else
      git -C WebKit fetch --filter=tree:0
      git -C WebKit switch --detach autobuild-$_webkitver
  fi

  cd bun

  # mkdir -p ./vendor
  # ln -sf $srcdir/WebKit ./vendor/WebKit

  patch -Np1 -i ../brotliFlag.patch
}

export MOLD_JOBS=1

build() {
  export PATH="${srcdir}/bun-linux-x64:$PATH"
  export CMAKE_POLICY_VERSION_MINIMUM=3.30

  mkdir -p ./build

  build_webkit

  # CXXFLAGS="-Wno-unused-result ${CXXFLAGS}" bun run build

  # rm -vf build/CMakeCache.txt
  cd bun
  # CC="/usr/lib/llvm19/bin/clang" CXX="/usr/lib/llvm19/bin/clang++" \
  CMAKE_LINKER_TYPE="mold" \
  CXXFLAGS="-Wno-unused-result ${CXXFLAGS}" bun ./scripts/build.mjs -GNinja -B $srcdir/build -S $srcdir/bun -Wno-dev -DCMAKE_BUILD_TYPE=Release -DUSE_STATIC_LIBATOMIC=OFF \
        -DENABLE_CCACHE=ON -DENABLE_LTO=ON -DENABLE_ASAN=OFF -DUSE_STATIC_SQLITE=OFF -DWEBKIT_LOCAL=ON -DWEBKIT_PATH=$srcdir/WebKitBuild/output  -j$_j -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=mold" -DLLVM_VERSION=20.1.8
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
  CMAKE_LINKER_TYPE="mold" \
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
      -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=mold"

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

  SHELL=zsh $pkgdir/usr/bin/bun completions > bun.zsh
  SHELL=bash $pkgdir/usr/bin/bun completions > bun.bash
  SHELL=fish $pkgdir/usr/bin/bun completions > bun.fish

  install -Dm644 bun.zsh $pkgdir/usr/share/zsh/site-functions/_bun
  install -Dm644 bun.bash $pkgdir/usr/share/bash-completion/completions/bun
  install -Dm644 bun.fish $pkgdir/usr/share/fish/vendor_completions.d/bun.fish
}
