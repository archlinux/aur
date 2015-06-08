# Maintainer : Vassilis Palassopoulos <palasso [at] gmail [dot] com>

pkgname=ecere-sdk
pkgver=0.44.11
pkgrel=1
pkgdesc="A SDK for building cross-platform GUI and graphics apps using the eC language"
arch=('i686' 'x86_64')
url="http://ecere.org/"
license=('BSD')
depends=('libxrender' 'libgl' 'giflib' 'libjpeg' 'libpng' 'sqlite' 'alsa-lib' 'ttf-font')
optdepends=('upx: support for compressing built binaries')
provides=('ecere-sdk')
conflicts=('ecere-sdk-git')
options=('!strip' 'staticlibs')
source=("https://github.com/ecere/ecere-sdk/archive/${pkgver}.tar.gz")
md5sums=('3c81cdfd86b94766a2bf89f66423ab7f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make CFLAGS="$(pkg-config libffi --cflags)" ENABLE_SSL=y
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  sed -ni '/\ \ \ Copyright/,/SUCH\ DAMAGE/p' LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}/usr/share/ecere/samples" -type d -exec chmod -R 755 '{}' \;
  find "${pkgdir}/usr/share/ecere/samples" -type f -exec chmod -R 644 '{}' \;
  chmod 644 "${pkgdir}/usr/lib/libecereVanilla.a"
}