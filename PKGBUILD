# Maintainer: David Flemström <david.flemstrom@gmail.com>

pkgname=v8-static-gyp-5.4
pkgver=5.4.420
pkgrel=2
pkgdesc="Fast and modern Javascript engine used in Google Chrome."
arch=('i686' 'x86_64')
url="https://code.google.com/p/v8/"
license=('BSD')
depends=('readline' 'ncurses5-compat-libs')
makedepends=('clang-tools-extra' 'python2' 'python2-virtualenv' 'ninja' 'git')
conflicts=('v8' 'v8-3.14' 'v8-3.15' 'v8-3.20' 'v8-5.2' 'v8-static-gyp')
source=("depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
        "gyp::git+https://chromium.googlesource.com/external/gyp"
        "d8")
sha256sums=('SKIP'
            'SKIP'
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
  export GYP_CHROMIUM_NO_ACTION=0

  if [ ! -d "v8" ]; then
    msg2 "Fetching V8 code"
    yes | fetch v8
  fi

  cd v8

  msg2 "Syncing"
  gclient sync

  git checkout tags/$pkgver
}

build() {
  cd v8

  export GYP_GENERATORS=ninja
  export GYP_CHROMIUM_NO_ACTION=0
  msg2 "Running gyp..."
  gypfiles/gyp_v8 -f ninja -Dv8_target_arch=$V8_ARCH -Dwerror= -Dlinux_use_bundled_gold=0 -Dv8_use_snapshot=1 -Dv8_use_external_startup_data=0 -Dclang=1 -Dhost_clang=1 -Dtest_isolation_mode=noop -Drelease_extra_cflags=-fPIC

  msg2 "Start building..."
  ninja -C out/Release v8 d8

  # Convert thin archives into thick ones
  find out/Release -name '*.a' -type f -exec sh -c 'ar t {} | xargs ar rs {}.new && mv -v {}.new {}' \;
}

check() {
  cd v8

  tools/run-tests.py --no-presubmit \
                     --outdir=out \
                     --buildbot \
                     --arch=$V8_ARCH \
                     --mode=Release # --progress=dots
}

package() {
  cd v8

  install -d $pkgdir/usr/lib/v8

  install -Dm755 out/Release/d8 $pkgdir/usr/bin/d8


  # V8 has several header files and ideally if it had its own folder in /usr/include
  # But doing it here will break all users. Ideally if they use provided pkgconfig file.
  install -d $pkgdir/usr/include
  install -Dm644 include/*.h $pkgdir/usr/include
  install -d $pkgdir/usr/include/libplatform
  install -Dm644 include/libplatform/*.h $pkgdir/usr/include/libplatform

  install -d $pkgdir/usr/lib/v8
  install -Dm644 $srcdir/v8/out/Release/obj/third_party/icu/*.a $pkgdir/usr/lib/v8
  install -Dm644 $srcdir/v8/out/Release/obj/src/*.a $pkgdir/usr/lib/v8

  install -d $pkgdir/usr/share/licenses/v8
  install -m644 LICENSE* $pkgdir/usr/share/licenses/v8
}
