# Maintainer: Guoyi Zhang <GuoyiZhang at malacology dot net>
# Contributor: Hu Butui <hot123tea123@gmail.com>
# Contributor: sukanka <su975853527 [at] gmail.com>
# Contributor: Thomas Zervogiannis <tzervo@gmail.com>
# Contributor: Philipp Robbel <robbel@gmail.com>
# Contributor: Mikołaj Milej <mikolajmm@gmail.com>

pkgname=pvm
pkgver=3.4.6
pkgrel=10
pkgdesc="Parallel Virtual Machine"
url="http://www.netlib.org/pvm3"
license=('GPL')
depends=('libtirpc')
arch=('x86_64')
install=${pkgname}.install
source=(http://www.netlib.org/pvm3/$pkgname$pkgver.tgz pvm.profile)
sha512sums=('a8ddb8fc944bbe64d185eeffba0e020f28af4c8175a446511deca55d7c4f5cf62884c8c5dcb03dd9700bcc48368c8dab353e45656094d139385d88fdf34dd78a'
            '39b5bdb2231b04b280d44c240d4d51aab9cfbfa8100165e6908b4ab5c3b68a1509d0908330357b9016c69afd165da6efe2c63c4a18b9048d890e043750ecd894')

build() {
  cd $srcdir/${pkgname}3

  for i in conf/LINUX*def; do
    sed -i.orig -e '/^ARCHCFLAGS/s~/usr/bin/rsh\\"~/usr/bin/ssh\\" ${CXXFLAGS}~' "${i}"
  done

  unset PVM_ARCH
  export PVM_ROOT=$srcdir/${pkgname}3
  export CXXFLAGS="${CXXFLAGS} -Wno-error=format-security -I/usr/include/tirpc -ltirpc"
  make
}

package() {
  install -dm 755 $pkgdir/usr/{bin,include,lib/pvm3,share/{man,doc/pvm}}

  cd $srcdir/${pkgname}3

  # manual
  mv $srcdir/${pkgname}3/man/{man1,man3} $pkgdir/usr/share/man

  # binary
  for bin in $(ls $srcdir/${pkgname}3/bin/LINUX64/)
  do
    install -Dm 755 $srcdir/${pkgname}3/bin/LINUX64/$bin $pkgdir/usr/bin/$bin
  done

  for bin in $(ls -al $srcdir/${pkgname}3/lib/LINUX64/ | grep '\-rwxr' | awk '{print $9}')
  do
    install -Dm 755 $srcdir/${pkgname}3/lib/LINUX64/$bin $pkgdir/usr/bin/$bin
  done

  # include and lib
  mv $srcdir/${pkgname}3/include $pkgdir/usr/

  cd $srcdir/${pkgname}3/lib/LINUX64/
  for lib in $(ls *.a)
  do
     install -Dm 644 $srcdir/${pkgname}3/lib/LINUX64/$lib $pkgdir/usr/lib/pvm3/$lib
  done
  
  install -Dm 755 $srcdir/${pkgname}3/conf/LINUX64.m4 $pkgdir/usr/lib/pvm3/conf/LINUX64.m4
  install -Dm 755 $srcdir/${pkgname}3/conf/LINUX64.def $pkgdir/usr/lib/pvm3/conf/LINUX64.def

  # doc
  for doc in $(ls $srcdir/${pkgname}3/doc)
  do
    install -Dm 755 $srcdir/${pkgname}3/doc/$doc $pkgdir/usr/share/doc/pvm/$doc
  done

  # environment variables
  mkdir -p $pkgdir/etc/profile.d
  install -m755 $startdir/${pkgname}.profile $pkgdir/etc/profile.d/${pkgname}3.sh
}

