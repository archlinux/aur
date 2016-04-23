# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Maintainer: Marco Pompili <marcs.pompili@gmail.com>

pkgname=v8
pkgver=5.1.110.1
pkgrel=2
pkgdesc="Fast and modern Javascript engine used in Google Chrome."
arch=("i686" "x86_64")
url="https://code.google.com/p/v8/"
license=("BSD")
depends=("readline" "icu" "libtinfo-5")
makedepends=("clang-tools-extra" "python2" "python2-virtualenv" "ninja" "git")
source=("depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "gyp::git+https://chromium.googlesource.com/external/gyp"
        "v8.pc"
        "d8")
sha256sums=('SKIP'
            'SKIP'
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
  pip install gyp/ -q
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

  git checkout tags/$pkgver

  sed "s/@VERSION@/$pkgver/g" -i "$srcdir/v8.pc"
}

build() {
  cd v8

  build/gyp_v8 -Dv8_enable_i18n_support=1 \
  -Duse_system_icu=1 -Dconsole=readline \
  -Dcomponent=shared_library -Dv8_target_arch=$V8_ARCH -Dwerror= -f ninja \
  -Dlinux_use_bundled_gold=0

  ninja -C out/Release all # or target 'v8 d8' if you do not need tests
}

check() {
  cd v8

  tools/run-tests.py --no-presubmit --outdir=out --buildbot --arch=$V8_ARCH --mode=Release # --progress=dots
}

package() {
  cd v8

  install -d $pkgdir/usr/lib/v8

  install -Dm755 out/Release/d8 $pkgdir/usr/lib/v8/d8
  install -Dm644 out/Release/natives_blob.bin $pkgdir/usr/lib/v8/natives_blob.bin
  install -Dm644 out/Release/snapshot_blob.bin $pkgdir/usr/lib/v8/snapshot_blob.bin
  install -Dm755 out/Release/lib/libv8.so $pkgdir/usr/lib/v8/libv8.so
  ln -s v8/libv8.so $pkgdir/usr/lib/libv8.so
  install -Dm755 $srcdir/d8 $pkgdir/usr/bin/d8


  # V8 has several header files and ideally if it had its own folder in /usr/include
  # But doing it here will break all users. Ideally if they use provided pkgconfig file.
  install -d $pkgdir/usr/include
  install -Dm644 include/*.h $pkgdir/usr/include

  install -d $pkgdir/usr/lib/pkgconfig
  install -m644 $srcdir/v8.pc $pkgdir/usr/lib/pkgconfig

  install -d $pkgdir/usr/share/licenses/v8
  install -m644 LICENSE* $pkgdir/usr/share/licenses/v8
}
