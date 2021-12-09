# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=php73-imagick
_name=imagick
pkgver=3.5.1
pkgrel=1
pkgdesc="PHP 7.3 extension to create and modify images using the ImageMagick library"
arch=('x86_64')
url="https://github.com/mkoppanen/imagick"
license=('PHP')
depends=('imagemagick' 'ttf-font' 'php73')
makedepends=('librsvg')
checkdepends=('ttf-dejavu')
backup=("etc/php73/conf.d/${_name}.ini")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_name}/${_name}/archive/refs/tags/${pkgver}.tar.gz"
        "${_name}.ini")
sha512sums=('8ef4b4a253deb80909c34ae87ba7783a295e93c5033f95ecae56e6ebf7ef7be8deb8e1bfecfa9f3dcb9ba26ee95ef49a0d69418af96fd7cd01d5316f63bdc2cd'
            '1463505bd6b2572e21f6bbc242c2e0bf8b881b839ac38e38c230f09b4bf4c4698cafba1a026da8f615ee2b2980ab74dc68284afd70bb732db6fb70b5efba2bfc')
b2sums=('d2ad6d3e1568d5769d2b3ba8f77af2e7d82b04bb65535b9901846602b8dcee3954a8451ffd5c2c86590f35dc209eb9301e8ea75a28ddf7c989cf41a104f04656'
        '291d68f50a2c173b857c0f132e1874f0682da3c7176f67b946a19a68256ab19f56a234bafa16711c3f8ef26c4bc7df04ea8afdecbcb984820b9bf3fd2a135edb')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  # setting package version: https://bugs.archlinux.org/task/64185
  sed -e "s/@PACKAGE_VERSION@/${pkgver}/" \
      -i "php_imagick.h" "package.xml"

  phpize73
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  export NO_INTERACTION="true"
  make -k test
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 "../${_name}.ini" -t "${pkgdir}/etc/php73/conf.d/"
  install -vDm 644 {ChangeLog,CREDITS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 examples/*.php \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
