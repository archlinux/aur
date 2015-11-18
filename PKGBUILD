# Maintainer: taij33n <bwbuiz@gmail.com>
pkgname=picolisp      
pkgver=3.1.12.r0.g4535b0d
pkgrel=1
pkgdesc="Fast and tiny 64-bit Lisp interpreter: OO, dynamic and functional (database, prolog, coroutines)."
url="http://www.picolisp.com"
arch=('x86_64')
license=('MIT')
depends=('bash' 'openssl')
optdepends=('jre: for picolisp ersatz.jar')
makedepends=('make' 'git')
source=("$pkgname::git+https://github.com/taij33n/picolisp.git")
md5sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    # cutting off 'foo-' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # build 32bit version and tools first
  cd "${srcdir}/${pkgname}/src"
  make all

  # build the 64bit version
  cd "${srcdir}/${pkgname}/src64"
  make all
}

package() {
  install -d -m755 "${pkgdir}/usr/lib/picolisp"
  cp -a ${srcdir}/${pkgname}/* ${pkgdir}/usr/lib/picolisp/

  # binary
  install -d -m755 "${pkgdir}/usr/bin/"
  ln -s "/usr/lib/picolisp/bin/picolisp" "${pkgdir}/usr/bin/"
  ln -s "/usr/lib/picolisp/bin/pil" "${pkgdir}/usr/bin/"

  ln -s "/usr/lib/picolisp/bin/ssl" "${pkgdir}/usr/bin/"
  ln -s "/usr/lib/picolisp/bin/httpGate" "${pkgdir}/usr/bin/"
  ln -s "/usr/lib/picolisp/bin/psh" "${pkgdir}/usr/bin/"

  # documentation
  install -d -m755 "${pkgdir}/usr/share/man/man1/"
  ln -s "/usr/lib/picolisp/man/man1/picolisp.1" "${pkgdir}/usr/share/man/man1/" 
  ln -s "/usr/lib/picolisp/man/man1/pil.1" "${pkgdir}/usr/share/man/man1/" 

  ln -s "/usr/lib/picolisp" "${pkgdir}/usr/share/"

  # license
  install -Dm755 ${srcdir}/${pkgname}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}


 