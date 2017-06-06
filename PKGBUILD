# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=motion-git
_pkgname=motion
pkgver=4.0.r178.ga801f19
pkgrel=1
pkgdesc="A software motion detector which grabs images from video4linux devices and/or from webcams"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL')
url="https://motion-project.github.io/"
depends=('libjpeg' 'v4l-utils' 'ffmpeg')
provides=('motion')
conflicts=('motion')
backup=('etc/motion/motion.conf')
source=($_pkgname::git+https://github.com/Motion-Project/${_pkgname}.git)
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # cutting off 'release-' prefix that presents in the git tag
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc --without-mysql --without-pgsql
  make
}

package(){
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/etc/motion/motion{-dist,}.conf
  mv "${pkgdir}"/etc/motion/camera1{-dist,}.conf
  mv "${pkgdir}"/etc/motion/camera2{-dist,}.conf
  mv "${pkgdir}"/etc/motion/camera3{-dist,}.conf
  mv "${pkgdir}"/etc/motion/camera4{-dist,}.conf
  install -Dm644 "${pkgdir}/usr/share/motion/examples/motion.service" "${pkgdir}/usr/lib/systemd/system/motion.service"
}
