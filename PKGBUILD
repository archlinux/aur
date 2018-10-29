# Maintainer: Evgeny Kurnevsky <kurnevsky@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=motion
pkgver=4.2
pkgrel=1
pkgdesc="A software motion detector which grabs images from video4linux devices and/or from webcams"
arch=('x86_64' 'i686' 'armv7h' 'armv6h' 'aarch64')
license=('GPL')
url="https://motion-project.github.io"
depends=('sqlite' 'ffmpeg' 'libmicrohttpd' 'libwebp')
optdepends=('gettext: native language support')
backup=('etc/motion/motion.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Motion-Project/motion/archive/release-$pkgver.tar.gz"
        'motion.service'
        'motion.sysusers'
        'motion.tmpfiles')
sha256sums=('6ef8504fc5be00a49c82c4045c0004fbf575d9a5df8687025a9b06923efda2a9'
            'a78dba35414f4d7147cc2c622eecdb3df249978023cbea5c6bc420c34ca387e7'
            '353fe3c2ee0afb7dafe1c6b7d1ac5655449dab836ab387cf335b4bd1dd37bf27'
            'b34eaf6b085a25ef310102f892d0909247f1acb9d6a75cc9faca85e1ef076a1c')

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
  install -Dm644 "${srcdir}/motion.service" "${pkgdir}/usr/lib/systemd/system/motion.service"
  install -Dm644 "${srcdir}/motion.sysusers" "${pkgdir}/usr/lib/sysusers.d/motion.conf"
  install -Dm644 "${srcdir}/motion.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/motion.conf"
}
