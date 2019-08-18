# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Marco Pompili <aur (at) mg.odd.red>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Contributor: David Flemström <david.flemstrom@gmail.com>

pkgname=v8-6.7-static
pkgver=6.7.288.46
pkgrel=2
pkgdesc="Fast and modern Javascript engine used in Google Chrome."
arch=('i686' 'x86_64')
url="https://v8.dev"
license=('BSD')
depends=('readline' 'icu')
makedepends=('python2' 'python2-colorama' 'python2-pylint' 'python2-lazy-object-proxy' 'python2-singledispatch' 'python2-wrapt' 'ninja' 'git' 'wget')
provides=('v8')
conflicts=('v8' 'v8-6.8' 'v8-3.14' 'v8-3.15' 'v8-3.20' 'v8-static-gyp' 'v8-static-gyp-5.4')
options=('staticlibs')
source=("depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "v8.pc"
        "v8_libbase.pc"
        "v8_libplatform.pc"
        "d8"
        "ctest.patch")
sha256sums=('SKIP'
            '3616bcfb15af7cd5a39bc0f223b2a52f15883a4bc8cfcfb291837c7421363d75'
            'efb37bd706e6535abfa20c77bb16597253391619dae275627312d00ee7332fa3'
            'ae23d543f655b4d8449f98828d0aff6858a777429b9ebdd2e23541f89645d4eb'
            '6abb07ab1cf593067d19028f385bd7ee52196fc644e315c388f08294d82ceff0'
            'db2f7e8b37d99a396b488d7657d6febb475371d42ec30fff8ffbb69983a9a09f')

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

prepare() {
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
  find . -type d -name '.git' | while read REPO; do REPO="$(dirname "$REPO")"; git -C "$REPO" reset --hard; done

  if [ -f third_party/icu/BUILD.gn.orig ]
  then
      msg2 "Restoring bundled ICU build files for syncing"
      ./build/linux/unbundle/replace_gn_files.py --undo --system-libraries icu
  fi

  msg2 "Syncing, this can take a while..."
  gclient sync --revision ${pkgver}

  msg2 "Using system libraries for ICU"
  ./build/linux/unbundle/replace_gn_files.py

  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8.pc"
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8_libbase.pc"
  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8_libplatform.pc"

  patch -p1 <"${srcdir}/ctest.patch"
  sed -i 's/"V8_DEPRECATION_WARNINGS"/"V8_DEPRECATION_WARNINGS", "GTEST_HAS_TR1_TUPLE=0"/' build/config/BUILD.gn

  msg2 "Running GN..."
  gn gen $OUTFLD \
    -vv --fail-on-unused-args \
    --args="is_clang=false
        use_gold=false
        is_component_build=false
        is_debug=false
        is_official_build=false
        treat_warnings_as_errors=false
        use_custom_libcxx=false
        v8_monolithic=true
        v8_use_external_startup_data=false
        use_sysroot=false"
}

build() {
  _export_py2
  cd v8

  # Fixes bug in generate_shim_headers.py that fails to create these dirs
  msg2 "Adding icu missing folders"
  mkdir -p "$OUTFLD/gen/shim_headers/icuuc_shim/third_party/icu/source/common/unicode/"
  mkdir -p "$OUTFLD/gen/shim_headers/icui18n_shim/third_party/icu/source/i18n/unicode/"

  msg2 "Building, this will take a while..."
  ninja -C $OUTFLD v8_monolith v8_fuzzer cctest unittests d8 mkgrokdump inspector-test
}

check() {
  _export_py2
  cd v8
  msg2 "Using `which python`"
  msg2 "Testing, this will also take a while..."
  tools/run-tests.py --no-presubmit \
                     --outdir=out.gn \
                     --buildbot \
                     --arch=$V8_ARCH \
                     --mode=Release
}

package() {
  cd v8

  install -d ${pkgdir}/usr/lib/v8

  install -Dm755 $OUTFLD/cctest ${pkgdir}/usr/lib/v8/cctest
  install -Dm755 $OUTFLD/d8 ${pkgdir}/usr/lib/v8/d8

  install -Dm755 $OUTFLD/obj/third_party/icu/libicuuc.a ${pkgdir}/usr/lib/v8/libicuuc.a
  install -Dm755 $OUTFLD/obj/third_party/icu/libicui18n.a ${pkgdir}/usr/lib/v8/libicui18n.a
  install -Dm755 $OUTFLD/icudtl.dat ${pkgdir}/usr/lib/v8/icudtl.dat

  install -Dm755 $OUTFLD/obj/libv8_libbase.a ${pkgdir}/usr/lib/libv8_libbase.a
  install -Dm755 $OUTFLD/obj/libv8_libplatform.a ${pkgdir}/usr/lib/libv8_libplatform.a
  install -Dm755 $OUTFLD/obj/libv8_monolith.a ${pkgdir}/usr/lib/libv8_monolith.a

  install -Dm755 ${srcdir}/d8 ${pkgdir}/usr/bin/d8

  # V8 has several header files and ideally if it had its own folder in /usr/include
  # But doing it here will break all users. Ideally if they use provided pkgconfig file.
  install -d ${pkgdir}/usr/include
  install -Dm644 include/*.h ${pkgdir}/usr/include

  install -d ${pkgdir}/usr/include/libplatform
  install -Dm644 include/libplatform/*.h ${pkgdir}/usr/include/libplatform

  install -d ${pkgdir}/usr/lib/pkgconfig
  install -m644 ${srcdir}/v8.pc ${pkgdir}/usr/lib/pkgconfig
  install -m644 ${srcdir}/v8_libbase.pc ${pkgdir}/usr/lib/pkgconfig
  install -m644 ${srcdir}/v8_libplatform.pc ${pkgdir}/usr/lib/pkgconfig

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE* ${pkgdir}/usr/share/licenses/${pkgname}
}

# vim:set ts=2 sw=2 et:
