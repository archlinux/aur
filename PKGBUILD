# Contributor: judd <jvinet@zeroflux.org>
# Maintainer: dkaylor <dpkaylor@gmail.com>

pkgname=xfsdump
pkgver=3.1.4
pkgrel=2
pkgdesc="Additional XFS filesystem utilities"
arch=(i686 x86_64)
url="http://oss.sgi.com/projects/xfs/"
license=('LGPL')
depends=('xfsprogs>=3.1.0' 'attr>=2.4.43' 'acl>=2.2.47' 'dmapi>=2.2.10')
options=('!makeflags' '!emptydirs' '!libtool')
source=(ftp://oss.sgi.com/projects/xfs/cmd_tars/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('570eafd0721515bdd79cb0e295b701d49cdf81e71a0a0ff0df6d4c5cc1960943'
            'SKIP')
validpgpkeys=('9893A827C19F7D96164A38FFADE82947F475FA1D') # Dave Chinner <david@fromorbit.com>

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DIST_ROOT="${pkgdir}" install

  # hack to merge binaries from /sbin and /usr/sbin into /usr/bin #
  mkdir -p $pkgdir/usr/bin
  mv $pkgdir/{sbin/*,usr/sbin/xfsinvutil} $pkgdir/usr/bin
  rm -rf $pkgdir/{sbin,usr/sbin}

  chown -R root $pkgdir
  chgrp -R root $pkgdir
}
