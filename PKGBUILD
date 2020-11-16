# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=igbinary
pkgname=php73-igbinary
pkgver=3.1.4
pkgrel=1
pkgdesc="A drop in replacement for the standard php serializer (PHP 7.3)"
arch=('x86_64')
url="https://github.com/igbinary/igbinary"
license=('BSD')
depends=('glibc' 'php73')
backup=("etc/php73/conf.d/${_name}.ini")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_name}/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('a46f822ee77877705485c58ba5286b9b74889d51509f90d46c5d4ece82f12a15e0e7b84cdb4ddcd1b5ba2cd8177fe899232f42c82f31dbb2fbef7e3388579c3d')
b2sums=('7bdab344c4cc90a1b2e1040be20af8e8d756f63515d7ddb20f5fe56cbc5bdfe19db177c07e36ffbb8a101cedb55c175d47e8ede8bcc384b7c6c8ef7c52d3ccfc')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # disable the extension by default
  sed 's/extension/;extension/g' -i "${_name}.php.ini"
  phpize73
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
  install -vDm 644 "${_name}.php.ini" "${pkgdir}/etc/php73/conf.d/${_name}.ini"
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {CREDITS,NEWS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
