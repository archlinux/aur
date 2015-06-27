# Contributor: Thomas Zervogiannis <tzervo@gmail.com>
# Contributor: Philipp Robbel <robbel@gmail.com>
# Contributor: Mikołaj Milej <mikolajmm@gmail.com>

pkgname=pvm
pkgver=3.4.6
pkgrel=5
pkgdesc="Parallel Virtual Machine"
url="http://www.csm.ornl.gov/pvm/"
license=('GPL')
depends=('glibc')
arch=('i686' 'x86_64')
install=${pkgname}.install
source=(http://www.netlib.org/pvm3/$pkgname$pkgver.tgz pvm.profile)
sha512sums=('a8ddb8fc944bbe64d185eeffba0e020f28af4c8175a446511deca55d7c4f5cf62884c8c5dcb03dd9700bcc48368c8dab353e45656094d139385d88fdf34dd78a'
            '8c7a612abd0f9f132900a2e4839d9ac2cbcae88cc3d835b82cdad25c3dddcf03f98542afb4d15ac4360523ce6f36057e1269af28694eebf1621cf5b35d0ca920')

build() {
  cd $srcdir/${pkgname}3

  # Make pvm FORTRAN90-friendly
  sed -i 's/^c/!/' include/fpvm3.h include/fpvm3_watcom.h

  for i in conf/LINUX*def; do
    sed -i.orig -e '/^ARCHCFLAGS/s~/usr/bin/rsh\\"~/usr/bin/ssh\\" ${CXXFLAGS}~' "${i}"
  done

  unset PVM_ARCH
  export PVM_ROOT=$srcdir/${pkgname}3
  make || return 1
}

package() {
  cd $srcdir/${pkgname}3

  mkdir -p $pkgdir/usr/man
  mv $srcdir/${pkgname}3/man/man1 $pkgdir/usr/man
  mkdir -p $pkgdir/usr/man/man3
  mv $srcdir/${pkgname}3/man/man3 $pkgdir/usr/man

  # remove some unnecessary files
  # rm -rf Readme.* Makefile* WIN32 examples gexamples conf console make* cygwin.mak doc hoster libfpvm man misc pvmgs rm shmd src tasker tracer xdr xep
  # find . -name '*.cmd' -o -name '*.bat' -o -name '*.stub' | xargs rm -f

  # install the rest of pvm
  mkdir -p $pkgdir/usr/share/${pkgname}3
  cp -r * $pkgdir/usr/share/${pkgname}3
  mkdir -p $pkgdir/usr/bin
  ln -s /usr/share/pvm3/lib/LINUX/pvm $pkgdir/usr/bin/pvm
  ln -s /usr/share/pvm3/lib/LINUX/pvmd3 $pkgdir/usr/bin/pvmd3
  ln -s /usr/share/pvm3/lib/LINUX/pvmgs $pkgdir/usr/bin/pvmgs

  # environment variables
  mkdir -p $pkgdir/etc/profile.d
  install -m755 $startdir/${pkgname}.profile $pkgdir/etc/profile.d/${pkgname}3.sh
}
