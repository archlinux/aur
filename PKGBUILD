# Maintainer:  jyantis <yantis@yantis.net>

pkgname=s3fs-fuse-git
pkgver=1.78.r449.3056644
pkgrel=2
pkgdesc='FUSED-based file system backed by Amazon S3 with OpenSSL support'
arch=('i686' 'x86_64')
url='https://github.com/s3fs-fuse/s3fs-fuse'
license=('GPL2')
depends=('fuse>=2.8.4'
         'curl'
         'libxml2')
source=('git+https://github.com/s3fs-fuse/s3fs-fuse.git')
sha256sums=('SKIP')
makedepends=('git'
             'glib2'
             'mime-types'
             'libxml++'
             'libgcrypt'
             'openssl>=0.9.8')
provides=('s3fs-fuse' 's3fs')
conflicts=('s3fs-fuse' 's3fs' 's3fs-c-git')

pkgver() {
  cd s3fs-fuse
  printf "%s." "$(grep "AC_INIT(" configure.ac | awk 'BEGIN {FS = " "} {print $2}')" |  sed 's/)//g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd s3fs-fuse
  ./autogen.sh
  ./configure --prefix=/usr --with-openssl
  make
}

package() {
  cd s3fs-fuse

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install License
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"

  # make install
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
