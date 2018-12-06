# Maintainer: Nick Burrett <nick@sqrt.co.uk>
# lizardfs is a fork of moosefs and as such is a replacement for it.
pkgname=lizardfs
pkgver=3.12.0
pkgrel=3
pkgdesc='LizardFS is a highly reliable, scalable and efficient distributed file system. It spreads data over a number of physical servers, making it visible to an end user as a single file system.'
url='http://lizardfs.com'
conflicts=('moosefs' 'mfs-master' 'mfs-chunkserver' 'mfs-client')
arch=('x86_64' 'i686')
license=('GPL3')
depends=('asciidoc' 'boost' 'zlib' 'fuse2' 'python2' 'bash' 'cmake' 'unzip')
install="$pkgname.install"
source=("http://github.com/lizardfs/lizardfs/archive/v${pkgver}.tar.gz"
        "cmath.patch"
        "iostat.h.patch")
sha256sums=('d21220dc7542539b48d5bff7abe047a8c6bdbab19cb03579f88f146dee3ec5f6'
            'fd9e8e3e0bfbb3d1befb3a6136d9257dcebb60cd49012051773e35b355ce0d5c'
            'ff4fb9bad5be91fa9d8214a57c782586e6232793cfc54503e1678519fd242984')

prepare() {
  cd "lizardfs-${pkgver%_*}"
  patch -Np1 -i $srcdir/cmath.patch
  patch -Np1 -i $srcdir/iostat.h.patch
}

build() {
  mkdir -p "lizardfs-${pkgver%_*}/build"
  cd "lizardfs-${pkgver%_*}/build"
  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_DEBIAN_PATHS=ON \
    -DENABLE_CLIENT_LIB=YES \
    -DCMAKE_INSTALL_PREFIX=/
  make
}

package() {
  make -C "lizardfs-${pkgver%_*}/build" DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/lib/systemd/system
  for fn in lizardfs-cgiserv.service lizardfs-chunkserver.service \
     lizardfs-master.service lizardfs-metalogger.service
  do
    install -m 0644 lizardfs-${pkgver%_*}/rpm/service-files/$fn $pkgdir/usr/lib/systemd/system/$fn
  done
  mv "$pkgdir"/usr/sbin/* "$pkgdir/usr/bin/"
  rmdir "$pkgdir/usr/sbin"
  mv "$pkgdir"/usr/lib64/* "$pkgdir/usr/lib/"
  rmdir "$pkgdir/usr/lib64"
}

# vim:set ts=2 sw=2 et:
