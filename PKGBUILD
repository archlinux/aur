pkgname=php73-imagick
_name=imagick
pkgver=3.7.0
pkgrel=1
pkgdesc="PHP 7.3 extension to create and modify images using the ImageMagick library"
arch=('x86_64')
url="https://github.com/mkoppanen/imagick"
license=('PHP')
depends=('imagemagick' 'ttf-font' 'php73')
makedepends=('librsvg')
checkdepends=('ttf-dejavu')
backup=("etc/php73/conf.d/20-${_name}.ini")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_name}/${_name}/archive/refs/tags/${pkgver}.tar.gz"
        "20-${_name}.ini")

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
  install -vDm 644 "../20-${_name}.ini" -t "${pkgdir}/etc/php73/conf.d/"
  install -vDm 644 {ChangeLog,CREDITS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 examples/*.php \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
sha256sums=('aa2e311efb7348350c7332876252720af6fb71210d13268de765bc41f51128f9'
            'c8e56247580549cc1a951166c68b70b61697188949a74b45a83bb65ab81b1e16')
