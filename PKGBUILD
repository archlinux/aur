# Maintainer: Nick Burrett <nick@sqrt.co.uk>
# lizardfs is a fork of moosefs and as such is a replacement for it.
pkgname=lizardfs
pkgver=3.9.4
pkgrel=1
pksdesc='High performing and fault tolerant distributed file system'
url='http://lizardfs.com'
conflics=('moosefs' 'mfs-master' 'mfs-chunkserver' 'mfs-client')
arch=('x86_64' 'i686')
license=('GPL3')
depends=('asciidoc' 'boost' 'zlib' 'fuse' 'python2' 'bash' 'cmake')
install="$pkgname.install"
source=("http://github.com/lizardfs/lizardfs/archive/v.${pkgver}.tar.gz"
        "cmake.patch")
sha256sums=('ece4e3f3433f6a26edf09b9f1ab0e867dd5e558f8966407792a38cb91ee91585'
            'b233e631aed57fac8fc28003e390055582e45743e48c7ffe24af3a559b70e154')

prepare() {
  cd "lizardfs-v.${pkgver%_*}"
  patch -Np1 -i $srcdir/cmake.patch
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
