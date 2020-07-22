# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Filipe Verri <filipeverri@gmail.com>

pkgname=build2
pkgver=0.13.0
pkgrel=1
pkgdesc="build2 build system"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
makedepends=('wget')
depends=('sqlite3' 'pkgconf')
source=("https://download.build2.org/${pkgver}/build2-toolchain-${pkgver}.tar.xz"
		"build.patch")

sha256sums=('bafabcab4d5efdc489af59755a3ba7ce90834b479125cf21c34828857cc91506'
            'd6c3b46e2fd014a6f9771626647c6a9a33ec2c1caefab47d15db129c9c42b66a')

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
