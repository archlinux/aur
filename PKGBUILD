# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
# Contributor: sulaweyo <sledge.sulaweyo@gmail.com>
# Contributor: dequis <dx@dxzone.com.ar>
# Contributor: Jan Was <janek.jan+arch@gmail.com>
# Great Contributor: mainiak <mainiak@gmail.com> (first maintainer)
# Contributor: spooky <spookyh+arch@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Florent Peterschmitt <florent@peterschmitt.fr>
# Contributor: Christian Schwarz <me et cschwarz punkt com>

pkgname=apt-cacher-ng
pkgver=3.7.4
pkgrel=8
pkgdesc="A caching proxy specialized for package files"
url="http://www.unix-ag.uni-kl.de/~bloch/acng/"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('custom')
depends=('zlib' 'bzip2' 'fuse' 'xz' 'openssl' 'libwrap' 'libevent' 'c-ares')
optdepends=('mailcap: to get correct Content-Type header on doc html served by apt-cacher-ng')
makedepends=('cmake')
source=("http://deb.debian.org/debian/pool/main/a/apt-cacher-ng/apt-cacher-ng_${pkgver}.orig.tar.xz"
        'https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/pacman-mirrorlist/mirrorlist'
        'acng.conf.patch'
        'apt-cacher-ng.service.patch'
        'apt-cacher-ng.tmpfile'
)

backup=('etc/apt-cacher-ng/acng.conf' 'etc/apt-cacher-ng/security.conf')
install=apt-cacher-ng.install
sha256sums=('63140473a669c42f5e2219e38fa9d7c733f9047699dde52c3bd828e372929a5f'
            '5d622ca30f7a47e6e9cd536720912e0ef0a1ee96d4a5f3fe7c119cb495aec76f'
            '695c074de35a75730e6b711960993f00f120634276349c8640db2ad883a5ad09'
            'c89335ea833fc04ec2ce6598e3fdaf86aa8f2fa0892203eef4c0a5cb24d6c188'
            'ead4e80771f88b42d922aff6c62da93ae9c9b001a071043e2092949f2337b459')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # === uncomment the next line to update mirrors [w3m package is needed]; it will take some time ===
  #make -f scripts/Makefile.release gendbs

  # === uncomment next line to add archlinuxarm mirrors to archlx_mirrors file ===
  #grep '^.*Server' ${srcdir}/mirrorlist|sed -e 's/^.*Server = //' -e 's/$arch\/$repo$//' >> conf/archlx_mirrors
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  rm -rf builddir
  mkdir -p builddir

  cd builddir

  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRUNDIR=/run \
    -DACNG_CACHE_DIR=/var/cache/apt-cacher-ng \
    -DACNG_LOG_DIR=/var/log/apt-cacher-ng \
    -DEXTRA_LIBS_ACNG=pthread || return 1

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

  chmod 600 ${pkgdir}/etc/apt-cacher-ng/security.conf
}


# vim:set ts=2 sw=2 et:
