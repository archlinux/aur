# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=php-sdl
_gitname=phpsdl
pkgver=0.9.3.r195.ge189bed
pkgrel=1
pkgdesc="PHP bindings of the SDL library."
url="https://github.com/Ponup/phpsdl"
license=("PHP")
arch=('i686' 'x86_64')
depends=("php>=7" "sdl2")
makedepends=("php>=7" "sdl2")
source=('git://github.com/Ponup/phpsdl')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git log | head -n 1 | cut -d" " -f2 | awk '{print substr($0,0,7)}')"
  )
}

build() {
  cd "${srcdir}/${_gitname}"

  phpize
  ./configure
  make
}

package() {
  cd "${srcdir}/${_gitname}"

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
