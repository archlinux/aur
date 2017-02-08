# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=php-opengl
_gitname=phpopengl
pkgver=r38.da1a87b
pkgrel=1
pkgdesc="PHP bindings of the OpenGL and GLUT libraries."
url="https://github.com/Ponup/phpopengl"
license=("PHP")
arch=('i686' 'x86_64')
depends=("php>=7" "freeglut" "mesa")
makedepends=("php>=7" "composer")
source=('git://github.com/Ponup/phpopengl')
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

  cd "${srcdir}/${_gitname}/examples"

  composer install
}

package() {
  cd "${srcdir}/${_gitname}"

  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -Dm744 modules/opengl.so $pkgdir/usr/lib/php/modules/opengl.so

  cp -r examples $pkgdir/usr/share/doc/$pkgname/

  # Add php-gl shell script to run php opengl applicaitons
  mkdir -p ${pkgdir}/usr/bin
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/php-gl"
  echo "exec /usr/bin/php -d extension=opengl.so \"\$@\"" >> "${pkgdir}/usr/bin/php-gl"
  chmod 0755 "${pkgdir}/usr/bin/php-gl"
}
