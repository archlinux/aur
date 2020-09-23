# Maintainer: Peter blackman <peter at pblackman dot plus dot com>
# Build xbrzscale with latest version (1.8) of xbrz library

pkgname=xbrzscale
pkgver=1.8
pkgrel=1
pkgdesc="New Generation Image Upscaling Tool"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/atheros/xbrzscale"
url="https://sourceforge.net/projects/xbrz/files/xBRZ/"
license=('GPL3')
depends=(sdl2_image)
options=(buildflags)
source=("$pkgname.tar.gz::https://github.com/atheros/xbrzscale/tarball/master"
	"xbrz-$pkgver.zip::https://sourceforge.net/projects/xbrz/files/xBRZ/xBRZ_1.8.zip/download"
	001-makefile.patch)
sha256sums=('d9175f17781608f472de47265a5c399fc003cc468fd584c11de08b17385d488e'
            'e4e2513801c7097fe9a391b481a48b1890f80e696549d8cf27884bd223a4cba9'
            '1fcd854678da773a1ef87d8e94da1d71604bc64f62d84bdd70339e2945480ebf')


# Replace /xbrz contents
# Apply makefile patch
prepare() {
  rm -fr "$pkgname"
  mv "atheros-$pkgname-b719c2c" "$pkgname"

  rm "$pkgname"/xbrz/*
  mv xbrz.cpp      "$pkgname/xbrz/"
  mv xbrz.h        "$pkgname/xbrz/"
  mv xbrz_config.h "$pkgname/xbrz/"
  mv xbrz_tools.h  "$pkgname/xbrz/"
  mv Changelog.txt "$pkgname/xbrz/"

  cd "$pkgname"
  patch -Np1 < ../../001-makefile.patch
}


build() {
  cd "$pkgname"
  make
}


package() {
  cd "$pkgname"
  install -Dm 755 "$pkgname"         -t "$pkgdir/usr/bin"
  install -Dm 644 xbrz/Changelog.txt -t "$pkgdir/usr/share/doc/$pkgname"
}
