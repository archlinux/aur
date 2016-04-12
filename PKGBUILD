# Maintainer: taij33n <bwbuiz@gmail.com>
pkgname=picolisp      
pkgver=16.2.r0.g0b67511
pkgrel=1
pkgdesc="Fast and tiny 64-bit Lisp interpreter: OO, dynamic and functional (database, prolog, coroutines)."
url="http://www.picolisp.com"
arch=('any')
license=('MIT')
depends=('bash' 'openssl' 'gcc-multilib')
optdepends=('jre: for picolisp ersatz.jar')
makedepends=('make' 'git' 'gcc')
source=("$pkgname::git+https://github.com/taij33n/picolisp.git")
md5sums=("SKIP")
install=$pkgname.install

pkgver() {
    cd "${pkgname}"
    # cutting off 'foo-' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # build 32bit version and tools first
  cd "${srcdir}/${pkgname}/src"
  make all
  make clean
 
  # build the 64bit version
  cd "${srcdir}/${pkgname}/src64"
  if [ $CARCH = "x86_64" ]
  then
    # real 64-bit env
    make 
    make clean
  else
    # emulation of 64-bit env
    make emu
    make clean
  fi
}

package() {
  install -d -m755 "${pkgdir}/usr/lib/picolisp"
  cp -a ${srcdir}/${pkgname}/* ${pkgdir}/usr/lib/picolisp/

}


 