# Maintainer: Robin Appelman <robin@icewind.nl> 

_upstream=libsmbclient-php
pkgbase=php-smbclient
pkgname=(php-smbclient php-legacy-smbclient)
_extname=smbclient
pkgver=1.1.1
pkgrel=1
pkgdesc="PHP bindings for libsmbclient."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/eduardok/libsmbclient-php"
license=('BSD')
makedepends=('php' 'php-legacy')
depends=('smbclient')
source=("https://github.com/eduardok/libsmbclient-php/archive/${pkgver}.tar.gz")
b2sums=('8152ed3c92bdbbcdac59c19f77b203cb2fbaf98767d8137d3bbbc96906bb52c3bbdfacdfb5c32eecc4ccb6e44c9417b8c57e80621bd6e4d15a324f97f461984c')

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
