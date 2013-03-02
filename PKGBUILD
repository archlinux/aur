# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=antievilmaid-trustedgrub
_pkgname=TrustedGRUB
pkgver=1.1.5
pkgrel=1
pkgdesc="TrustedGRUB for Anti Evil Maid."
arch=('i686' 'x86_64')
url="http://trustedgrub.sf.net"
license=('GPL')
makedepends=('gcc-multilib')
optdepends=("antievilmaid: Anti Evil Maid installation script")
source=("http://sourceforge.net/projects/trustedgrub/files/$_pkgname-$pkgver.tar.gz"
        'grub-0.97-ldflags-objcopy-remove-build-id.patch'
        'automake-pkglib.patch')
sha256sums=('8241a0add393d09ef69f3f616a638b6489f1330d923b3ce1603b749a813d7115'
            'cbc5caad39811346e901769759d1ee8c6cb06fabf552265b2c7d4c8bfa9a5426'
            'b9146229d3a62fbabbf035f8ebf9fb152e90cd419ca68ed7719981d252efad0a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  tar -xpzf "$_pkgname-$pkgver.src.tar.gz"
  cd "$_pkgname-$pkgver"

  patch -Np1 -i ../../grub-0.97-ldflags-objcopy-remove-build-id.patch
  patch -Np1 -i ../../automake-pkglib.patch

  sed -e'/^AC_PROG_CC/ a\AM_PROG_CC_C_O\ ' -i configure.ac
  sed -e'/^AC_PROG_CC/ a\AM_PROG_AS\ ' -i configure.ac

  aclocal
  autoconf
  autoreconf
  automake

  CFLAGS="-static -fno-strict-aliasing" ./configure --prefix=/usr \
    --bindir=/bin --sbindir=/sbin --mandir=/usr/share/man \
    --infodir=/usr/share/info

  gcc util/create_sha1.c -o util/create_sha1
  gcc util/verify_pcr.c -o util/verify_pcr
  CFLAGS= make
  chmod g+w * -R
  chmod a+x util/grub-install
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/$_pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/antievilmaid/trustedgrub"
  install -m0644 stage1/stage1 "$pkgdir/usr/lib/antievilmaid/trustedgrub/"
  install -m0644 stage2/stage2 "$pkgdir/usr/lib/antievilmaid/trustedgrub/"
  install -m0755 grub/grub "$pkgdir/usr/lib/antievilmaid/trustedgrub/"
}

# vim:set ts=2 sw=2 et:
