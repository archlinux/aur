# Maintainer: Jan Marvin Garbuszus <jan.garbuszus@rub.de>
# Contributor: Marco Pompili <aur (at) mg.odd.red>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Contributor: David Flemström <david.flemstrom@gmail.com>

pkgname=v8-r
pkgver=14.4.198
pkgrel=1
pkgdesc="Google's open source JavaScript and WebAssembly engine"
arch=('x86_64')
url="https://v8.dev"
license=('BSD')
depends=('icu')
optional=('rlwrap')
options=(!debug)
makedepends=('clang' 'procps-ng' 'git' 'lld' 'llvm' 'python3')
conflicts=('v8' 'v8-3.14' 'v8.3.14-bin' 'v8-6.7-static' 'v8-static-gyp' 'v8-static-gyp-5.4')
provides=('v8')
source=("depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "v8.pc"
        "v8_libbase.pc"
        "v8_libplatform.pc"
        "d8"
        "compiler-rt-adjust-paths.patch"
        "fix_clang.diff"
        "fix_temporal_icu.diff"
        "silence_build.diff")
sha256sums=('SKIP'
            'aa704f4549d240b568304e30714e042f6da41b39847949c1018652acf07942a9'
            'efb37bd706e6535abfa20c77bb16597253391619dae275627312d00ee7332fa3'
            'ae23d543f655b4d8449f98828d0aff6858a777429b9ebdd2e23541f89645d4eb'
            '6abb07ab1cf593067d19028f385bd7ee52196fc644e315c388f08294d82ceff0'
            '3e63769d9eaaeba0ff88e4228ac9bf62f7b841a3e33dfa65e305005ce71d480c'
            '6e1456f7235e4059e6343ad8a4332f415564131f6dc7b35f608cec66e2f4430f'
            '676e76700648a6a84f364cfbb956159c7fb74f141b2c32287ed84a9ab59bda70'
            '04af20e828ac79ae6b0d38ae7b0bd6a88c398d40e12cebdbccc1e6a885c3b27a')

OUTFLD=x64.release

prepare() {

  export PATH=`pwd`/depot_tools:"$PATH"

  if [ ! -d "v8" ]; then
    msg2 "Fetching V8 code"
    yes | fetch v8
  fi

  cd $srcdir/v8

  msg2 "Reset repository"
  git reset --hard

  if [ -f third_party/icu/BUILD.gn.orig ]
  then
      msg2 "Restoring bundled ICU build files for syncing"
      $srcdir/v8/build/linux/unbundle/replace_gn_files.py --undo --system-libraries icu
  fi

  msg2 "Syncing, this can take a while..."
  gclient sync -D --force --reset
  gclient sync --revision ${pkgver}

  msg2 "Using system libraries for ICU"
  $srcdir/v8/build/linux/unbundle/replace_gn_files.py --system-libraries icu

  # patches:
  # 1 - let system clang find compiler-rt (taken from Arch's chromium build)
  # 2 - if building with clang, avoild pulling in clang modules files
  # 3 - temporal with icu requires some headers from icu common we don't have
  # 4 - disable warnings from upstreams clang
  git apply ${srcdir}/compiler-rt-adjust-paths.patch
  git apply ${srcdir}/fix_clang.diff
  git apply ${srcdir}/fix_temporal_icu.diff
  git apply ${srcdir}/silence_build.diff

  # provide pkgconfig files
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8.pc"
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8_libbase.pc"
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8_libplatform.pc"

  # Increase _FORTIFY_SOURCE level to match Arch's default flags
  sed -i 's/fortify_level = "2"/fortify_level = "3"/' ${srcdir}/v8/build/config/compiler/BUILD.gn

  local _clang_version=$(clang --version | grep -m1 version | sed 's/.* \([0-9]\+\).*/\1/')

  msg2 "Running GN..."
  gn gen $OUTFLD \
    -vv --fail-on-unused-args \
    --args="clang_base_path=\"/usr\"
            clang_use_chrome_plugins=false
            clang_version=\"$_clang_version\"
            dcheck_always_on=false
            icu_use_data_file=false
            is_asan=false
            is_clang=true
            is_component_build=true
            is_debug=false
            is_official_build=false
            treat_warnings_as_errors=false
            use_clang_modules=false
            use_custom_libcxx=false
            use_lld=true
            use_sysroot=false
            symbol_level=0
            v8_enable_backtrace=true
            v8_enable_disassembler=true
            v8_enable_i18n_support=true
            v8_enable_object_print=true
            v8_enable_sandbox=true
            v8_enable_static_roots=true
            v8_enable_verify_heap=true
            v8_use_external_startup_data=false"

  # Fixes bug in generate_shim_headers.py that fails to create these dirs
  msg2 "Adding icu missing folders"
  mkdir -p "$OUTFLD/gen/shim_headers/icuuc_shim/third_party/icu/source/common/unicode/"
  mkdir -p "$OUTFLD/gen/shim_headers/icui18n_shim/third_party/icu/source/i18n/unicode/"

}

build() {

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  export PATH=`pwd`/depot_tools:"$PATH"

  cd $srcdir/v8

  msg2 "Building"
  ninja -C $OUTFLD
}

check() {
  cd $srcdir/v8

  msg2 "Testing"
  tools/run-tests.py --no-presubmit \
                     --outdir=$OUTFLD \
                     --arch="x64" || true
}

package() {
  cd $srcdir/v8

  install -d ${pkgdir}/usr/lib/v8
  install -Dm755 ${srcdir}/d8 ${pkgdir}/usr/bin/d8

  install -Dm755 $OUTFLD/d8 ${pkgdir}/usr/lib/v8/d8
  install -Dm755 $OUTFLD/libv8.so ${pkgdir}/usr/lib/libv8.so
  install -Dm755 $OUTFLD/libv8_libbase.so ${pkgdir}/usr/lib/libv8_libbase.so
  install -Dm755 $OUTFLD/libv8_libplatform.so ${pkgdir}/usr/lib/libv8_libplatform.so
  install -Dm755 $OUTFLD/libchrome_zlib.so ${pkgdir}/usr/lib/libchrome_zlib.so
  install -Dm755 $OUTFLD/libthird_party_abseil-cpp_absl.so ${pkgdir}/usr/lib/libthird_party_abseil-cpp_absl.so
  install -Dm755 $OUTFLD/libthird_party_partition_alloc_src_partition_alloc_allocator_base.so ${pkgdir}/usr/lib/libthird_party_partition_alloc_src_partition_alloc_allocator_base.so
  install -Dm755 $OUTFLD/libthird_party_partition_alloc_src_partition_alloc_allocator_core.so ${pkgdir}/usr/lib/libthird_party_partition_alloc_src_partition_alloc_allocator_core.so
  install -Dm755 $OUTFLD/libthird_party_partition_alloc_src_partition_alloc_allocator_shim.so ${pkgdir}/usr/lib/libthird_party_partition_alloc_src_partition_alloc_allocator_shim.so
  install -Dm755 $OUTFLD/libthird_party_partition_alloc_src_partition_alloc_raw_ptr.so ${pkgdir}/usr/lib/libthird_party_partition_alloc_src_partition_alloc_raw_ptr.so


  # install -Dm755 $OUTFLD/cctest ${pkgdir}/usr/lib/v8/cctest
  # install -Dm755 $OUTFLD/libv8_for_testing.so ${pkgdir}/usr/lib/libv8_for_testing.so
  # install -Dm755 $OUTFLD/libv8_debug_helper.so ${pkgdir}/usr/lib/libv8_debug_helper.so

  install -d ${pkgdir}/usr/include
  install -Dm644 include/*.h ${pkgdir}/usr/include

  install -d ${pkgdir}/usr/include/cppgc
  install -Dm644 include/cppgc/*.h ${pkgdir}/usr/include/cppgc

  install -d ${pkgdir}/usr/include/cppgc/internal
  install -Dm644 include/cppgc/internal/*.h ${pkgdir}/usr/include/cppgc/internal

  install -d ${pkgdir}/usr/include/libplatform
  install -Dm644 include/libplatform/*.h ${pkgdir}/usr/include/libplatform

  install -d ${pkgdir}/usr/lib/pkgconfig
  install -m644 $srcdir/v8.pc ${pkgdir}/usr/lib/pkgconfig
  install -m644 $srcdir/v8_libbase.pc ${pkgdir}/usr/lib/pkgconfig
  install -m644 $srcdir/v8_libplatform.pc ${pkgdir}/usr/lib/pkgconfig

  install -d ${pkgdir}/usr/share/licenses/v8
  install -m644 LICENSE* ${pkgdir}/usr/share/licenses/v8

}

# vim:set ts=2 sw=2 et:
