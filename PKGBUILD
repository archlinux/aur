# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=alsa-utils-nosystemd-minimal-git
pkgver=1.2.4
pkgrel=1
pkgdesc="Advanced Linux Sound Architecture - Utilities"
arch=('x86_64')
url="https://www.alsa-project.org"
license=('GPL2')
depends=('glibc' 'pciutils' 'psmisc')
makedepends=('alsa-lib' 'libsamplerate' 'ncurses')
optdepends=('fftw: for alsabat')
provides=(alsa-utils)
conflicts=(alsa-utils)
# we require /var/lib/alsa for state file
options=(emptydirs)
source=("git+https://github.com/alsa-project/alsa-utils.git")
sha512sums=('SKIP')
#validpgpkeys=('F04DF50737AC1A884C4B3D718380596DA6E59C91') # ALSA Release Team (Package Signing Key v1) <release@alsa-project.org>

prepare() {
  cd alsa-utils
  autoreconf -vfi
}

build() {
  cd alsa-utils
  ./configure --prefix=/usr \
              --disable-alsaconf \
              --sbindir=/usr/bin \
              --with-udev-rules-dir=/usr/lib/udev/rules.d \
	      --disable-alsabat-backend-tiny \
	      --disable-bat \
	      --disable-xmlto \
	      --disable-rst2man
  make
}

package() {
  depends+=('libasound.so' 'libatopology.so' 'libformw.so' 'libmenuw.so'
  'libncursesw.so' 'libpanelw.so' 'libsamplerate.so')
  cd alsa-utils
  make DESTDIR="${pkgdir}" install
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/alsa-utils"
  # dir where to save ALSA state
  install -d "${pkgdir}/var/lib/alsa"
}
