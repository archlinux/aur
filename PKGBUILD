# Maintainer: Jan Marvin Garbuszus <jan.garbuszus@rub.de>
# Contributor: Marco Pompili <aur (at) mg.odd.red>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Contributor: David Flemström <david.flemstrom@gmail.com>

pkgname=v8-r
pkgver=9.2.90
pkgrel=1
pkgdesc="Google's open source JavaScript and WebAssembly engine"
arch=('x86_64')
url="https://v8.dev"
license=('BSD')
depends=('icu')
optional=('rlwrap')
makedepends=('python2' 'python3' 'git')
conflicts=('v8' 'v8-3.14' 'v8-3.15' 'v8-3.20' 'v8-static-gyp' 'v8-static-gyp-5.4')
provides=('v8')
source=("depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "v8.pc"
        "v8_libbase.pc"
        "v8_libplatform.pc"
        "d8"
        "nodiscard.patch")
sha256sums=('SKIP'
            '3616bcfb15af7cd5a39bc0f223b2a52f15883a4bc8cfcfb291837c7421363d75'
            'efb37bd706e6535abfa20c77bb16597253391619dae275627312d00ee7332fa3'
            'ae23d543f655b4d8449f98828d0aff6858a777429b9ebdd2e23541f89645d4eb'
            '6abb07ab1cf593067d19028f385bd7ee52196fc644e315c388f08294d82ceff0'
            '94c45782121beb7f442e5c92a2e44cbc7a83729ce95a561caf4f4e0c54b4dc39')

OUTFLD=x86.release

prepare() {

  export PATH=`pwd`/depot_tools:"$PATH"
  export GYP_GENERATORS=ninja

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

  # provide pkgconfig files
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8.pc"
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8_libbase.pc"
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8_libplatform.pc"

  # it is not really important for us, since it is only usefull for building
  # though it breaks our build. might be gcc 10 related. Works with clang.
  msg2 "disable nodiscard with gcc"
  git apply --whitespace=fix ../nodiscard.patch

  msg2 "Running GN..."
  gn gen $OUTFLD \
    -vv --fail-on-unused-args \
    --args='is_clang=false
            is_asan=false
            use_gold=true
            is_component_build=true
            is_debug=false
            is_official_build=false
            treat_warnings_as_errors=false
            v8_enable_i18n_support=true
            v8_use_external_startup_data=false
            v8_generate_external_defines_header=true
            use_custom_libcxx=false
            use_sysroot=false'

  # Fixes bug in generate_shim_headers.py that fails to create these dirs
  msg2 "Adding icu missing folders"
  mkdir -p "$OUTFLD/gen/shim_headers/icuuc_shim/third_party/icu/source/common/unicode/"
  mkdir -p "$OUTFLD/gen/shim_headers/icui18n_shim/third_party/icu/source/i18n/unicode/"
  
}

build() {
  export PATH=`pwd`/depot_tools:"$PATH"
  export GYP_GENERATORS=ninja

  cd $srcdir/v8

  msg2 "Building, this will take a while..."
  ninja -C $OUTFLD
}

check() {
  cd $srcdir/v8

  msg2 "Testing, this will also take a while..."
  python2  tools/run-tests.py --no-presubmit \
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

  # install -Dm755 $OUTFLD/cctest ${pkgdir}/usr/lib/v8/cctest
  # install -Dm755 $OUTFLD/libv8_for_testing.so ${pkgdir}/usr/lib/libv8_for_testing.so
  # install -Dm755 $OUTFLD/libv8_debug_helper.so ${pkgdir}/usr/lib/libv8_debug_helper.so

  install -d ${pkgdir}/usr/include
  install -Dm644 include/*.h ${pkgdir}/usr/include

  install -d ${pkgdir}/usr/include/cppgc
  install -Dm644 include/cppgc/*.h ${pkgdir}/usr/include/cppgc

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
