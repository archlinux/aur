_phpbase=83
pkgname=php83-imagick
_name=imagick
_prio=20
pkgver=3.8.1
pkgrel=1
pkgdesc="PHP 8.3 extension to create and modify images using the ImageMagick library"
arch=('x86_64')
url="https://github.com/imagick/imagick"
license=('PHP')
depends=('imagemagick' 'ttf-font')
makedepends=("php${_phpbase}" 'librsvg')
checkdepends=('ttf-dejavu')
backup=("etc/php${_phpbase}/conf.d/${_prio}-${_name}.ini")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/${_name}/${_name}/archive/refs/tags/${pkgver}.tar.gz"
  "${_prio}-${_name}.ini"
)
sha512sums=('b584394ce2c785a206211454208d23f5675e05162ccf76dacd267a1e4f6e8cb8d373dd3f660c42da5b399df4e89256be7d08465c3aa8d8666207fe61e0fadfd5'
            '4b22a3a3b425632b7012c34e171315b1bf5310fd0ed411eeda59e7224266698890ac2d5e6af536542acbfa31408446e3eb6539b004b2ba1b4ea9387102097ffc')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
  # setting package version: https://bugs.archlinux.org/task/64185
  sed -e "s/@PACKAGE_VERSION@/${pkgver}/" \
      -i "${pkgname}-${pkgver}/php_imagick.h" "${pkgname}-${pkgver}/package.xml"
  cd "$pkgname-${pkgver}"
  rm tests/bug_73840.phpt
  rm tests/316_Imagick_getImageKurtosis.phpt
  phpize${_phpbase}
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
  install -vDm 644 "../${_prio}-${_name}.ini" -t "${pkgdir}/etc/php${_phpbase}/conf.d/"
  install -vDm 644 {ChangeLog,CREDITS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 examples/*.php -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
