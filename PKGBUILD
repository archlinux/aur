# Maintainer: Nick Burrett <nick@sqrt.co.uk>
# lizardfs is a fork of moosefs and as such is a replacement for it.
pkgname=lizardfs
pkgver=3.10.0
pkgrel=1
pkgdesc='LizardFS is a highly reliable, scalable and efficient distributed file system. It spreads data over a number of physical servers, making it visible to an end user as a single file system.'
url='http://lizardfs.com'
conflics=('moosefs' 'mfs-master' 'mfs-chunkserver' 'mfs-client')
arch=('x86_64' 'i686')
license=('GPL3')
depends=('asciidoc' 'boost' 'zlib' 'fuse' 'python2' 'bash' 'cmake')
install="$pkgname.install"
source=("http://github.com/lizardfs/lizardfs/archive/v.${pkgver}.tar.gz"
        "cmath.patch")
sha256sums=('6040c1accc296b9d9d0d00e8c595d51f88c269d385ddedc18b98d46c5d21dcc2'
            'fd9e8e3e0bfbb3d1befb3a6136d9257dcebb60cd49012051773e35b355ce0d5c')

prepare() {
  cd "lizardfs-v.${pkgver%_*}"
  patch -Np1 -i $srcdir/cmath.patch
}

build() {
  cd "lizardfs-v.${pkgver%_*}"
  ./configure
  cd build-pack
  make -j 2
  #mkdir -p build
  #cd build
  #cmake \
  #   -DCMAKE_INSTALL_PREFIX=/usr \
  #   -DCMAKE_INSTALL_SBINDIR=/usr/bin \
  #   -DCMAKE_INSTALL_BINDIR=/usr/bin \
  #   -DCMAKE_INSTALL_SYSCONFDIR=/etc \
  #   -DCMAKE_INSTALL_LOCALSTATEDIR=/var \
  #   -DCMAKE_INSTALL_INCLUDEDIR=/usr/include \
  #   -DCMAKE_INSTALL_DATAROOTDIR=/usr/share \
  #   -DCMAKE_INSTALL_LIBDIR=/usr/lib64 \
  #   -DCMAKE_BUILD_TYPE=Release ..
  #make -j 2
}

package() {
  make DESTDIR="$pkgdir" -C "lizardfs-v.${pkgver%_*}/build-pack" install
  mkdir -p $pkgdir/usr/lib/systemd
  for fn in lizardfs-cgiserv.service lizardfs-chunkserver.service \
     lizardfs-master.service lizardfs-metalogger.service
  do
    install -m 0644 lizardfs-v.${pkgver%_*}/rpm/service-files/$fn $pkgdir/usr/lib/systemd/$fn 
  done
  mv "$pkgdir"/usr/sbin/* "$pkgdir/usr/bin/"
  rmdir "$pkgdir/usr/sbin"
}

# vim:set ts=2 sw=2 et:
