# Maintainer: dequis <dx@dxzone.com.ar>
# Contributor: Jan Was <janek.jan+arch@gmail.com>
# Great Contributor: mainiak <mainiak@gmail.com> (first maintainer)
# Contributor: spooky <spookyh+arch@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Florent Peterschmitt <florent@peterschmitt.fr>

pkgname=apt-cacher-ng
pkgver=0.8.6
pkgrel=1
pkgdesc="A caching proxy specialized for package files."
url="http://www.unix-ag.uni-kl.de/~bloch/acng/"
arch=('i686' 'x86_64')
license=('custom')
depends=('zlib' 'bzip2' 'fuse' 'xz' 'openssl')
makedepends=('cmake')
source=("http://ftp.debian.org/debian/pool/main/a/apt-cacher-ng/apt-cacher-ng_${pkgver}.orig.tar.xz"
        'acng.conf.patch'
        'apt-cacher-ng.service.patch'
        'apt-cacher-ng.conf.patch')

backup=('etc/apt-cacher-ng/acng.conf')
md5sums=('5cb18432ab41ff6a051f780bf99fb2d9'
         '180e14417a70642a53c77bcb6a7b7292'
         '815e0727aec1f59bbeda15094446260e'
         '489c6e676c7f143e177f5723526c0129')

install=apt-cacher-ng.install


build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  rm -rf builddir
  mkdir -p builddir
  src=$PWD

  cd builddir

  cmake $src -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DEXTRA_LIBS_ACNG=pthread || return 1

  make all || return 1

  patch -Np0 -i "${srcdir}/acng.conf.patch"
  cd ..
  patch -Np0 -i "${srcdir}/apt-cacher-ng.service.patch"
  patch -Np0 -i "${srcdir}/apt-cacher-ng.conf.patch"
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make -C builddir install DESTDIR=${pkgdir}

  mv ${pkgdir}/usr/sbin/ ${pkgdir}/usr/bin/
  mv ${pkgdir}/usr/lib/apt-cacher-ng/{acngfs,acngtool,in.acng} ${pkgdir}/usr/bin

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/systemd/apt-cacher-ng.service ${pkgdir}/usr/lib/systemd/system/apt-cacher-ng.service
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/systemd/apt-cacher-ng.conf ${pkgdir}/usr/lib/tmpfiles.d/apt-cacher-ng.conf
  mkdir -p ${pkgdir}/var/log/apt-cacher-ng
  mkdir -p ${pkgdir}/var/cache/apt-cacher-ng
}


# vim:set ts=2 sw=2 et:
