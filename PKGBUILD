# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jason Pierce <pierce.json@gmail.com>
# Contributor: Jeremy Cowgar <jeremy@cowgar.com>
# Contributor: Simon Perry <aur@sanxion.net>

_pkgbase=dropbear
pkgname=dropbear-dnat
pkgver=2024.86
pkgrel=1
pkgdesc='Lightweight SSH server'
arch=(x86_64)
url='https://github.com/mkj/dropbear'
license=(MIT)
options=(emptydirs)
makedepends=(git)
validpgpkeys=('F7347EF2EE2E07A267628CA944931494F29C6773')
source=("git+$url#tag=DROPBEAR_$pkgver"
        dropbear.service
        localoptions.h)
b2sums=('eab60b3eb54ef8178e96079995fb1d42429a8d3fe583c93644b7115e7ae74c3703dbc230b31dd55755791990e7a9611bf07bdb8a907ad76385e5d391c7abfc8e'
        'e3481447cac72e416a1d332ddb4bc2fbc78b2e558f929449469e05c269e27482e13357d467b8a11c9b7bf6fdecdd6e57717c8008247922adfc545c36e5775217'
        '49628bbce0d26eb33598de276ede705bd592a38b7892c9db0ceebfb0598a1ee6e7e84ed03dbf255ee1adcad0c5214d38dc03e6c04176a405f59a19765cb28388')

prepare() {
  cp -fv localoptions.h $_pkgbase/localoptions.h
}

build() {
  cd $_pkgbase
  autoreconf
  ./configure --bindir=/usr/bin --prefix=/usr --sbindir=/usr/bin
  patch --ignore-whitespace -p1 < ../../patch-dropbear-DNAT.txt && make PROGRAMS='dbclient dropbear dropbearconvert dropbearkey scp' SCPPROGRESS=1
}

package_dropbear-dnat() {
  depends=(libxcrypt zlib)
  conflicts=(dropbear)
  install -d "$pkgdir/etc/$_pkgbase"
  make -C $_pkgbase install DESTDIR="$pkgdir"
  install -Dm644 $_pkgbase.service "$pkgdir/usr/lib/systemd/system/$_pkgbase.service"
  install -Dm644 $_pkgbase/LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}

package_dropbear-scp() {
  pkgdesc='Lightweight application for copying files over SSH'
  provides=(scp)
  conflicts=(openssh)
  make -C $_pkgbase install PROGRAMS=scp DESTDIR="$pkgdir"
  install -Dm644 $_pkgbase/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rmdir "$pkgdir/usr/share/man/"{man1,}
}

