# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Matt Coffin <mcoffin13@gmail.com>
_python2_ver_major=$(pacman -Qi python2|gawk '$1~/Version/{split($3,v,".");print v[1] "." v[2]}')
pkgname=mesos
pkgver=1.9.0
pkgrel=1
pkgdesc="A cluster manager that simplifies the complexity of running applications on a shared pool of servers"
arch=('i686' 'x86_64')
url=http://mesos.apache.org/
license=('Apache')
groups=('science')
depends=('python2' 'zlib' 'curl' 'java-environment' 'apr' 'subversion' 'cyrus-sasl' 'libnl>=3.2.28' 'libevent>=2' 'boost' 'boost-libs' 'leveldb' 'libarchive' 'rapidjson' 'google-glog')
optdepends=('openssl: ssl support')
makedepends=('maven' 'python2-setuptools' 'openssl' 'ninja')
#conflicts=('python2-shutilwhich')
source=("ftp://apache.cs.utah.edu/apache.org/$pkgname/$pkgver/$pkgname-${pkgver}.tar.gz"
  "https://apache.org/dist/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz.asc"
  "$pkgname-master.service"
  "$pkgname-slave.service"
  "hardcode-sources.patch"
  0001-build-Fix-build-on-systems-where-gettid-is-provided-.patch)
# keys from: https://apache.org/dist/mesos/KEYS
validpgpkeys=('4BF2061E73003185CA06E30FF99D6AD0F6FB762C' 'CE2C077CF6F6F7002DB0DB6AB5DA0D371B207A4D' '90A7F1E40A9BE920A82F4302CD56EF3924E79653' '3C0F564C3072733A83DC4511D1F466FDEDBC014B' '77F89AEEAD21B78B7C2DA9DB1A4EF22FD495B11E' '81BF3C55090CBE9684680A0348AF30DC5E47E0EA' 'D8FF2F25C752BA1354CB3F29CD910E8DFA23D685' '2A145F425F2299357E20004CC5BCD6DC398DF4F4' 'D6A0C1307D16A1F5DCD1E5C8CAFE789EAA31D1F2' 'FCD2F95760240B4D6ECAEA1BBAE9E5C50C4D1C63' 'E2454C1707E80C55B76B768C82F0CB466AACBD2B' '7FDF9F586C1BE20B192DB40DA479BB4EED50F391' '291ACACD6BD9A90C1ABFFE7517F6D528A2C2C74A' '7144142BE6DD206231B170DD174FB9FAC5FF85C1' 'D64C61111ED9909C9071524FBDC218FB9AF7DC86' '070745B0AB67A2D3314D335623B0ADA4EF26082C' '30B6CAF9AB8560B2A3DAB2A6D10295D0D6EF55AD' '526039B46E41368725C5B8790D5D2740E285E9AE' 'DDE08F9E628A61F091D791AECA6CF752916F1F0B')

sha512sums=('77b88719691a0442b05d53fb022f8f147deaf65a47e0c95bd9e25f888b7bca32b5e6f91c1361e4bdbb5f8e299f01f55a37c003ba66e7c72c43900572d35735cb'
            'SKIP'
            '42d7e11412ca9634297e55f33867c8897c58da7a10c113f6892311a5e362066d7e54377be2856c4fed641bcff75843cc243d5ac65e7eafbe79c8d25e5c033d14'
            'a270d59551aaeb2bdbec7e5c6a2da02249299d208dba0ed3c9503b36b7928cc6a4920e795d865ce71c5a7fb4d492e37f434a210acd7beac9613f5bb155d79132'
            '92425bd2eb1c56812bdddf8ec540579b773043353ee9bf3f4c7e20bb4970c83c7b9ea1faecc38dc6d3f27e4125ceca9c35f7082e013c706ce6a28bc06d223cfe'
            '020ebdd3026643585d4cc8366ea9ac2144df7ee27f3ef42ef57d3dbb9d8a9bb5d3a0c3631ff9d0bfcae2eada1219bb8f0c92962cbc8f4fb9630892c945f1d77b')


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
  pushd src/java
  patch < ../../../hardcode-sources.patch
  popd

  # Fix gettid
  patch -p1 < $srcdir/0001-build-Fix-build-on-systems-where-gettid-is-provided-.patch
  ./bootstrap
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
    --enable-ssl \
    --enable-libevent \
    --with-boost=/usr \
    --with-leveldb=/usr \
    --with-libarchive=/usr \
    --with-rapidjson=/usr \
    --with-glog=/usr \
    --disable-java \
    --disable-python \
    --disable-werror \
    --with-network-isolator
  make
  # cmake .. -G Ninja \
  #   -DCMAKE_BUILD_TYPE=Release \
  #   -DENABLE_SSL=TRUE \
  #   -DENABLE_LIBEVENT=TRUE
  # ninja
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
  # install -m644 ./src/java/mesos.pom $pkgdir/usr/share/java/$pkgname/
  # install -m644 ./src/java/target/*.jar $pkgdir/usr/share/java/$pkgname/
  mkdir -p -m755 $pkgdir/usr/lib/systemd/system
  install -m644 $srcdir/$pkgname-{master,slave}.service $pkgdir/usr/lib/systemd/system
  # mkdir -p -m755 $pkgdir/usr/share/mesos/python-eggs
  # cp ./src/python/dist/mesos*.egg $pkgdir/usr/share/mesos/python-eggs
# python
  # pushd src/python
  # python2 setup.py install --root="$pkgdir" --optimize=1
  # popd
  # pushd ${pkgdir}/usr/lib/python${_python2_ver_major}/site-packages
  # ls | grep -v mesos | xargs rm -rf
  # popd
  # pushd ${pkgdir}/usr/bin
  # rm -rf easy_install*
  # popd
  # chmod 755 ${pkgdir}/usr/lib/python${_python2_ver_major}
  # chmod 755 ${pkgdir}/usr/lib/python${_python2_ver_major}/site-packages
}
