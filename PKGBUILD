#Mantainer: Carlos Rivera (Comanshark) <comanshark at openmailbox dot org>
#Autor: Jose Manuel Diez Botella (dibosa) <dibosa at users dot sourceforge dot net>
pkgname=keme
pkgver=3.0.3.4
pkgrel=1
pkgdesc="Open source accounting application"
arch=('i686' 'x86_64')
url="http://keme.sourceforge.net"
license=('GPL')
depends=('qt5-base' 'texlive-core' 'texlive-latexextra' 'sqlite')
optdepends=('postgresql: for PostgreSQL Database' 'mysql: for MySQL Database' 'okular: for document viewer' 'kile: for Tex/Latex frontend')
source=("$pkgname-$pkgver.tar.gz"::"http://sourceforge.net/projects/$pkgname/files/KEME-Contabilidad/${pkgver}/${pkgname}5_$pkgver.tar.gz/download"
	"keme.install"
	"desktop.patch")
md5sums=('32337c8c731e64a97fd6360ddd088bfe'
         '5edc6b36dfb458f7546603faef67b01a'
         'fae9794370e771dd03e94ec084b5ce98')
install=keme.install

prepare() {
mv "${pkgname}5/factur.pro" "${pkgname}5/facture.pro"
## Avoids a mistake as factur confused when compiling a subdirectory of the same name.
patch "${pkgname}5/applications/KEME-Contabilidad.desktop" < desktop.patch
## fix error in the ".desktop" of the application
}
build() {
cd "${pkgname}5"
qmake-qt5 keme5.pro
make	|| return 1
qmake-qt5 facture.pro
make	|| return 1
## Compilation of accounting software and it's billing module.
}
package() {
install -Dm755 "${pkgname}5/keme5" "$pkgdir/usr/bin/keme5"
install -Dm755 "${pkgname}5/facture" "$pkgdir/usr/bin/factur"
install -Dm644 "${pkgname}5/applications/KEME-Contabilidad.desktop" "$pkgdir/usr/share/applications/KEME-Contabilidad.desktop"
install -Dm644 "${pkgname}5/applications/KEME-Factur.desktop" "$pkgdir/usr/share/applications/KEME-Factur.desktop"
install -Dm644 "${pkgname}5/pixmaps/keme.xpm" "$pkgdir/usr/share/pixmaps/keme.xpm"
install -Dm644 "${pkgname}5/pixmaps/factur.xpm" "$pkgdir/usr/share/pixmaps/factur.xpm"
## Installing applications, launchers and icons.
}
