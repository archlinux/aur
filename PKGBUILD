pkgname=srandom-git
pkgver=1.37.r0.g4793b23
pkgrel=1
pkgdesc="srandom is a Linux kernel module that can be used to replace the built-in /dev/urandom & /dev/random device files. It is secure and VERY fast."
arch=(any)
url="https://github.com/josenk/srandom"
license=('GPL')
makedepends=("git")
depends=('dkms')
provides=("srandom")
options=("!strip")
source=("git+https://github.com/josenk/srandom.git" 'dkms.conf' 'install')
sha256sums=('SKIP'
            '9fe8f3f53e2ad1ae62a5ab94a8bf4e426e96a88f8a0fda533ecb8588e43be931'
            '3bfc62aa9f0de284ed823c3c7fd32035029bd050be3e74cafbba1bc14017f829')
install=install
pkgver() {
  cd "srandom"
  _descr=`git describe --long --tags 2>/dev/null || echo $(git rev-list --count HEAD).$(git describe --always)`
  echo $_descr | sed 's/^[vV]//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd srandom
  make
}
package() {
  _base=srandom-$pkgver
  cd srandom
  mkdir -p "$pkgdir"/etc/modules-load.d/
  mkdir -p "$pkgdir"/etc/udev/rules.d/
  mkdir -p "$pkgdir"/usr/bin
  echo "woof"
  install -m 644 11-srandom.rules "${pkgdir}"/etc/udev/rules.d/11-srandom.rules
  install -m 755 srandom "${pkgdir}"/usr/bin/srandom
  install -m 644 srandom.conf "${pkgdir}"/etc/modules-load.d/srandom.conf
  
  mkdir -p "${pkgdir}"/usr/src/${_base}
  cp -a {*.c,Makefile} "${pkgdir}"/usr/src/${_base}
  cp $srcdir/dkms.conf "${pkgdir}"/usr/src/${_base}

  sed -e "s/@PKGNAME@/srandom/" \
  -e "s/@PKGVER@/${pkgver}/" \
  -i "${pkgdir}"/usr/src/${_base}/dkms.conf

  sed -i 's/KVER/KERNELRELEASE/g' "${pkgdir}"/usr/src/${_base}/Makefile

}
