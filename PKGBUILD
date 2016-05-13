# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Peter <craven@gmx.net>
pkgname=rhizome-pi-scheme
pkgver=0.57
pkgrel=1
epoch=
pkgdesc="rhizome/pi is a Scheme implementation (interpreter and compiler, compiler generates program in C language) conforming to R^5RS."
arch=(x86_64 i686)
url=""
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.kt.rim.or.jp/~qfwfq/packages/rhizome-$pkgver.tar.gz")
md5sums=('5fc557fb1a03e47c0037884052f7e438')
noextract=()
validpgpkeys=()

build() {
  cd "rhizome-$pkgver"
  cp config/unix/linux/rhiz_cnf.h include/rhiz_cnf.h
  cp config/unix/linux/Makefile.kappa kappa/Makefile
  cp config/unix/linux/Makefile.pi pi/Makefile
  cp config/unix/linux/Makefile.pi.compiler pi/compiler/Makefile
  cp config/unix/linux/config.scm pi/compiler/config.scm
  sed -i 's/-mtune=i686/-m32 -mtune=i686/' pi/Makefile
  sed -i 's/-mtune=i686/-m32 -mtune=i686/' kappa/Makefile
  sed -i 's/-mtune=i686/-m32 -mtune=i686/' pi/compiler/Makefile
  sed -i 's/-mtune=i686/-m32 -mtune=i686/' pi/compiler/config.scm
  sed -i 's/"gcc"/"gcc -m32"/' pi/compiler/config.scm
  sed -i 's/"ld -Bshareable"/"ld -melf_i386 -Bshareable"/' pi/compiler/config.scm
  sed -i 's/-x -r -o/-melf_i386 -x -r -o/' pi/Makefile
  sed -i 's/-x -r -o/-melf_i386 -x -r -o/' kappa/Makefile
  sed -i 's/-x -Bshareable/-melf_i386 -x -Bshareable/' pi/compiler/Makefile
  sed -i 's/SHLIBDIR)"/SHLIBDIR) -m32"/' pi/compiler/Makefile
  sed -i "s|install -c -m 444 rhiz_cnf.h rhizome.h.*|install -c -m 444 rhiz_cnf.h rhizome.h ${pkgdir}/usr/include|" kappa/Makefile
  sed -i "s|install -c -m 444 rhiz_pi.h.*|install -c -m 444 rhiz_pi.h ${pkgdir}/usr/include|" pi/Makefile
  cd pi
  make
}

package() {
  cd "rhizome-$pkgver"
  sed -i "s|BASEDIR = /usr/local|BASEDIR = ${pkgdir}/usr|" pi/Makefile
  sed -i "s|LIBDIR = .*$|LIBDIR = \$(BASEDIR)/lib32|" pi/Makefile
  mkdir -p ${pkgdir}/usr/lib32
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/include
  cd pi
  make install
}
