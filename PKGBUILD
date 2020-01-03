# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=php73-imagick
_name=imagick
pkgver=3.4.4
pkgrel=1
pkgdesc="PHP 7.3 extension to create and modify images using the ImageMagick library"
arch=('x86_64')
url="https://github.com/mkoppanen/imagick"
license=('PHP')
depends=('php73' 'imagemagick' 'ttf-dejavu')
checkdepends=('librsvg')
backup=("etc/php73/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkoppanen/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('f3d3c74b4d0bb5c2dd986a8b960096ff200daa82e60fdd1467a54944be06810923b4e68a4f70194e25c8176afd9a609b9f2545054520ec759202e5fc3f1e827b')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # setting package version: https://bugs.archlinux.org/task/64185
  sed -e "s/@PACKAGE_VERSION@/${pkgver}/" \
      -i php_imagick.h package.xml
  echo ";extension=${_name}" > "${_name}.ini"
  phpize73
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  export NO_INTERACTION="true"
  make -k test
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 "${_name}.ini" -t "${pkgdir}/etc/php73/conf.d/"
  install -vDm 644 {ChangeLog,CREDITS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 examples/*.php \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
