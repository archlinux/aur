# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: 
_python2_ver_major=$(pacman -Qi python2|gawk '$1~/Version/{split($3,v,".");print v[1] "." v[2]}')
pkgname=mesos
pkgver=1.1.0
pkgrel=1
pkgdesc="A cluster manager that simplifies the complexity of running applications on a shared pool of servers"
arch=('i686' 'x86_64')
url=http://mesos.apache.org/
license=('Apache')
groups=('science')
depends=('python2' 'zlib' 'curl' 'java-environment' 'apr' 'subversion' 'cyrus-sasl' 'libnl>=3.2.28')
makedepends=('maven' 'python2-setuptools')
#conflicts=('python2-shutilwhich')
source=("http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-${pkgver}.tar.gz"
  "$pkgname-master.service"
  "$pkgname-slave.service")

# official signature file:
# "http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-${pkgver}.tar.gz.asc"
md5sums=('ff89748a6668425d462dcaa12608cf8a'
         '42e6bb21d7682b8a8f036c23532e4fe9'
         '55cc5e556bb0622f5f913a1999f17766')

prepare() {
  cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"
  if [ ! -d build ]; then
    mkdir build
  fi
  if [ ! -d build/.m2 ]; then
    mkdir build/.m2
  fi
  if [ ! -f configure ]; then
    ./bootstrap
  fi
  # fix python path (/usr/bin/env python -> python2)
  find src/cli -type f -print | xargs sed --in-place -e "1 s/\(\/usr\/bin\/env python$\)/\12/"
}

build() {
  cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"/build
  PYTHON=python${_python2_ver_major} \
  ../configure \
  --enable-optimize \
  --prefix=/usr \
  --sysconfdir=/etc \
  --libexecdir=/usr/lib \
  --exec-prefix=/usr \
  --sbindir=/usr/bin \
  --with-network-isolator
 make
}

check() {
  msg "Skipping 'make check'."
  msg2 "(Because it takes very long time to complete)"
  #cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"/build
  #make -k check
}

package() {
  mkdir -p $pkgdir/usr/lib/$pkgname
  cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"/build
  make DESTDIR="$pkgdir/" install
  mkdir -p -m755 $pkgdir/usr/share/java/$pkgname 
  mkdir -p -m755 $pkgdir/var/{lib,log}/$pkgname
  install -m644 ./src/java/mesos.pom $pkgdir/usr/share/java/$pkgname/
  install -m644 ./src/java/target/*.jar $pkgdir/usr/share/java/$pkgname/
  mkdir -p -m755 $pkgdir/usr/lib/systemd/system
  install -m644 $srcdir/$pkgname-{master,slave}.service $pkgdir/usr/lib/systemd/system

# python
  pushd src/python
  python2 setup.py install --root="$pkgdir" --optimize=1
  popd
  pushd ${pkgdir}/usr/lib/python${_python2_ver_major}/site-packages
  ls | grep -v mesos | xargs rm -rf
  popd
  pushd ${pkgdir}/usr/bin
  rm -rf easy_install*
  popd
  chmod 755 ${pkgdir}/usr/lib/python${_python2_ver_major}
  chmod 755 ${pkgdir}/usr/lib/python${_python2_ver_major}/site-packages
}
