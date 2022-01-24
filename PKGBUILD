# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Lara Maia <lara@craft.net.br>
pkgname=alsamixergui
pkgver=0.9.0rc2
pkgrel=6
pkgdesc="FLTK based mixer program for use with ALSA."
arch=('i686' 'x86_64')
url='https://github.com/LaraCraft304/alsamixergui'
license=('GPL')
depends=('fltk' 'alsa-lib')
#source=('https://github.com/LaraCraft304/alsamixergui/archive/0.9.1.tar.gz'
source=("http://ftp.de.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_${pkgver}-1.orig.tar.gz"
	"http://ftp.de.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_${pkgver}-1-9.1.diff.gz"
	strsignal.patch
        "${pkgname}.desktop"
        "${pkgname}.xpm")
md5sums=('af942a41b81ba27e2e4d0a1e1ab0decb'
         '957c643604cc537eb547b9c7978d476d'
         'ff44a5223efec322a11c9e9ac29902cb'
         '723f64293c24a7283d3d4b3dca442958'
         'ac46a80f8f5ea954e4dd70ef806d1374')

prepare() {
  [ -f ${pkgname}_${pkgver}-1-9.1.diff ] || \
    gzip -dc ${pkgname}_${pkgver}-1-9.1.diff.gz > ${pkgname}_${pkgver}-1-9.1.diff
  cd ${pkgname}-$pkgver-1.orig
  patch -Np1 -b -z .orig -i ../${pkgname}_${pkgver}-1-9.1.diff
  patch -Np2 -b -z .was -i ../strsignal.patch
  chmod +x configure
}

build() {
  cd ${pkgname}-$pkgver-1.orig
  ./configure
  make
}

package() {
  cd ${pkgname}-$pkgver-1.orig
  make install DESTDIR="$pkgdir"
  install -Dm644 ../${pkgname}.xpm "$pkgdir"/usr/share/pixmaps/${pkgname}.xpm 
  install -Dm644 ../${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
}
