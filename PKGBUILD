# $Id: PKGBUILD 160938 2012-06-07 07:26:48Z allan $
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

_pkgname=fakeroot
pkgname=fakeroot-tcp
pkgver=1.20.2
pkgrel=1
pkgdesc="Gives a fake root environment, useful for building packages as a non-privileged user,with tcp ipc"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
url="http://packages.debian.org/fakeroot"
groups=('base-devel')
install=fakeroot.install
depends=('glibc' 'filesystem' 'sed' 'util-linux' 'sh')
options=('!libtool')
conflicts=('fakeroot')
source=(http://ftp.debian.org/debian/pool/main/f/${_pkgname}/${_pkgname}_${pkgver}.orig.tar.bz2)
md5sums=('a4b4564a75024aa96c86e4d1017ac786')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib/libfakeroot \
              --disable-static --with-ipc=tcp
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install

  install -dm755 ${pkgdir}/etc/ld.so.conf.d/
  echo '/usr/lib/libfakeroot' > ${pkgdir}/etc/ld.so.conf.d/fakeroot.conf

  # install README for sysv/tcp usage
  install -Dm644 $srcdir/$_pkgname-$pkgver/README $pkgdir/usr/share/doc/$_pkgname/README
}
