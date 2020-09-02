# Maintainer: Thomas Bächler <thomas@archlinux.org>
# Contributer: fkxxyz <fkxxyz@163.com>

pkgname=v4l-utils-rockchip
_v4l_pkgname=v4l-utils
pkgver=1.20.0
pkgrel=1
pkgdesc="Userspace tools and conversion library for Video 4 Linux with rockchip support"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/JeffyCN/meta-rockchip/tree/release-1.1.0_20191030/recipes-multimedia/v4l2apps/v4l-utils"
provides=("libv4l=$pkgver" "$_v4l_pkgname")
replaces=('libv4l')
conflicts=('libv4l' "$_v4l_pkgname")
backup=(etc/rc_maps.cfg)
license=('LGPL')
makedepends=('qt5-base' 'alsa-lib')
optdepends=('qt5-base: for qv4l2' 'alsa-lib: for qv4l2')
depends=('hicolor-icon-theme' 'gcc-libs' 'sysfsutils' 'libjpeg-turbo')
_v4l_patch_url='https://raw.githubusercontent.com/JeffyCN/meta-rockchip/release-1.1.0_20191030/recipes-multimedia/v4l2apps/v4l-utils'
source=(https://linuxtv.org/downloads/v4l-utils/${_v4l_pkgname}-${pkgver}.tar.bz2{,.asc}
        $_v4l_patch_url/0001-libv4l2-Support-mmap-to-libv4l-plugin.patch
        $_v4l_patch_url/0002-libv4l-mplane-Filter-out-multiplane-formats.patch)
sha256sums=('956118713f7ccb405c55c7088a6a2490c32d54300dd9a30d8d5008c28d3726f7'
            'SKIP'
            '9b56d4219eae95a6597cd63b9fac72ca7b2c122bf210772df467333d9d0bdd56'
            '2e4e51f2e6dfc0d20e2aa14742ef2a3096949fd39460eccb9b07846385fd701a')

validpgpkeys=('05D0169C26E41593418129DF199A64FADFB500FF') # Gregor Jasny <gjasny@googlemail.com>

prepare() {
  cd "${srcdir}/${_v4l_pkgname}-${pkgver}"
  for p in ../*.patch; do
    patch -Np1 -i ../$p
  done
}

build() {
  cd "${srcdir}/${_v4l_pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${_v4l_pkgname}-${pkgver}"
  MAKEFLAGS="-j1" make install DESTDIR="${pkgdir}/"
  rm "${pkgdir}/usr/bin/ivtv-ctl"
}

