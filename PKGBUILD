# Maintainer: Marco Pompili <aur (at) emarcs (dot) org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Contributor: David Flemström <david.flemstrom@gmail.com>

pkgname=v8
pkgver=6.0.286.57
pkgrel=1
pkgdesc="Fast and modern Javascript engine used in Google Chrome."
arch=('i686' 'x86_64')
url="https://code.google.com/p/v8/"
license=('BSD')
depends=('readline' 'icu')
makedepends=('clang>=3.8.1' 'clang-tools-extra>=3.8.1' 'python2' 'python2-virtualenv' 'ninja' 'git' 'wget')
conflicts=('v8-3.14' 'v8-3.15' 'v8-3.20' 'v8-static-gyp' 'v8-static-gyp-5.4')
source=("depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "v8.pc"
        "v8_libbase.pc"
        "v8_libplatform.pc"
	"d8"
	"gcc7.patch"
	"ctest.patch")
sha256sums=('SKIP'
            '3616bcfb15af7cd5a39bc0f223b2a52f15883a4bc8cfcfb291837c7421363d75'
            'efb37bd706e6535abfa20c77bb16597253391619dae275627312d00ee7332fa3'
            'ae23d543f655b4d8449f98828d0aff6858a777429b9ebdd2e23541f89645d4eb'
            '6abb07ab1cf593067d19028f385bd7ee52196fc644e315c388f08294d82ceff0'
            '3a67793d1a7a93cec00f2693f11e79749364d2541edfb99d0be3f9c132382d1f'
            '14ee52de490515d23fe14376258921d45c45a4011b5cd3344cde026d8b494774')


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

prepare() {
  msg2 "Creating Python Virtual Environment"
  virtualenv2 -q venv
  msg2 "Activating Python Virtual Environment"
  source venv/bin/activate > /dev/null
  msg2 "Installing dependencies in the Virtual Environment..."
  pip install colorama -q
  pip install pylint -q
  pip install lazy-object-proxy -q
  pip install singledispatch -q
  pip install wrapt -q

  export PATH=`pwd`/depot_tools:"$PATH"
  export GYP_GENERATORS=ninja

  if [ ! -d "v8" ]; then
    msg2 "Fetching V8 code"
    yes | fetch v8
  fi

  cd v8

  if [ -f third_party/icu/BUILD.gn.orig ]
  then
      msg2 "Restoring bundled ICU build files for syncing"
      ./build/linux/unbundle/replace_gn_files.py --undo --system-libraries icu
  fi

  msg2 "Syncing, this can take a while..."
  gclient sync --revision ${pkgver}

  msg2 "Using system libraries for ICU"
  ./build/linux/unbundle/replace_gn_files.py --system-libraries icu

  msg2 "Applying gcc7 compatibility patch"
  patch -p1 -i ${srcdir}/gcc7.patch

  msg "Applying ctest patch"
  patch -p1 -i ${srcdir}/ctest.patch

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
    use_sysroot=$V8_USE_SYSROOT"

  deactivate
}

build() {
  source venv/bin/activate > /dev/null

  cd v8

  # Fixes bug in generate_shim_headers.py that fails to create these dirs
  msg2 "Adding icu missing folders"
  mkdir -p "$OUTFLD/gen/shim_headers/icuuc_shim/third_party/icu/source/common/unicode/"
  mkdir -p "$OUTFLD/gen/shim_headers/icui18n_shim/third_party/icu/source/i18n/unicode/"

  msg2 "Building, this will take a while..."
  ninja -C $OUTFLD

  deactivate
}

check() {
  source venv/bin/activate > /dev/null

  cd v8

  msg2 "Testing, this will take also a while..."
  tools/run-tests.py --no-presubmit \
                     --outdir=out.gn \
                     --buildbot \
                     --arch=$V8_ARCH \
                     --mode=Release

  deactivate
}

package() {
  cd v8

  install -d ${pkgdir}/usr/lib/v8

  install -Dm755 $OUTFLD/d8 ${pkgdir}/usr/lib/v8/d8

  install -Dm755 $OUTFLD/libv8.so ${pkgdir}/usr/lib/libv8.so
  install -Dm755 $OUTFLD/libv8_libbase.so ${pkgdir}/usr/lib/libv8_libbase.so
  install -Dm755 $OUTFLD/libv8_libplatform.so ${pkgdir}/usr/lib/libv8_libplatform.so

  install -Dm755 $OUTFLD/natives_blob.bin ${pkgdir}/usr/lib/v8/natives_blob.bin
  install -Dm755 $OUTFLD/snapshot_blob.bin ${pkgdir}/usr/lib/v8/snapshot_blob.bin

  install -Dm755 ${srcdir}/d8 ${pkgdir}/usr/bin/d8

  # V8 has several header files and ideally if it had its own folder in /usr/include
  # But doing it here will break all users. Ideally if they use provided pkgconfig file.
  install -d ${pkgdir}/usr/include
  install -Dm644 include/*.h ${pkgdir}/usr/include

  install -d ${pkgdir}/usr/lib/pkgconfig
  install -m644 $srcdir/v8.pc ${pkgdir}/usr/lib/pkgconfig
  install -m644 $srcdir/v8_libbase.pc ${pkgdir}/usr/lib/pkgconfig
  install -m644 $srcdir/v8_libplatform.pc ${pkgdir}/usr/lib/pkgconfig

  install -d ${pkgdir}/usr/share/licenses/v8
  install -m644 LICENSE* ${pkgdir}/usr/share/licenses/v8
}
