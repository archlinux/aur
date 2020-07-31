# Maintainer: sulaweyo <sledge.sulaweyo@gmail.com>
# Contributor: dequis <dx@dxzone.com.ar>
# Contributor: Jan Was <janek.jan+arch@gmail.com>
# Great Contributor: mainiak <mainiak@gmail.com> (first maintainer)
# Contributor: spooky <spookyh+arch@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Florent Peterschmitt <florent@peterschmitt.fr>
# Contributor: Christian Schwarz <me et cschwarz punkt com>

pkgname=apt-cacher-ng
pkgver=3.5
pkgrel=1
pkgdesc="A caching proxy specialized for package files."
url="http://www.unix-ag.uni-kl.de/~bloch/acng/"
arch=('i686' 'x86_64' 'armv7h')
license=('custom')
depends=('zlib' 'bzip2' 'fuse' 'xz' 'openssl' 'libwrap' 'libevent')
makedepends=('cmake')
source=("http://snapshot.debian.org/archive/debian-debug/20200421T024713Z/pool/main/a/apt-cacher-ng/apt-cacher-ng_${pkgver}.orig.tar.xz"
        'acng.conf.patch'
        'apt-cacher-ng.service.patch'
        'apt-cacher-ng.tmpfile'
)

backup=('etc/apt-cacher-ng/acng.conf')
md5sums=('129dfeb63f14896fcf133d1bb9b8a981' # package
         '615f24677e35a346990c9a040293bb9a' # acng.conf.patch
         '814ce1d0820f1a42d6aab483a6961fc6' # apt-cacher-ng.service.patch
         '29979b8064ff52aa24017b42c37e6bfb') # apt-cacher-ng.tmpfile

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
  patch -Np0 -i "${srcdir}/apt-cacher-ng.service.patch"
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make -C builddir install DESTDIR=${pkgdir}

  mv ${pkgdir}/usr/sbin/ ${pkgdir}/usr/bin/
  mv ${pkgdir}/usr/lib/apt-cacher-ng/{acngfs,acngtool,in.acng} ${pkgdir}/usr/bin

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/builddir/systemd/apt-cacher-ng.service ${pkgdir}/usr/lib/systemd/system/apt-cacher-ng.service
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/builddir/systemd/apt-cacher-ng.conf ${pkgdir}/usr/lib/tmpfiles.d/apt-cacher-ng.conf
  mkdir -p ${pkgdir}/var/log/apt-cacher-ng
  mkdir -p ${pkgdir}/var/cache/apt-cacher-ng

}


# vim:set ts=2 sw=2 et:
