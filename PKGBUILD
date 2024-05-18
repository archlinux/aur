# Maintainer: Vadim Kaushan <admin@disasm.info>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lms
pkgver=3.53.1
pkgrel=1
pkgdesc='Lightweight Music Server. Access your self-hosted music using a web interface'
arch=('x86_64')
url='https://github.com/epoupon/lms'
license=('GPL3')
depends=('ffmpeg'
         'libarchive'
         'libconfig'
         'taglib'
         'wt')
makedepends=('cmake' 
             'wt'
             'boost'
             'gtest'
             'graphicsmagick')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/epoupon/lms/archive/v${pkgver}.tar.gz"
        "0001-UpperCaseValidator-add-missing-header.patch"
        "lms.sysusers"
        "lms.tmpfiles")
sha256sums=('f661d0133d98882a76d39db0b7d3d25bf4ff04a6d5ac9116fa6dec808140d296'
            'bfd2e63df871cb0e691194bae21f3d1a6d11d31d04cfe1d78c35a5cd7ed67282'
            '9d26489cb828576c8c2296821d52f3a453b2c9d63cdace425e3f312e190601d6'
            '32f537bf3480fbe55d0a9929ba633718fbc16887a68e0ba1a2b3b265c400ed41')
backup=("etc/lms.conf")

prepare() {
  cd "$srcdir/$pkgname-$pkgver/"
  patch --forward -p1 --input="${srcdir}/0001-UpperCaseValidator-add-missing-header.patch"
}

build() {
  mkdir "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DLMS_IMAGE_BACKEND=graphicsmagick ..
  make
}

package() {
  install -d "$pkgdir/var/lib/lms"
  install -D -m 644 "lms.sysusers" "$pkgdir/usr/lib/sysusers.d/lms.conf"
  install -D -m 644 "lms.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/lms.conf"

  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
  install -D -m 644 "$pkgdir/usr/share/lms/lms.conf" "$pkgdir/etc/lms.conf"
  sed -i "s|/var/lms|/var/lib/lms|g" "$pkgdir/etc/lms.conf"
  install -D -m 644 "$pkgdir/usr/share/lms/default.service" "$pkgdir/usr/lib/systemd/system/lms.service"
}
# vim:set ts=2 sw=2 et:
