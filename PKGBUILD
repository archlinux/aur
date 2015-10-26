# Maintainer: Todd Partridge <toddrpartridge@gmail.com>

pkgname=worldofgoo-gootool
_pkgname=gootool
pkgver=1.0.3.441
pkgrel=2
pkgdesc="World of Goo level creator and installer"
arch=(any)
url="http://goofans.com/download/utility/$_pkgname"
license=('custom')
depends=('java-runtime')
optdepends=('worldofgoo')
conflicts=('gootool')
install="$pkgname.install"
source=(http://goofans.com/download/145/1255/gootool_$pkgver-1_all.deb
  application-x-goomod.xml
  gootool.desktop)
md5sums=('31579d7bc2526e6bad07e36950b93d11'
  'a2d4a46c158e5c80bf4ac10b43b4100d'
  '0461706a2a607fe39b701d3ccbc67b0f')

build() {
  # Create build directory
  [ -d $pkgname-$pkgver ] || mkdir $pkgname-$pkgver

  # Extract archive
  bsdtar -xf gootool_$pkgver-1_all.deb      || return 1
  bsdtar -xf data.tar.gz -C $pkgname-$pkgver || return 1

  # Bugfix: Startup script only checks for sun jdk, ugly fix, disabling check
  sed -i '24 s/^    exit 1/#    exit 1/' ${srcdir}/$pkgname-$pkgver/usr/bin/gootool
}

package() {
  install -D -m644 "${srcdir}/application-x-goomod.xml" "${pkgdir}/usr/share/mime/packages/application-x-goomod.xml"
  install -D -m644 "${srcdir}/gootool.desktop" "${pkgdir}/usr/share/applications/gootool.desktop"

  # Copy program
  cp -r ${srcdir}/$pkgname-$pkgver/* ${pkgdir}
}

