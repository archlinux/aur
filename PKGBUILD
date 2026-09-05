# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname='mosaic-ck'
pkgver=2.7ck13
_pkgver=27ck13
pkgrel=2
pkgdesc="One of the first graphical web browsers (unsupported port)"
url='http://www.floodgap.com/retrotech/machten/mosaic/'
license=('custom')
arch=('x86_64')
depends=('openmotif' 'libjpeg-turbo' 'libpng' 'libxmu' 'libxpm' 'zlib')
source=("http://www.floodgap.com/retrotech/machten/mosaic/mosaic${_pkgver}.tar.gz"
#source=("http://www.floodgap.com/retrotech/machten/mosaic/mosaic${_pkgver}-src.zip"
        'fix-prefs-bool.patch'
        'mosaic-png-fix.patch'
        'force-ansi.patch')
sha256sums=('e73857657f48d31b593a5b22ec51e19dea06707fb510a1bb6ba0b0282eaf4a3f'
            '17370e020c3041bd81de883755c0930f248b82c418449194ee9fc9f1ee3ac159'
            '18947f2a6d368d2902dd7b41faeaed8f1bf87f3b0d7da7a9d0dc7206d03df81e'
            '11813a985506adba6440960c34bc701fbc4da2157a30d2ea650d6e1df8f94558')
provides=('mosaic')
conflicts=('ncsa-mosaic-git')

prepare() {
  cd "${srcdir}/${pkgname}"

  # fix a bug in encoding preferences
  patch -p1 < ../fix-prefs-bool.patch
  # from https://slackbuilds.org/repository/15.0/network/mosaic-ck/, lets us use latest libpng
  patch -p1 < ../mosaic-png-fix.patch
  # avoid compilation warnings/errors due to C standard differences
  patch -p1 < ../force-ansi.patch
}

build() {
  cd "${srcdir}/${pkgname}"

  make linux
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm0755 "src/Mosaic"              "$pkgdir/usr/bin/Mosaic"
  #install -Dm0644 "desktop/Mosaic.png"      "$pkgdir/usr/share/icons/Mosaic.png"
  #install -Dm0644 "desktop/Mosaic.desktop"  "$pkgdir/usr/share/applications/Mosaic.desktop"

  # license
  install -Dm0644 "COPYRIGHT"               "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
