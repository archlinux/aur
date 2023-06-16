# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=debootstrap-pureos
_gitpkgname="${pkgname%-pureos}"
pkgver=1.0.128+nmu2pureos1
pkgrel=1
pkgdesc='Bootstrap a basic Debian system. Custom version, required to build PureOS.'
arch=('any')
url='https://source.puri.sm/pureos/core/debootstrap'
license=('GPL2')
depends=('binutils' 'perl' 'wget')
provides=('debootstrap')
conflicts=('debootstrap')
options=('!strip')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://source.puri.sm/pureos/core/debootstrap/-/archive/${pkgver}/debootstrap-${pkgver}.tar.gz"
  'arch-detect.patch'
)

sha512sums=(
  '4450b1ce8bcf957b7fe606492078862b348daa5b0455660d5f17b287993827e884e5f0d54b5c78d588f0758a6def77638c0195e08125928aa290732d623422d7'
  'd70a9d096d1692f71970cc818515bd783a6031bfe2d2857134eabf6fd36e4137152ebafa8e2d4ae7c8cb442c8532cd4192715b286e38b4d947b0b467e9ed54a5'
)

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  sed -i 's/sbin/bin/g' Makefile

  # Debian defaults
  sed -i 's|export PATH|export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"|' debootstrap

  # Detect architecture
  patch -p1 -i ../arch-detect.patch
}

package() {
  cd "${_gitpkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 debootstrap.8 "${pkgdir}"/usr/share/man/man8/debootstrap.8
}
