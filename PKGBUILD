# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>

_pkgname=gdbm
pkgname=${_pkgname}183
pkgver=1.8.3
pkgrel=10
pkgdesc="GNU database library"
url="http://www.gnu.org/software/gdbm/gdbm.html"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc' 'sh')
source=(ftp://ftp.gnu.org/gnu/gdbm/${_pkgname}-${pkgver}.tar.gz
        gdbm-1.8.3-zeroheaders.patch
        gdbm-1.8.3-fhs.patch)
options=('!libtool' '!makeflags')
install=gdbm.install
md5sums=('1d1b1d5c0245b1c00aff92da751e9aa1'
         'a2ed344be9258775bd718074cf2e4ec6'
         '66a7c235416c136dc89efc7d03352514')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Prevent gdbm from storing uninitialized memory content
  # to database files. This patch improves security, as the
  # uninitialized memory might contain sensitive informations
  # from other applications.
  # https://bugzilla.redhat.com/show_bug.cgi?id=4457
  # http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=208927
  patch -Np1 -i ../gdbm-1.8.3-zeroheaders.patch

  # Make gdbm buildable.
  patch -Np1 -i ../gdbm-1.8.3-fhs.patch

  libtoolize --force --copy
  aclocal
  autoconf

  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info

  # flock does not work on nfs, we use fcntl instead
  # https://bugzilla.redhat.com/show_bug.cgi?id=477300
  echo "/* We use fcntl locking (POSIX) instead of flock (BSD) */" >> autoconf.h
  echo "#undef HAVE_FLOCK" >> autoconf.h

  make prefix=/usr
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make prefix=$pkgdir/usr \
       manprefix=$pkgdir/usr/share/man \
       man3dir=$pkgdir/usr/share/man/man3 \
       infodir=$pkgdir/usr/share/info \
       install install-compat

  # Only leave versioned libraries. This is important, so that they doesn't conflict with other versions
  rm -fr ${pkgdir}/usr/{include,share}
  rm ${pkgdir}/usr/lib/{libgdbm_compat,libgdbm}.{so,a}
}
