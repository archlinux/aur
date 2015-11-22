# Contributor: judd <jvinet@zeroflux.org>
# Contributor: dkaylor <dpkaylor@gmail.com>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=xfsdump
pkgver=3.1.6
pkgrel=1
pkgdesc="Additional XFS filesystem utilities"
arch=(i686 x86_64)
url="http://oss.sgi.com/projects/xfs/"
license=('LGPL')
depends=('xfsprogs>=3.1.0' 'attr>=2.4.43' 'acl>=2.2.47' 'dmapi>=2.2.10')
options=('!makeflags' '!emptydirs' '!libtool')
source=(ftp://oss.sgi.com/projects/xfs/cmd_tars/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('7f78c11ca527477d90e5e62b0778f3ad96f2b71c19173044e9aca9515fff42d0'
            'SKIP')
validpgpkeys=('9893A827C19F7D96164A38FFADE82947F475FA1D') # Dave Chinner <david@fromorbit.com>

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin --bindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DIST_ROOT="${pkgdir}" install

  # hack to merge binaries from /sbin and /usr/sbin into /usr/bin #
  mkdir -p "$pkgdir/usr/bin"
  mv "$pkgdir/sbin"/* "$pkgdir/usr/bin"
  rm -rf "$pkgdir"/{sbin,usr/sbin}

  chown -R root "$pkgdir"
  chgrp -R root "$pkgdir"
}
