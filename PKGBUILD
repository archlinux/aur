# Maintainer: Paul Hentschel (hpmachining)
# Contributor: Marco Pompili <aur (at) mg.odd.red>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Contributor: David Flemström <david.flemstrom@gmail.com>
# Contributor: Jan Marvin Garbuszus <jan.garbuszus@rub.de>

pkgname=v8-6.8
pkgver=6.8.275.32
pkgrel=1
pkgdesc="Fast and modern Javascript engine used in Google Chrome."
arch=('x86_64')
url="https://v8.dev"
license=('BSD')
depends=('icu')
makedepends=('clang' 'clang-tools-extra' 'lld' 'llvm' 'python2' 'python2-colorama' 'python2-pylint' 'python2-lazy-object-proxy' 'python2-singledispatch' 'python2-wrapt' 'ninja' 'git' 'wget')
conflicts=('v8' 'v8-3.14' 'v8-3.15' 'v8-3.20' 'v8-static-gyp' 'v8-static-gyp-5.4')
source=("depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "v8.pc"
        "v8_libbase.pc"
        "v8_libplatform.pc"
        "d8")
sha256sums=('SKIP'
            '3616bcfb15af7cd5a39bc0f223b2a52f15883a4bc8cfcfb291837c7421363d75'
            'efb37bd706e6535abfa20c77bb16597253391619dae275627312d00ee7332fa3'
            'ae23d543f655b4d8449f98828d0aff6858a777429b9ebdd2e23541f89645d4eb'
            '6abb07ab1cf593067d19028f385bd7ee52196fc644e315c388f08294d82ceff0')


#case "$CARCH" in
#  x86_64) V8_ARCH="x64" ;;
#esac

OUTFLD=out.gn/Release

prepare() {

  export CC=/usr/bin/clang
  export CXX=/usr/bin/clang++

  # Switching to python2 system environment
  mkdir -p bin
  ln -sf /usr/bin/python2 ./bin/python
  ln -sf /usr/bin/python2-config ./bin/python-config

  export PATH=${srcdir}/bin:`pwd`/depot_tools:"$PATH"
  export GYP_GENERATORS=ninja

  msg "Using: `which python`"

  if [ ! -d "v8" ]; then
    msg "Fetching V8 code"
    yes | fetch v8
  fi

  cd $srcdir/v8

  msg "Reset repository"
  git reset --hard

  if [ -f third_party/icu/BUILD.gn.orig ]
  then
      msg "Restoring bundled ICU build files for syncing"
      python2 $srcdir/v8/build/linux/unbundle/replace_gn_files.py --undo --system-libraries icu
  fi

  msg "Syncing, this can take a while..."
  $srcdir/depot_tools/gclient sync -D --force --reset
  $srcdir/depot_tools/gclient sync --revision ${pkgver}

  msg "Using system libraries for ICU"
  $srcdir/v8/build/linux/unbundle/replace_gn_files.py --system-libraries icu

  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8.pc"
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8_libbase.pc"
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8_libplatform.pc"
  
  msg "Running GN..."
  $srcdir/depot_tools/gn gen $OUTFLD \
    -vv --fail-on-unused-args \
    --args='clang_base_path="/usr/"
    is_clang=true
    is_asan=false
    clang_use_chrome_plugins=false
    is_component_build=true
    is_debug=false
    is_official_build=false
    treat_warnings_as_errors=false
    v8_enable_i18n_support=true
    v8_use_external_startup_data=false
    use_custom_libcxx=false
    linux_use_bundled_binutils=false
    use_sysroot=false'
}

build() {
  cd $srcdir/v8
  
  # Fixes bug in generate_shim_headers.py that fails to create these dirs
  msg "Adding icu missing folders"
  mkdir -p "$OUTFLD/gen/shim_headers/icuuc_shim/third_party/icu/source/common/unicode/"
  mkdir -p "$OUTFLD/gen/shim_headers/icui18n_shim/third_party/icu/source/i18n/unicode/"

  msg "Building, this will take a while..."
  ninja -C $OUTFLD
}

check() {
  cd $srcdir/v8

  msg "Testing, this will also take a while..."
  tools/run-tests.py --no-presubmit \
                     --outdir=out.gn \
                     --buildbot \
                     --arch=x64 \
                     --mode=Release || true
}

package() {
  cd $srcdir/v8

  install -d ${pkgdir}/usr/lib/v8

  install -Dm755 $OUTFLD/cctest ${pkgdir}/usr/lib/v8/cctest
  install -Dm755 $OUTFLD/d8 ${pkgdir}/usr/lib/v8/d8

  # install -Dm755 $OUTFLD/libv8_for_testing.so ${pkgdir}/usr/lib/libv8_for_testing.so
  install -Dm755 $OUTFLD/libv8_libbase.so ${pkgdir}/usr/lib/libv8_libbase.so
  install -Dm755 $OUTFLD/libv8_libplatform.so ${pkgdir}/usr/lib/libv8_libplatform.so
  install -Dm755 $OUTFLD/libv8.so ${pkgdir}/usr/lib/libv8.so

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

  install -d ${pkgdir}/usr/share/licenses/$pkgname
  install -m644 LICENSE* ${pkgdir}/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
