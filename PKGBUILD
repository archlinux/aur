# Mantainer maz-1 < ohmygod19993 at gmail dot com >
pkgname=kcm-imchooser-frameworks
pkgver=0.1
pkgrel=1
pkgdesc="A input method starter and configure tool. It can help you set annoying system environment variable. Unofficial KF5 port."
arch=('i686' 'x86_64')
url='http://kde-apps.org/content/show.php/kcm+imchooser?content=146776'
license=('GPL')
provides=kcm-imchooser
conflicts=kcm-imchooser
install=kcm-imchooser.install
depends=('qt5-base'
         'kio' 'kdelibs4support')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
source=("http://kde-apps.org/CONTENT/content-files/146776-kcm_imchooser-${pkgver}.tar.bz2"
        "port_to_kf5.patch"
        "imchooser-helper.sh"
        "imchooser-helper.service")
groups=('plasma')
md5sums=('3015a7e5fb2e28bcf9bb413d6c004ab0'
         'SKIP'
         'SKIP'
         'SKIP')


prepare() {
  rm -rf build
  mkdir -p build
  cd kcm_imchooser-$pkgver
  patch -p1 -i "$srcdir/port_to_kf5.patch"
}

build() {
  cd build
  cmake ../kcm_imchooser-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/imchooser-helper.sh" "$pkgdir/usr/share/imchooser/imchooser-helper"
  install -Dm755 "$srcdir/imchooser-helper.service" "$pkgdir/usr/lib/systemd/system/imchooser-helper.service"
}
