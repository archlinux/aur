# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Filipe Verri <filipeverri@gmail.com>

pkgname=build2
pkgver=0.16.0
pkgrel=1
pkgdesc="build2 build system"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
options=('!ccache')
makedepends=('wget')
depends=('sqlite3' 'pkgconf')
source=("https://download.build2.org/${pkgver}/build2-toolchain-${pkgver}.tar.xz")

sha256sums=('23793f682a17b1d95c80bbd849244735ed59a3e27361529aa4865d2776ff8adc')

build() {
  cd ${srcdir}/build2-toolchain-${pkgver}

  mkdir -p ${srcdir}/build/usr
  ./build.sh --trust yes --local --system libsqlite3,libpkgconfig --install-dir ${srcdir}/build/usr ${CXX:-g++} $CXXFLAGS

  for f in ${srcdir}/build/usr/lib/pkgconfig/*.pc; do sed -i "s|${srcdir}/build||" ${f}; done
}

package() {
  cd ${srcdir}/build
  cp -av usr ${pkgdir}

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
  mv ${pkgdir}/usr/share/doc/build2/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
