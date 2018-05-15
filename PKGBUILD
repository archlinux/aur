# $Id: PKGBUILD 273896 2017-12-11 20:04:09Z jlichtblau $
# Maintainer: Evgeny Kurnevsky <kurnevsky@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=motion
pkgver=4.1.1
pkgrel=3
pkgdesc="A software motion detector which grabs images from video4linux devices and/or from webcams"
arch=('x86_64' 'i686' 'armv7h' 'armv6h')
license=('GPL')
url="https://motion-project.github.io"
depends=('sqlite' 'ffmpeg')
backup=('etc/motion/motion.conf')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Motion-Project/motion/archive/release-$pkgver.tar.gz"
  "ffmpeg.patch"
)
sha256sums=(
  '2074b935bdfe28f84c2c3233274b06908336778f303bb13530d4299c3f8aa4e2'
  '14302daa63c0cdc8b0f1e7a8c790e254797b6f97e25bf9b8fab0453029151cbc'
)

prepare() {
  cd "${srcdir}/${pkgname}-release-${pkgver}"
  patch -Np1 -i "${srcdir}/ffmpeg.patch"
}

build() {
  cd "${srcdir}/${pkgname}-release-${pkgver}"
  autoreconf
  ./configure --prefix=/usr \
    --without-pgsql \
    --without-mysql \
    --sysconfdir=/etc \
    --with-ffmpeg \
    --with-webp
  make
}

package(){
  cd "${srcdir}/${pkgname}-release-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "motion-dist.conf" "${pkgdir}/etc/motion/motion.conf"
  install -Dm644 "motion.service" "${pkgdir}/usr/lib/systemd/system/motion.service"
}
