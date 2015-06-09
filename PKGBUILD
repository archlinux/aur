# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
#_pkgver_minor=-rc3
_pkgver_minor=
_python2_ver_major=$(pacman -Qi python2|gawk '$1~/Version/{split($3,v,".");print v[1] "." v[2]}')
pkgname=mesos
pkgver=0.22.1
pkgrel=1
pkgdesc="A cluster manager that simplifies the complexity of running applications on a shared pool of servers"
arch=('i686' 'x86_64')
url=http://mesos.apache.org/
license=('Apache')
groups=('science')
install=$pkgname.install
depends=('python2' 'curl' 'leveldb' 'java-environment' 'libunwind' 'google-glog'
         'libnl' 'apr' 'subversion' 'protobuf' 'python2-protobuf' 'python2-boto')
makedepends=('java-environment' 'maven' 'http-parser' 'python2-http-parser' 'google-glog'
             'gperftools' 'apr' 'subversion' 'protobuf' 'python2-protobuf' 'python2-boto')
source=("http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-${pkgver}.tar.gz"
  "$pkgname-master.service"
  "$pkgname-slave.service"
  "$pkgname.install")

# official signature file:
#  "http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-${pkgver}.tar.gz.asc"
md5sums=('5b326b493e46cc497d1ad384ac9d5aec'
         'da6ff9d8a2df96325bee325a957eb760'
         '69df716316170056ff2a54c5299d8cb4'
         'fe3a51b1e65c1b0e16a8b42a0398f30a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"
  if [ ! -d build ]; then
    mkdir build
  fi
  if [ ! -f configure ]; then
    ./bootstrap
  fi
  # fix python path (/usr/bin/env python -> python2)
  find src/cli -type f -print | xargs sed --in-place -e "1 s/\(\/usr\/bin\/env python$\)/\12/"
}

build() {
  cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"/build
  PYTHON_VERSION=${_python2_ver_major} \
  LIBS='-lprotobuf -lglog' \
  ../configure \
   --prefix=/usr \
   --sysconfdir=/etc \
   --libexecdir=/usr/lib \
   --exec-prefix=/usr \
   --sbindir=/usr/bin \
   --with-glog=/usr \
   --with-leveldb=/usr \
   --with-gperftools=/usr \
   --with-network-isolator

	make
}

check() {
  msg "skipping 'make check'."
  msg2 "(because it will take quite a long time to complete)"
  # cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"/build
  # make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"/build
	make DESTDIR="$pkgdir/" install
  mkdir -p -m755 $pkgdir/usr/share/java/$pkgname 
  mkdir -p -m755 $pkgdir/var/{lib,log}/$pkgname
  install -m644 ./src/java/mesos.pom $pkgdir/usr/share/java/$pkgname/
  install -m644 ./src/java/target/*.jar $pkgdir/usr/share/java/$pkgname/
  mkdir -p -m755 $pkgdir/usr/lib/systemd/system
  install -m644 $srcdir/$pkgname-{master,slave}.service $pkgdir/usr/lib/systemd/system
  
  # python
  cd ./src/python
  python2 setup.py install --root="$pkgdir" --optimize=1
}
