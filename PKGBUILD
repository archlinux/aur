# Maintainer: Stefan Biereigel <stefan at biereigel dot de>
pkgname=aprx-git
pkgver=v2.9.0.r28.g13c6e79
pkgrel=1
pkgdesc="A multitalented APRS i-gate / digipeater"
arch=('any')
url="http://thelifeofkenneth.com/aprx/"
license=('custom')
depends=('glibc')
provides=('aprx')
conflicts=('aprx')
backup=('etc/aprx.conf')
source=('aprx::git+https://github.com/PhirePhly/aprx.git'
        'aprx.service')
sha256sums=('SKIP'
            'ef586aa9c5f7dfc70e6631e60648764738923ccb1374732f7ae356d4789e69c5')
sha512sums=('SKIP'
            'e9a6d4ce894c692e2a959ae5a7644b1a18c7d2df550d44a3cba3bff484400262bc9da5f12b06b406ccc64094b242d6783a887eacd633a59b68d8519a299e0b6b')

pkgver() {
  cd aprx
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd aprx
  ./configure --prefix=/usr -mandir=/usr/share/man #--with-embedded 
  make CFLAGS="-fcommon -O2 -DERLANGSTORAGE"
}

package() {
  cd aprx
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="$pkgdir/" install
  cp ${srcdir}/aprx.service ${pkgdir}/usr/lib/systemd/system
  mkdir -p "${pkgdir}/usr/bin"
  mv ${pkgdir}/sbin/* ${pkgdir}/usr/bin
  rmdir ${pkgdir}/sbin
}

