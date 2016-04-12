pkgname=osvr-steamvr-git
pkgver=v0.1.r92.gaa4b206
pkgrel=1
pkgdesc="Driver for allowing applications written against SteamVR to work with hardware and software running with the OSVR software framework."
arch=(i686 x86_64)
url="https://github.com/OSVR/SteamVR-OSVR"
#license=('GPL')
install=osvr-steamvr.install
makedepends=('git' 'cmake')
depends=('osvr-core-git' 'openvr-git') #TODO: add more deps
source=("osvr-steamvr::git+https://github.com/OSVR/SteamVR-OSVR.git"
    "Findjsoncpp.cmake")

pkgver() {
  cd "$srcdir/osvr-steamvr"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd osvr-steamvr
  find . -name CMakeLists.txt -exec sed -i 's/jsoncpp_lib/jsoncpp/g' {} \;

  mkdir -p "$srcdir/osvr-steamvr-build"
  cp "$srcdir/Findjsoncpp.cmake" "$srcdir/osvr-steamvr/cmake"
}

build() {
  cd osvr-steamvr-build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DCMAKE_BUILD_TYPE=Release ../osvr-steamvr
  make
}

package() {
  cd osvr-steamvr-build
  make DESTDIR="$pkgdir/" install

  # *sigh*
  install -d "$pkgdir/usr/lib/steamvr/"
  mv "$pkgdir/usr/drivers" "$pkgdir/usr/lib/steamvr"
}
md5sums=('SKIP'
         '2dd82e55b6291d32c611dd899d8a8164')

# vim:set ts=2 sw=2 et:
