# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Based on php80-igbinary maintained by Timo Sarawinski <timo@it-kraut.net>

_name=igbinary
pkgname=php82-igbinary
pkgver=3.2.16
pkgrel=1
pkgdesc="A drop in replacement for the standard php serializer (PHP 8.2)"
arch=('x86_64')
url="https://github.com/igbinary/igbinary"
license=('BSD')
depends=('glibc')
makedepends=('php82')
backup=("etc/php82/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('d4599ee18e2202a56e955b37153e1e7d4d303aadc26f1f152cb64029e03f79760162a422793e319861b95a801a2fb18261216c080c2d400dd94d34e951e53cca')
b2sums=('5a4d654f8672c199d7e5cf662975d127de66835298fe286f806ad721d4bc1652eb542353402bb56822ca4c33ab26e3d9ca9ed91f2ad42d817b1ab996234ad726')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # disable the extension by default
  sed 's/extension/;extension/g' -i "${_name}.php.ini"
  phpize82
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-igbinary
  make
}

check() {
  cd "$pkgname-$pkgver"
  export TEST_PHPDBG_EXECUTABLE=/usr/bin/phpdbg82
  NO_INTERACTION=1 make -k test
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 "${_name}.php.ini" "${pkgdir}/etc/php82/conf.d/${_name}.ini"
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {CREDITS,NEWS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
