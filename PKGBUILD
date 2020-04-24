# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=php-sdl
pkgver=2.3.0
pkgrel=1
pkgdesc="PHP bindings of the SDL library."
url="https://github.com/Ponup/phpsdl"
license=("PHP")
arch=('i686' 'x86_64')
depends=("php>=7" "sdl2")
makedepends=("php>=7" "sdl2")
source=("https://github.com/Ponup/php-sdl/archive/${pkgver}.tar.gz")
md5sums=('8fe998d6333277f499e8c85387826113')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -Dm744 modules/sdl.so $pkgdir/usr/lib/php/modules/sdl.so

  cp -r examples $pkgdir/usr/share/doc/$pkgname/

  # Add php-sdl shell script to run php sdl applicaitons
  mkdir -p ${pkgdir}/usr/bin
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/php-sdl"
  echo "exec /usr/bin/php -d extension=sdl.so \"\$@\"" >> "${pkgdir}/usr/bin/php-sdl"
  chmod 0755 "${pkgdir}/usr/bin/php-sdl"
}
