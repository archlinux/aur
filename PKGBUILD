# Maintainer: Que Quotion <quequotion@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-weather-git
pkgver=r14.0cbe7a0
pkgrel=1
pkgdesc='Weather indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/kunalkushwaha/wingpanel-indicator-weather'
license=('GPL2')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'granite' 'libsoup' 'json-glib'
         'libwingpanel-2.0.so')
makedepends=('git' 'granite' 'cmake' 'vala' 'libwingpanel-2.0.so')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/kunalkushwaha/${pkgname%-git}.git"
        "fix-config-file.patch")
sha256sums=('SKIP'
            '8c818bfc42f4dbd09a70aef90a54e71933438ee9cb3f08797608d48b54a95806')

pkgver() {
  cd "${pkgname%-git}"

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

  patch -Np1 < ../fix-config-file.patch

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd "${pkgname%-git}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        ../
  make
}

package() {
  cd "${pkgname%-git}/build"

  DESTDIR="${pkgdir}" make install
  install -Dm644 ../.weather-map.dat "${pkgdir}/etc/weather-map.conf"
}
