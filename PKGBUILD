# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Filipe Verri <filipeverri@gmail.com>

pkgname=build2
pkgver=0.15.0
pkgrel=1
pkgdesc="build2 build system"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
options=('!ccache')
makedepends=('wget')
depends=('sqlite3' 'pkgconf')
source=("https://download.build2.org/${pkgver}/build2-toolchain-${pkgver}.tar.xz"
		"build.patch")

sha256sums=('5152f679daeb9627f9710c60ef88de1591c02097146268be2f5aea929d2837c4'
            'fa551d0fa42c622caa147acc42944ea709d6147ce91847bb9bc86be321b09fdf')

build() {
  cd ${srcdir}/build2-toolchain-${pkgver}

  patch -p0 < ${srcdir}/build.patch

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
