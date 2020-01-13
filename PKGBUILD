# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='phantom'
pkgver=r22.63981f1
pkgrel=2
pkgdesc='Scalable I/O engine'
arch=('i686' 'x86_64')
url="https://github.com/yandex-load/${pkgname}"
license=('LGPL2.1')
depends=('openssl')
makedepends=('git' 'gcc' 'binutils' 'openssl')
source=("${pkgname}::git+${url}.git"
	"${pkgname}_gcc8_gcc9.patch")
sha256sums=('SKIP'
            '26fb0233cabc93cfdbbac4c479d4621edde5008b18c5a590ab82d2e9867512b8')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 -i "${srcdir}/${pkgname}_gcc8_gcc9.patch"
}

build(){
  cd "${srcdir}/${pkgname}"
  make -R all
}

package(){
  pushd "${srcdir}/${pkgname}"
  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  install -Dm775 "bin/${pkgname}" "${pkgdir}/usr/bin"
  install -Dm644 "lib/${pkgname}/"*.so "${pkgdir}/usr/lib/${pkgname}"
  popd
}
