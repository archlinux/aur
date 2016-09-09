# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=v8
pkgver=5.5.63.1
pkgrel=1
pkgdesc="Fast and modern Javascript engine used in Google Chrome."
arch=('i686' 'x86_64')
url="https://code.google.com/p/v8/"
license=('BSD')
depends=('readline' 'icu')
makedepends=('clang>=3.8.1' 'clang-tools-extra>=3.8.1' 'python2' 'python2-virtualenv' 'ninja' 'git')
conflicts=('v8-5.2' 'v8-3.14' 'v8-3.15' 'v8-3.20')
source=("depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "v8.pc"
        "d8")
sha256sums=('SKIP'
            '2b054309df9af9fb2e3e14527e88360b44745649b4866e592fb357ac90935f5d'
            'cfd0712ee91d30b62e761da130e194c18f2b92a7f1654fb4af49f96ae9ce3e1b')

case "$CARCH" in
  x86_64) V8_ARCH="x64" ;;
  i686) V8_ARCH="ia32" ;;
esac

prepare() {
  msg2 "Creating Python Virtual Environment"
  virtualenv2 -q venv
  msg2 "Activating Python Virtual Environment"
  source venv/bin/activate > /dev/null
  msg2 "Installing dependencies in the Virtual Environment"
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

  msg2 "Syncing"
  gclient sync
  git checkout tags/${pkgver}

  sed "s/@VERSION@/${pkgver}/g" -i "${srcdir}/v8.pc"
}

OUTFLD=out.gn/Release

build() {
  cd v8

  msg2 "Running GN..."
  ../depot_tools/gn gen $OUTFLD \
		    -vv --fail-on-unused-args \
		    --args='is_debug=false is_clang=false use_sysroot=false clang_base_path="/usr" is_component_build=true v8_enable_i18n_support=true icu_use_data_file=false'
  

  ## Needs to resync after running GN
  msg2 "Resyncing..."
  gclient sync > /dev/null

  msg2 "Building, this will take a while..."
  ninja -C $OUTFLD
}

check() {
  cd v8

  msg2 "Testing, this will take also a while..."
  tools/run-tests.py --no-presubmit \
		     --outdir=out.gn \
		     --buildbot \
		     --arch=$V8_ARCH \
		     --mode=Release
}

package() {
  cd v8

  install -d ${pkgdir}/usr/lib/v8

  #install -Dm644 $srcdir/v8/$OUTFLD/obj/src/*.a $pkgdir/usr/lib/v8
  
  install -Dm755 $OUTFLD/d8 ${pkgdir}/usr/lib/v8/d8
  install -Dm644 $OUTFLD/natives_blob.bin ${pkgdir}/usr/lib/v8/natives_blob.bin
  install -Dm644 $OUTFLD/snapshot_blob.bin ${pkgdir}/usr/lib/v8/snapshot_blob.bin
  
  install -Dm755 $OUTFLD/libicui18n.so ${pkgdir}/usr/lib/v8/libicui18n.so
  install -Dm755 $OUTFLD/libicuuc.so ${pkgdir}/usr/lib/v8/libicuuc.so
  install -Dm755 $OUTFLD/libv8.so ${pkgdir}/usr/lib/v8/libv8.so
  
  ln -s v8/libv8.so ${pkgdir}/usr/libv8.so
  install -Dm755 ${srcdir}/d8 ${pkgdir}/usr/bin/d8

  # V8 has several header files and ideally if it had its own folder in /usr/include
  # But doing it here will break all users. Ideally if they use provided pkgconfig file.
  install -d ${pkgdir}/usr/include
  install -Dm644 include/*.h ${pkgdir}/usr/include

  install -d ${pkgdir}/usr/lib/pkgconfig
  install -m644 $srcdir/v8.pc ${pkgdir}/usr/lib/pkgconfig

  install -d ${pkgdir}/usr/share/licenses/v8
  install -m644 LICENSE* ${pkgdir}/usr/share/licenses/v8
}
