# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=php-sdl
pkgver=2.7.0
pkgrel=1
pkgdesc="PHP bindings of the SDL library."
url="https://github.com/Ponup/phpsdl"
license=("PHP")
arch=('i686' 'x86_64' 'aarch64')
depends=("php>=7" "sdl2")
makedepends=("php>=7" "sdl2")
source=("http://pecl.php.net/get/sdl-${pkgver}.tgz")
md5sums=('9f09f48542524972e074c579c750dc37')

build() {
  cd "${srcdir}/sdl-${pkgver}"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/sdl-${pkgver}"

  make INSTALL_ROOT="$pkgdir" install

  mkdir -p $pkgdir/usr/lib/php/modules/
  mkdir -p $pkgdir/usr/share/doc/$pkgname/

  install -Dm744 modules/sdl.so $pkgdir/usr/lib/php/modules/sdl.so

  cp -r examples $pkgdir/usr/share/doc/$pkgname/

  # Add php-sdl shell script to run php sdl applicaitons
  mkdir -p ${pkgdir}/usr/bin
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/php-sdl"
  echo "exec /usr/bin/php -d extension=sdl.so \"\$@\"" >> "${pkgdir}/usr/bin/php-sdl"
  chmod 0755 "${pkgdir}/usr/bin/php-sdl"
}
