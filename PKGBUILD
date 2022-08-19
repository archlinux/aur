# Maintainer: Jeremy Kescher <jeremy@kescher.at>
# Based on s3backer-git PKGBUILD by: DuckSoft <realducksoft@gmail.com>

pkgname='s3backer-nbd-git'
pkgver=2.0.2.r4.gc657cee
pkgrel=1
pkgdesc="FUSE-based single file backing store via Amazon S3 (with NBD support)"
arch=('x86_64')
provides=('s3backer')
conflicts=('s3backer')
url="https://github.com/archiecobbs/s3backer"
license=('GPL')
depends=('fuse2' 'curl' 'expat' 'openssl' 'zlib' 'nbdkit' 'nbd')
source=("$pkgname::git+https://github.com/archiecobbs/s3backer")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  ./cleanup.sh
  mkdir -p m4
  autoreconf -iv
  ./configure --prefix="${pkgdir}/usr" NBDKIT_PLUGINDIR="${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install
  install -Dm644 "${srcdir}/${pkgname}/nbdkit-s3backer-plugin.so" "${pkgdir}/usr/lib/nbdkit/plugins/nbdkit-s3backer-plugin.so"
}
