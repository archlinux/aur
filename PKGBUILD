# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: François Charette <francois.archlinux.org>
# Contributor: Damir Perisa <damir.archlinux.org>
# Contributor: Björn Martensen <bjoern.martensen@gmail.com>

pkgname=thinkfinger
pkgver=0.3
pkgrel=9
pkgdesc="A driver for the SGS Thomson Microelectronics fingerprint reader found in most IBM/Lenovo ThinkPads"
url="http://thinkfinger.sourceforge.net/"
arch=('x86_64')
license=("GPL")
depends=('pam' 'libusb-compat')
options=('emptydirs')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        'thinkfinger-uinput-hack.patch'
        'gcc46.patch')
md5sums=('588565233bcbea5ff0a7f5314361c380'
         '71dc334282d19e6db4f6254542ba563c'
         '93c80f342329a5bd40f5f324fe670225')

build() {
  cd $pkgname-$pkgver

  # Patch from Ubuntu: see http://bugs.archlinux.org/task/12580
  patch -p0 -i "${srcdir}"/thinkfinger-uinput-hack.patch

  patch -p1 -i "${srcdir}"/gcc46.patch

  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --with-birdir=/etc/pam_thinkfinger
  make
}

package() {
  cd $pkgname-$pkgver

  # create dir to store fingerprints
  install -d $pkgdir/etc/pam_thinkfinger
  
  make DESTDIR=$pkgdir install
}
