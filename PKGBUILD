# Maintainer : Vassilis Palassopoulos <palasso [at] gmail [dot] com>

pkgname=ecere-sdk-git
pkgver=0.44.11.r8.gbb5c404
pkgrel=1
pkgdesc="A SDK for building cross-platform GUI and graphics apps using the eC language"
arch=('i686' 'x86_64')
url="http://ecere.org/"
license=('BSD')
depends=('libxrender' 'libgl' 'giflib' 'libjpeg' 'libpng' 'sqlite' 'alsa-lib' 'ttf-font')
optdepends=('upx: support for compressing built binaries')
makedepends=('git')
provides=('ecere-sdk')
conflicts=('ecere-sdk')
options=('!strip' 'staticlibs')
source=("$pkgname::git://github.com/ecere/ecere-sdk.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make CFLAGS="$(pkg-config libffi --cflags)" ENABLE_SSL=y
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir/" install
  sed -ni '/\ \ \ Copyright/,/SUCH\ DAMAGE/p' LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}/usr/share/ecere/samples" -type d -exec chmod -R 755 '{}' \;
  find "${pkgdir}/usr/share/ecere/samples" -type f -exec chmod -R 644 '{}' \;
  chmod 644 "${pkgdir}/usr/lib/libecereVanilla.a"
}