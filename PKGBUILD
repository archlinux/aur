# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=debootstrap-pureos
_gitpkgname="${pkgname%-pureos}"
pkgver=1.0.141pureos1
pkgrel=1
pkgdesc='Bootstrap a basic Debian system. Custom version, required to build PureOS.'
arch=('any')
url='https://source.puri.sm/pureos/core/debootstrap'
license=('GPL-2.0-only')
depends=('bash' 'binutils' 'perl' 'wget')
provides=('debootstrap')
conflicts=('debootstrap')
options=('!debug' '!strip')

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://source.puri.sm/pureos/core/debootstrap/-/archive/${pkgver}/debootstrap-${pkgver}.tar.gz"
  'arch-detect.patch'
)

sha512sums=('c78e112fb768b828b336cb0573fa0efa987627169bf438c8b721349128897a300f0365d61f1a6d12343ea7957c21fda7a4b4cfdd0c899c461a94cddab60f9eed'
            'd70a9d096d1692f71970cc818515bd783a6031bfe2d2857134eabf6fd36e4137152ebafa8e2d4ae7c8cb442c8532cd4192715b286e38b4d947b0b467e9ed54a5')

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
