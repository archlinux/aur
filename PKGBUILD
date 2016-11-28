# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=libagar
pkgver=1.5.0
pkgrel=1
pkgdesc='A  compact, efficient and fully thread-safe cross-platform GUI toolkit, styled using CSS'
arch=('i686' 'x86_64')
url="http://libagar.org/"
license=('BSD')
depends=('freetype2' 'fontconfig' 'sdl' 'libxinerama' 'libgl' 'libpng' 'libjpeg' 'libsndfile')
makedepends=('mesa')
source=("http://stable.hypertriton.com/agar/agar-$pkgver.tar.gz"
        "http://stable.hypertriton.com/agar/agar-$pkgver.tar.gz.asc")
sha256sums=('82342ded342c578141984befe9318f3d376176e5f427ae3278f8985f26663c00'
            'SKIP')
validpgpkeys=('8F28B81160F8C10E53EBF5F13AF102AD3D6A0EB9'
              'CB9457749A4E7A9AECF43B20F5BB8092C0BB1FFA')
#options=(libtool staticlibs)

prepare() {
  # avoid a deprecation warning
  sed 's/-D_BSD_SOURCE/-D_DEFAULT_SOURCE/g' -i agar-$pkgver/configure
}

build() {
  cd agar-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man --enable-nls --disable-legacy
  make depend
  make all
}

package() {
  cd agar-$pkgver

  install -d "$pkgdir"/usr/bin
  make DESTDIR="$pkgdir/" install

  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 README RELEASE-$pkgver Logo.png "$pkgdir"/usr/share/doc/$pkgname

  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE LICENSE-Vera "$pkgdir"/usr/share/licenses/$pkgname

  # cleanup empty man folders
  find "$pkgdir"/usr/share/man -type d -empty -delete
}

