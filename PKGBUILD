# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ivtv-utils
pkgver=1.4.1
pkgrel=7
pkgdesc="Userspace utilities for Hauppauge PVR cards"
arch=('x86_64')
license=('GPL')
url="http://ivtvdriver.org"
# source=("http://dl.ivtvdriver.org/ivtv/stable/${pkgname}-${pkgver}.tar.gz"
#         "http://dl.ivtvdriver.org/ivtv/firmware/ivtv-firmware.tar.gz")
source=("http://http.debian.net/debian/pool/contrib/i/$pkgname/${pkgname}_${pkgver}.orig.tar.gz"
        "http://pkgs.fedoraproject.org/repo/pkgs/ivtv-firmware/ivtv-firmware-20080701.tar.gz/b9a871f1c569025be9c48a77b3515faf/ivtv-firmware-20080701.tar.gz")
depends=('gcc-libs')
md5sums=('3a4219d698262ca2b28e41f0f547b0a2'
         'b9a871f1c569025be9c48a77b3515faf')
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  cd "${srcdir}"
  for file in v4l-cx2341x-dec.fw  v4l-cx2341x-enc.fw v4l-pvrusb2-24xxx-01.fw  v4l-pvrusb2-29xxx-01.fw v4l-cx2341x-init.mpg; do
    install -D -m644 $file "${pkgdir}/usr/lib/firmware/$file"
  done

  # FS#15133 - files already provided by the kernel-headers package
  rm -rf "${pkgdir}"/usr/include
  # Resolve conflict with v4l-utils
  rm -f "${pkgdir}"/usr/bin/v4l2-ctl
}
