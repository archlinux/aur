# Maintainer: Marco Pompili <aur@mg.odd.red>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Contributor: David Flemström <david.flemstrom@gmail.com>

pkgname=v8
pkgver=8.3.110.13
pkgrel=1
pkgdesc="Fast and modern Javascript engine used in Google Chrome."
arch=('i686' 'x86_64')
url="https://v8.dev"
license=('BSD')
depends=('readline' 'icu')
makedepends=('clang' 'clang-tools-extra' 'python2' 'python2-colorama' 'python2-pylint' 'python2-lazy-object-proxy' 'python2-singledispatch' 'python2-wrapt' 'ninja' 'git' 'wget')
conflicts=('v8-3.14' 'v8-3.14-bin' 'v8-3.15' 'v8-3.20' 'v8-6.7-static' 'v8-6.8' 'v8-r' 'v8-static-gyp' 'v8-static-gyp-5.4')
source=("depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "v8.pc"
        "v8_libbase.pc"
        "v8_libplatform.pc"
        "v8-icu67.patch"
        "template-utils-fix.patch"
        "d8")
sha256sums=('SKIP'
            '3616bcfb15af7cd5a39bc0f223b2a52f15883a4bc8cfcfb291837c7421363d75'
            'efb37bd706e6535abfa20c77bb16597253391619dae275627312d00ee7332fa3'
            'ae23d543f655b4d8449f98828d0aff6858a777429b9ebdd2e23541f89645d4eb'
            '14ad0b8cb494a6bd73bbb792a2da8a9e3e521b5f62678ae15b9324516c5c897e'
            '75b59cbb31fa15302aaf698f8a681c212b670af3c47973868960ce1fa6ebdb98'
            '6abb07ab1cf593067d19028f385bd7ee52196fc644e315c388f08294d82ceff0')

#
# Custom configuration for V8
#

# clang_base_path: Set clang path when not using the clang bundled with V8.
V8_CLANG_PATH="/usr/"

# is_clang: Set to true when compiling with the Clang compiler. Typically this
# is used to configure warnings.
V8_IS_CLANG=false

# is_component_build: Component build. Setting to true compiles targets declared
# as "components" as shared libraries loaded dynamically.
# This speeds up development time.
# When false, components will be linked statically.
V8_COMPONENT_BUILD=true

# is_debug: Enabling official builds (V8_OFFICIAL_BUILD) automatically sets is_debug to false.
V8_DEBUG=false

# is_official_build: Set to enable the official build level of optimization.
# This has nothing to do with branding, but enables an additional level of
# optimization above release (!is_debug). This might be better expressed
# as a tri-state (debug, release, official) but for historical reasons there
# are two separate flags.
V8_OFFICIAL_BUILD=false

# v8_enable_i18n_support: Enable ECMAScript Internationalization API.
# Enabling this feature will add a dependency on the ICU library.
V8_I18N_SUPPORT=true

# v8_use_external_startup_data: Use external files for startup data blobs:
# the JS builtins sources and the start snapshot.
V8_USE_EXTERNAL_STARTUP_DATA=""

# Use sysroot
V8_USE_SYSROOT=false

# treat_warnings_as_errors: Default to warnings as errors for default workflow,
# where we catch warnings with known toolchains. Allow overriding this e.g.
# for Chromium builds on Linux that could use a different version of the compiler.
# With GCC, warnings in no-Chromium code are always not treated as errors.
V8_WARNINGS_AS_ERRORS=false

case "$CARCH" in
  x86_64) V8_ARCH="x64" ;;
  i686) V8_ARCH="ia32" ;;
esac

OUTFLD=out.gn/Release

_export_py2()
{
  export PATH=${srcdir}/bin:`pwd`/depot_tools:"$PATH"
  msg2 "Using: `which python`"
}

prepare()
{
  export CC=/usr/bin/clang
  export CXX=/usr/bin/clang++
  
  # Switching to python2 system environment
  mkdir -p bin
  ln -sf /usr/bin/python2 ./bin/python
  ln -sf /usr/bin/python2-config ./bin/python-config

  _export_py2
  export GYP_GENERATORS=ninja

  if [ ! -d "v8" ]; then
    msg2 "Fetching V8 code"
    yes | fetch v8
  fi

  cd v8

  msg2 "Reset repository"
  git reset --hard

  if [ -f third_party/icu/BUILD.gn.orig ]
  then
    msg2 "Restoring bundled ICU build files for syncing"
    ./build/linux/unbundle/replace_gn_files.py --undo --system-libraries icu
  fi

  msg2 "Syncing, this might take a while..."
  gclient sync -D --revision ${pkgver}

  msg2 "Using system libraries for ICU"
  ./build/linux/unbundle/replace_gn_files.py --system-libraries icu

  msg2 "Applying fix for ICU 67.1"
  patch -p2 < ../v8-icu67.patch

  msg2 "Applying fix for templates"
  patch -p2 < ../template-utils-fix.patch

  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8.pc"
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8_libbase.pc"
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8_libplatform.pc"

  msg2 "Running GN..."
  ../depot_tools/gn gen $OUTFLD \
		    -vv --fail-on-unused-args \
		    --args="clang_base_path=\"$V8_CLANG_PATH\"
    is_clang=$V8_IS_CLANG
    is_component_build=$V8_COMPONENT_BUILD
    is_debug=$V8_DEBUG
    is_official_build=$V8_OFFICIAL_BUILD
    treat_warnings_as_errors=$V8_WARNINGS_AS_ERRORS
    v8_enable_i18n_support=$V8_I18N_SUPPORT
    v8_use_external_startup_data=\"$V8_USE_EXTERNAL_STARTUP_DATA\"
    use_sysroot=$V8_USE_SYSROOT\
    use_custom_libcxx=false\
    linux_use_bundled_binutils=false"
}

build()
{
  _export_py2
  cd v8

  # Fixes bug in generate_shim_headers.py that fails to create these dirs
  msg2 "Adding icu missing folders"
  mkdir -p "$OUTFLD/gen/shim_headers/icuuc_shim/third_party/icu/source/common/unicode/"
  mkdir -p "$OUTFLD/gen/shim_headers/icui18n_shim/third_party/icu/source/i18n/unicode/"

  msg2 "Building, this will take a while..."
  ninja -C $OUTFLD
}

check()
{
  _export_py2
  cd v8
  msg2 "Testing, this will also take a while..."
  tools/run-tests.py --outdir=out.gn \
		     --arch=$V8_ARCH \
		     --mode=Release \
		     --quickcheck --report \
		     debugger mjsunit cctest
}

package()
{
  cd v8

  install -d ${pkgdir}/usr/lib/v8

  install -Dm755 $OUTFLD/cctest ${pkgdir}/usr/lib/v8/cctest
  install -Dm755 $OUTFLD/d8 ${pkgdir}/usr/lib/v8/d8

  #if [ $V8_I18N_SUPPORT == "true" ]
  #then
  #  install -Dm755 $OUTFLD/libicui18n.so ${pkgdir}/usr/lib/libicui18n.so
  #  install -Dm755 $OUTFLD/libicuuc.so ${pkgdir}/usr/lib/libicuuc.so
  #  install -Dm755 $OUTFLD/icudtl.dat ${pkgdir}/usr/lib/icudtl.dat
  #fi
  
  install -Dm755 $OUTFLD/libv8_for_testing.so ${pkgdir}/usr/lib/libv8_for_testing.so
  install -Dm755 $OUTFLD/libv8_libbase.so ${pkgdir}/usr/lib/libv8_libbase.so
  install -Dm755 $OUTFLD/libv8_libplatform.so ${pkgdir}/usr/lib/libv8_libplatform.so
  install -Dm755 $OUTFLD/libv8.so ${pkgdir}/usr/lib/libv8.so
  install -Dm755 $OUTFLD/libchrome_zlib.so ${pkgdir}/usr/lib/libchrome_zlib.so

  install -Dm755 $OUTFLD/natives_blob.bin ${pkgdir}/usr/lib/v8/natives_blob.bin
  install -Dm755 $OUTFLD/snapshot_blob.bin ${pkgdir}/usr/lib/v8/snapshot_blob.bin

  install -Dm755 ${srcdir}/d8 ${pkgdir}/usr/bin/d8

  # V8 has several header files and ideally if it had its own folder in /usr/include
  # But doing it here will break all users. Ideally if they use provided pkgconfig file.
  install -d ${pkgdir}/usr/include
  install -Dm644 include/*.h ${pkgdir}/usr/include

  install -d ${pkgdir}/usr/include/libplatform
  install -Dm644 include/libplatform/*.h ${pkgdir}/usr/include/libplatform

  install -d ${pkgdir}/usr/lib/pkgconfig
  install -m644 $srcdir/v8.pc ${pkgdir}/usr/lib/pkgconfig
  install -m644 $srcdir/v8_libbase.pc ${pkgdir}/usr/lib/pkgconfig
  install -m644 $srcdir/v8_libplatform.pc ${pkgdir}/usr/lib/pkgconfig

  install -d ${pkgdir}/usr/share/licenses/v8
  install -m644 LICENSE* ${pkgdir}/usr/share/licenses/v8
}
