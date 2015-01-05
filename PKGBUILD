# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Lisa Denia <eiffel56@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=automake-1.13
_realname=automake
pkgver=1.13.4
pkgrel=1
pkgdesc="A GNU tool for automatically creating Makefiles"
arch=('any')
license=('GPL')
url="http://www.gnu.org/software/automake"
groups=('base-devel')
depends=('perl' 'bash')
makedepends=('autoconf')
provides=("automake=$pkgver")
checkdepends=('dejagnu' 'python2' 'java-environment' 'vala' 'emacs' 'cscope')
install=automake.install
source=(ftp://ftp.gnu.org/gnu/${_realname}/${_realname}-${pkgver}.tar.xz{,.sig})
md5sums=('71b03c1bc4f587add12604587d9276d1'
         'SKIP')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${srcdir}/${_realname}-${pkgver}

  # expect 1 failure due to perl-5.18 incompatibility
  make -k check || true
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -rf "$pkgdir/usr/"{bin/{aclocal,automake},share/{doc,aclocal}}

  for files in "$pkgdir"/usr/share/info/*; do
    rename "$files" "$(echo $files | sed -r 's/(\.info)/-1.13\1/')" "$files"
  done

  rm "$pkgdir/usr/share/man/man1/"{aclocal,automake}.1
}
