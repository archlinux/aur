pkgname=vlc-vr-git
pkgver=9.6e5cdae
pkgrel=1
pkgdesc="movie player based on libvlc that can render to the Oculus Rift"
arch=('x86_64')
url="https://github.com/jdtaylor/vlc-vr"
license=('custom')
depends=('vlc')
optdepends=("oculus-udev: Udev rule to make the rift sensors usable to the group \"plugdev\"")
makedepends=('git' 'cmake')
provides=("vlc-vr")
options=()

source=("git+https://github.com/jdtaylor/vlc-vr.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/vlc-vr"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  #rm -rf "$srcdir/build/"*
  cd "$srcdir/vlc-vr"
}

build() {
  #export CXX=clang++
  #export CC=clang

  mkdir -p build
  cd build

  export OVR_ROOT="/usr/include/ovr-$(pkg-config --modversion libovr)"
  export CXXFLAGS="-Ofast -fomit-frame-pointer -march=native" 

  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release  ../vlc-vr
  make

}

package() {
  cd "$srcdir/vlc-vr"
  #make DESTDIR="$pkgdir/" install
  #install -d "$pkgdir/usr/lib"
  install -d "$pkgdir/usr/bin"
  #install -d "$pkgdir/usr/include/"

  install -m 755 "$srcdir/build/vlc-vr" "$pkgdir/usr/bin"
  #cp -ra "$srcdir/openvr/headers"/* "$pkgdir/usr/include/"
  #install "$srcdir/openvr/headers"/* "$pkgdir/usr/include/"
  #install -m 555 "$srcdir/openvr/lib/linux64/libopenvr_api.so" "$pkgdir/usr/lib"
  #install -m 755 "$srcdir/build/samples/hellovr_opengl/hellovr" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
