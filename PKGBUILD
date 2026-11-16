# Maintainer: Robin Appelman <robin@icewind.nl> 

_upstream=libsmbclient-php
pkgbase=php-smbclient
pkgname=(php-smbclient php-legacy-smbclient)
_extname=smbclient
pkgver=1.1.2
pkgrel=1
pkgdesc="PHP bindings for libsmbclient."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/eduardok/libsmbclient-php"
license=('BSD')
makedepends=('php' 'php-legacy')
depends=('smbclient')
source=("https://github.com/eduardok/libsmbclient-php/archive/${pkgver}.tar.gz")
b2sums=('65d7eed8053852d2550df5a2ee0d764fb1693f6f5a32d51db81402773d49545bddd4a330b8f7ba5a1d8aa1da24429c94ea2999bf1ab9ddbd3198b9ff4843dcd5')

prepare() {
  mv "${_upstream}-${pkgver}" "$pkgbase-$pkgver"
  echo ";extension=smbclient.so" > "$pkgbase-$pkgver/${_extname}.ini"

  cp -a "$pkgbase-$pkgver" "${pkgname[1]}-$pkgver"

  (
    cd "$pkgbase-$pkgver"
    phpize
  )

  (
    cd "${pkgname[1]}-$pkgver"
    phpize-legacy
  )
}

build() {
  (
    cd "$pkgbase-$pkgver"
    ./configure --prefix=/usr
    make
  )

  (
    cd "${pkgname[1]}-$pkgver"
    ./configure --prefix=/usr
    make
  )
}

package_php-legacy-smbclient() {
  backup=("etc/php-legacy/conf.d/${_extname}.ini")

  cd "${pkgname[1]}-$pkgver"

  make INSTALL_ROOT="${pkgdir}" install
  install -vDm 644 "${_extname}.ini" -t "${pkgdir}/etc/php-legacy/conf.d/"
}

package_php-smbclient() {
  backup=("etc/php/conf.d/${_extname}.ini")

  cd "$pkgbase-$pkgver"

  make INSTALL_ROOT="${pkgdir}" install
  install -vDm 644 "${_extname}.ini" -t "${pkgdir}/etc/php/conf.d/"
}

# vim:set ts=2 sw=2 et:
