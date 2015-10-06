# Maintainer: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=motion-mrdave-git
pkgver=r654.2caced3
pkgrel=1
pkgdesc="A software motion detector which grabs images from video4linux devices and/or from webcams - Mr-Dave's fork"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.lavrsen.dk/twiki/bin/view/Motion/WebHome"
depends=('libjpeg' 'sqlite' 'ffmpeg')
backup=('etc/motion/motion.conf')
install=motion.install
source=(git+https://github.com/Mr-Dave/motion.git
	motion.service
	motion.tmpfiles)
md5sums=('SKIP'
         'b5b589f8f39939b7a1802cbd9dbe2e1a'
         'f863f8c025f7f025b2178def8418decd')

pkgver() {
  cd "${srcdir}/${pkgname%-mrdave-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-mrdave-git}"
  autoreconf
  ./configure --prefix=/usr \
    --without-pgsql \
    --without-mysql \
    --sysconfdir=/etc/motion \
    --with-ffmpeg
  make
}

package(){
  cd "${srcdir}/${pkgname%-mrdave-git}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/motion.service" "${pkgdir}/usr/lib/systemd/system/motion.service"
  install -Dm644 "${srcdir}/motion.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/motion.conf"
}
