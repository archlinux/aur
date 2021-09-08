# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=igbinary
_phpversion=74
pkgname=php${_phpversion}-${_name}
pkgver=3.2.6
pkgrel=1
pkgdesc="A drop in replacement for the standard php serializer (PHP 7.4)"
arch=('x86_64')
url="https://pecl.php.net/package/igbinary"
license=('BSD')
depends=('glibc' "php${_phpversion}")
backup=("etc/php${_phpversion}/conf.d/${_name}.ini")
source=("https://pecl.php.net/get/${_name}-${pkgver}.tgz")
sha512sums=('bb1a87f46b0ba2396a3d21b8cc2165498243a86182dc5814d85053bcac14fb099041ec9a67be975eb636e9fae411d2f2695848f0739ddb385c060d56c2f73f4a')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # disable the extension by default
  sed 's/extension/;extension/g' -i "${_name}.php.ini"
  phpize${_phpversion}
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-igbinary
  make
}

check() {
  cd "$pkgname-$pkgver"
  NO_INTERACTION=1 make -k test
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 "${_name}.php.ini" "${pkgdir}/etc/php${_phpversion}/conf.d/${_name}.ini"
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {CREDITS,NEWS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
