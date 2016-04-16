# Maintainer: Olaf Bauer <obauer@freenet.de>

_kernver="$(uname -r)"
pkgname=v4l-dvb-git
pkgver=r660.a9c762b
pkgrel=2
pkgdesc="V4L-DVB device drivers"
arch=('i686' 'x86_64')
url="http://linuxtv.org/"
license=('GPL')
makedepends=('linux-headers' 'perl-proc-processtable' 'patchutils' 'git' 'wget')
options=(!makeflags)
install=v4l-dvb.install
source=('git://linuxtv.org/media_build.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/media_build"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/media_build"
  make download untar
}

build() {
  cd "${srcdir}/media_build"
  make KERNELRELEASE=${_kernver}
}

package() {
  cd "${srcdir}/media_build"
  sed -i '/^[^#].*depmod/s/^/#/' v4l/Makefile.media
  make KERNELRELEASE=${_kernver} KDIR26="/lib/modules/${_kernver}/updates" \
       DESTDIR="${pkgdir}/usr" FW_DIR="${pkgdir}/usr/lib/firmware/updates/" install
}

