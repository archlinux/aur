# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor : Vassilis Palassopoulos <palasso [at] gmail [dot] com>

pkgname=ecere-sdk-git
pkgver=0.44.15.r1049.gbd87e691
pkgrel=1
pkgdesc="A SDK for building cross-platform GUI and graphics apps using the eC language"
arch=('i686' 'x86_64')
url="https://ecere.org/"
license=('BSD')
depends=('libxrender' 'libgl' 'giflib' 'libjpeg' 'libpng' 'sqlite' 'alsa-lib' 'ttf-font')
optdepends=('upx: support for compressing built binaries')
makedepends=('git')
provides=('ecere-sdk')
conflicts=('ecere-sdk')
options=('!strip' 'staticlibs')
source=("$pkgname::git+https://github.com/ecere/ecere-sdk.git")
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