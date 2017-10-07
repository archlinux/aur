# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: davideddu <me at davideddu dot org>

pkgname=scuolabook
_intpkgname=Scuolabook
pkgver=3.2.0
pkgrel=1
pkgdesc="Puoi leggere su computer desktop, sul portatile e sul tablet i tuoi libri scolastici digitali."
arch=('x86_64')
url="http://www.scuolabook.it/applicazioni"
license=('custom')
depends=("gst-plugins-bad" "libpulse" "nss" "mesa" "libxrandr" "qt5-svg" "qt5-webkit")

source=(license http://s3.amazonaws.com/scuolabook_support/"$_intpkgname"_"$pkgver"_16.04_amd64.deb)
md5sums=('94f26429ae1b95e18457020be1d7dc08'
         'f1d8bdce890fd85311e56bf165bb750c')

noextract=("$_intpkgname"_"$pkgver"_16.04_amd64.deb)

prepare() {
  cd "$srcdir"
  msg2 "Decompressing Debian package..."
  ar xv "$_intpkgname"_"$pkgver"_*.deb > /dev/null
  tar -xf data.tar.xz > /dev/null
  tar -xf control.tar.gz > /dev/null
  msg2 "Checking archive integrity..."
  md5sum -c md5sums > /dev/null

  # i know, i know...
  ln -s /usr/lib/libpcre16.so ./opt/scuolabook/libpcre16.so.3
}

package() {
  cd "$srcdir"
  install -D -m644 license "${pkgdir}/usr/share/licenses/${pkgname}/license"
  install -dm755 "$pkgdir"/usr/share/{applications,doc,doc/${pkgname},icons}
  install -m644 usr/share/applications/${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
  install -m644 usr/share/doc/${pkgname}/changelog.gz "$pkgdir"/usr/share/doc/${pkgname}/changelog.gz
  install -m644 usr/share/doc/${pkgname}/copyright "$pkgdir"/usr/share/doc/${pkgname}/copyright
  install -m644 usr/share/icons/${pkgname}.png "$pkgdir"/usr/share/icons/${pkgname}.png

  cp -dpr --no-preserve=ownership opt "$pkgdir"
}
