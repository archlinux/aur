# Maintainer: Katoitalia

pkgname=obs-plugin-tuna-git
pkgver=1.5.3
pkgrel=1
arch=(x86_64)
pkgdesc="Song information plugin for obs-studio git version"
url="https://github.com/univrsal/tuna"
license=('GPL2')
depends=("obs-studio")
makedepends=("clang" "cmake" "git")
conflicts=("obs-plugin-tuna-bin")
provides=("obs-plugin-tuna-git=$pkgver")
source=("$pkgname::git+https://github.com/univrsal/tuna.git"
        "git+https://github.com/taglib/taglib"
        "git+https://github.com/MusicPlayerDaemon/libmpdclient")
md5sums=("SKIP" "SKIP" "SKIP")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  git config submodule.deps/taglib.url $srcdir/taglib
  git config submodule.deps/libmpdclient.url $srcdir/libmpdclient
  git submodule update
}

build() {
  cd $pkgname

  mkdir -p build; cd build

  cmake \
     -DCMAKE_INSTALL_PREFIX="$srcdir"/tuna/install ..

  make -j$(($(nproc)+1))
  make install
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/obs-plugins/
  mv $srcdir/tuna/install/tuna/bin/64bit/tuna.so $pkgdir/usr/lib/obs-plugins/
  mkdir -p $pkgdir/usr/share/obs/obs-plugins/
  mv $srcdir/tuna/install/tuna/data $pkgdir/usr/share/obs/obs-plugins/tuna
}
