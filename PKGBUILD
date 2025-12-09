# Maintainer: John Karpn <johnkarpn@gmail.com>

_name=imagick
pkgname=php84-imagick
pkgver=3.8.1
pkgrel=1
pkgdesc="PHP extension to create and modify images using the ImageMagick library"
arch=(x86_64)
url="https://github.com/imagick/imagick"
license=(
  0BSD
  PHP-3.01
)
depends=(
  gcc-libs
  glibc
  imagemagick
  ttf-font
)
makedepends=(
  librsvg
  php84
)
checkdepends=(ttf-dejavu)
optdepends=(
  'librsvg: for SVG support'
)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/$_name/$_name/archive/refs/tags/$pkgver.tar.gz
  $_name.ini
)
sha512sums=('b584394ce2c785a206211454208d23f5675e05162ccf76dacd267a1e4f6e8cb8d373dd3f660c42da5b399df4e89256be7d08465c3aa8d8666207fe61e0fadfd5'
            '4b22a3a3b425632b7012c34e171315b1bf5310fd0ed411eeda59e7224266698890ac2d5e6af536542acbfa31408446e3eb6539b004b2ba1b4ea9387102097ffc')
b2sums=('6d949f7198e0213d2812f8e1464576ea434e5bbd1044a9d3f96076e4cfc2779bcba48108d95b786b4de9e0168cb99424d9f133505f01d9376dd1cc69b2a7b342'
        'c0f81a5936249902d94ae7535f70f5e60c30d18f91ef67ee36d46f84914d7400ed8d0f54d086a824e9fc07df2de71315f4d2e8cff7a27c654e3902ed9cd455c6')

prepare() {
  mv -v "$_name-$pkgver" "$pkgname-$pkgver"

  # setting package version: https://bugs.archlinux.org/task/64185
  sed -e "s/@PACKAGE_VERSION@/$pkgver/" -i $pkgname-$pkgver/php_imagick.h $pkgname-$pkgver/package.xml

  # remove broken tests
  local broken_tests=(
    "$pkgname-$pkgver/tests/013-read-filehandle-memory-stream.phpt"
    "$pkgname-$pkgver/tests/024-ispixelsimilar.phpt"
    "$pkgname-$pkgver/tests/151_Imagick_subImageMatch_basic.phpt"
    "$pkgname-$pkgver/tests/268_ImagickDraw_getDensity_basic.phpt"
    "$pkgname-$pkgver/tests/287_Imagick_GetImageChannelRange_basic.phpt"
    "$pkgname-$pkgver/tests/316_Imagick_getImageKurtosis.phpt"
    "$pkgname-$pkgver/tests/bug_73840.phpt"
  )
  printf 'Remove broken tests\n'
  rm -v "${broken_tests[@]}"

  (
    cd $pkgname-$pkgver
    phpize84
  )
}

build() {
  (
    cd $pkgname-$pkgver
    ./configure --prefix=/usr --with-php-config=/usr/bin/php-config84
    make
  )
}

check() {
  export NO_INTERACTION=true
  make -k test -C $pkgname-$pkgver
}

package() {
  depends+=(php84)
  backup=(etc/php84/conf.d/$_name.ini)

  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 ../$_name.ini -t "$pkgdir/etc/php84/conf.d/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {ChangeLog,CREDITS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 examples/*.php -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
