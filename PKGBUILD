pkgname=kwinft
pkgver=5.22.0
_pkgver=5.22.0
pkgrel=2
pkgdesc='Wayland compositor and X11 window manager'
arch=(x86_64)
url="https://gitlab.com/kwinft/kwinft"
license=(LGPL)
depends=(xcb-util-cursor plasma-framework kcmutils breeze kinit qt5-sensors qt5-script wrapland disman kdisplay kidletime kscreenlocker kdecoration libqaccessibilityclient python)
makedepends=(extra-cmake-modules qt5-tools kdoctools wrapland)
optdepends=('qt5-virtualkeyboard: virtual keyboard support for kwin-wayland')
provides=("kwin=${pkgver}")
conflicts=("kwin")
source=("https://gitlab.com/kwinft/kwinft/-/archive/kwinft@$_pkgver/kwinft-kwinft@$_pkgver.tar.gz"
	libglvnd-fix.patch)
md5sums=('43019486b30618e689f8d48282f8a5da'
         'bc587371a890c710cb348fc45ad5e422')
install=kwinft.install

prepare() {
  tar -xvf kwinft-kwinft@$_pkgver.tar.gz
  mkdir -p "$srcdir"/build/make
  patch --directory="$srcdir/kwinft-kwinft@$_pkgver" --forward --strip=1 --input="${srcdir}/libglvnd-fix.patch"  
}

build() {
  cd "$srcdir"/build
  cmake "$srcdir/kwinft-kwinft@$_pkgver" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}


package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
