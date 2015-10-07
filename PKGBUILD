# Maintainer: Jan Was <janek.jan+arch@gmail.com>
# Great Contributor: mainiak <mainiak@gmail.com> (first maintainer)
# Contributor: spooky <spookyh+arch@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Florent Peterschmitt <florent@peterschmitt.fr>

pkgname=apt-cacher-ng
pkgver=0.8.5
pkgrel=3
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
md5sums=('924e7d68c468d68202609c2cf37039f2'
         '180e14417a70642a53c77bcb6a7b7292'
         '815e0727aec1f59bbeda15094446260e'
         '489c6e676c7f143e177f5723526c0129')

install=apt-cacher-ng.install


build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make all || return 1

  patch -Np0 -i "${srcdir}/acng.conf.patch"
  patch -Np0 -i "${srcdir}/apt-cacher-ng.service.patch"
  patch -Np0 -i "${srcdir}/apt-cacher-ng.conf.patch"
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  _bins="${pkgdir}/usr/bin"
  _confs="${pkgdir}/etc/${pkgname}"
  _docs="${pkgdir}/usr/share/doc/${pkgname}"


  mkdir -p $_bins
  mkdir -p $_confs
  mkdir -p $_docs

  cp -rf conf/* $_confs/
  cp -rf doc/{000apt-cacher-ng-proxy,apt-cacher-ng.pdf,html,README} $_docs/

  install -m755 -d ${pkgdir}/usr/share/man/man8
  install -m644 doc/man/apt-cacher-ng.8 ${pkgdir}/usr/share/man/man8/apt-cacher-ng.8
  install -m644 doc/man/acngfs.8 ${pkgdir}/usr/share/man/man8/acngfs.8

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -m775 build/apt-cacher-ng $_bins/
  install -m775 build/acngfs $_bins/
  install -m775 build/in.acng $_bins/

  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/systemd/apt-cacher-ng.service ${pkgdir}/usr/lib/systemd/system/apt-cacher-ng.service
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/systemd/apt-cacher-ng.conf ${pkgdir}/usr/lib/tmpfiles.d/apt-cacher-ng.conf
  mkdir -p ${pkgdir}/var/log/apt-cacher-ng
  mkdir -p ${pkgdir}/var/cache/apt-cacher-ng
  mkdir -p ${pkgdir}/run/apt-cacher-ng
}


# vim:set ts=2 sw=2 et:
