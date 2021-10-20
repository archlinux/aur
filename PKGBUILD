# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Filipe Verri <filipeverri@gmail.com>

pkgname=build2
pkgver=0.14.0
pkgrel=1
pkgdesc="build2 build system"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
makedepends=('wget')
depends=('sqlite3' 'pkgconf')
source=("https://download.build2.org/${pkgver}/build2-toolchain-${pkgver}.tar.xz"
		"build.patch")

sha256sums=('18efc6b2d41498f7516e7a8a5c91023f6182c867d423792398390dd0c004cfdd'
            '8405b849e6dc68830102d9e1ce9e934b6bbb63fee05d3dd000c3ed943e5e3638')

build() {
  cd ${srcdir}/build2-toolchain-${pkgver}

  patch -p0 < ${srcdir}/build.patch

  mkdir -p ${srcdir}/build/usr
  ./build.sh --trust yes --install-dir ${srcdir}/build/usr g++

  for f in ${srcdir}/build/usr/lib/pkgconfig/*.pc; do sed -i "s|${srcdir}/build||" ${f}; done
}

package() {
  cd ${srcdir}/build
  cp -av usr ${pkgdir}

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
  mv ${pkgdir}/usr/share/doc/build2/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
