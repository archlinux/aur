# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Timo Sarawinski <timo@it-kraut.net>

pkgname=php74-imagick
app_name=imagick
ini_name="30-${app_name}.ini"
pkgver=3.7.0
pkgrel=3
pkgdesc="PHP 7.4 extension to create and modify images using the ImageMagick library"
url="https://pecl.php.net/package/imagick"
arch=('x86_64')
license=('PHP')
depends=('php74' 'imagemagick' 'ttf-font')
checkdepends=('librsvg' 'ttf-dejavu')
backup=("etc/php74/conf.d/30-$app_name.ini")
source=("https://pecl.php.net/get/imagick-$pkgver.tgz")
sha512sums=('c84408e4e4a0c46d979240e06d58d264c6bb21f3b95e3d434c8a21cd808f6c495fd453ef9c07b5c44dac81c6f205b6697f8ecaf1a65a86ce4e9052328a389ebe')

prepare() {
  cd "$srcdir/$app_name-$pkgver"
  echo ";extension=$app_name" > $ini_name
  phpize74
}

build() {
  cd "$app_name-$pkgver"
  ./configure --prefix=/usr --with-php-config=/usr/bin/php-config74
  make
}

check() {
  cd "$app_name-$pkgver"
  export NO_INTERACTION="true"
  export TEST_PHPDBG_EXECUTABLE="/usr/bin/phpdbg74"
  make -k test
}

package() {
  cd "$app_name-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 ${ini_name} -t "$pkgdir/etc/php74/conf.d/"
  install -vDm 644 {ChangeLog,CREDITS,LICENSE} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 examples/*.php -t "$pkgdir/usr/share/doc/$pkgname/examples"
}
