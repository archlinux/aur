# Maintainer: Andreas Grapentin <andreas@grapentin.org>
pkgname=vmdebootstrap
pkgver=1.7
pkgrel=1
pkgdesc="debootstrap installs a basic Debian system into a directory, for use with chroot(8). vmdeboostrap is a wrapper around it to install Debian into a disk image, which can be used with a virtual machine (such as KVM)."
arch=('i686' 'x86_64')

url="http://liw.fi/vmdebootstrap/"
license=('GPL3')

depends=('debootstrap'
         'syslinux'
         'qemu'
         'parted'
         'multipath-tools'
         'python2'
         'python2-cliapp'
         'distro-info')

makedepends=('python-sphinx')

source=("http://git.liw.fi/cgi-bin/cgit/cgit.cgi/$pkgname/snapshot/$pkgname-$pkgver.tar.gz"
        'python_version.patch'
        'default_arch.patch'
        'fix_path.patch')

sha256sums=('e5b652e7aff4906bbe0221855cd51683f0528e27a711a66beef86457a54cc0e9'
            '10ef6c58c24d52ff3b66498eac23526623b881871ce1d3d2138e358ef9580f41'
            'a9971329a87e08f3de371647fe60b0ffab99ecd7925c55a00fdb1f2ef70781f0'
            'e8d3a250dc8bf11aafa707602c9ca6d496b3c3c3183dcf9f04a50de6a3b26b75')


prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 < ../python_version.patch
  patch -p1 < ../default_arch.patch
  patch -p1 < ../fix_path.patch
}

build() {
  cd "$pkgname-$pkgver"

  make -C man man
}

package() {
	cd "$pkgname-$pkgver"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  mkdir -p ${pkgdir}/usr/share/man/man8/
  cp man/_build/man/vmdebootstrap.8 ${pkgdir}/usr/share/man/man8/

  mkdir -p ${pkgdir}/usr/share/doc/$pkgname
  cp COPYING ${pkgdir}/usr/share/doc/$pkgname
  cp README ${pkgdir}/usr/share/doc/$pkgname

  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
  cd ${pkgdir}/usr/share/licenses/$pkgname
  ln -s ../../doc/$pkgname/COPING COPYING
}
