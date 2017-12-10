# Contributor: judd <jvinet@zeroflux.org>
# Contributor: dkaylor <dpkaylor@gmail.com>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=xfsdump
pkgver=3.1.8
pkgrel=1
pkgdesc="Additional XFS filesystem utilities"
arch=(i686 x86_64)
url="http://oss.sgi.com/projects/xfs/"
license=('LGPL')
depends=('xfsprogs>=3.1.0' 'attr>=2.4.43' 'acl>=2.2.47' 'dmapi>=2.2.10')
options=('!makeflags' '!emptydirs' '!libtool')
source=(https://git.kernel.org/pub/scm/fs/xfs/${pkgname}-dev.git/snapshot/${pkgname}-dev-${pkgver}.tar.gz)
md5sums=('9059a9c510959aa848f66f6e98814438')


build() {
  cd "${srcdir}/${pkgname}-dev-${pkgver}"

  make PREFIX=/usr SBINDIR=/usr/bin BINDIR=/usr/bin
}

package() {
  cd "${srcdir}/${pkgname}-dev-${pkgver}"
  make DIST_ROOT="${pkgdir}" install

  # hack to merge binaries from /sbin and /usr/sbin into /usr/bin #
  mkdir -p "$pkgdir/usr/bin"
  mv "$pkgdir/sbin"/* "$pkgdir/usr/bin"
  rm -rf "$pkgdir"/{sbin,usr/sbin}

  chown -R root "$pkgdir"
  chgrp -R root "$pkgdir"
}
