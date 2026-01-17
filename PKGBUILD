# Maintainer: Inplico UK James@inplico.uk
pkgname=wkgtk-html2pdf
pkgver=0.0.10
pkgrel=0
epoch=
pkgdesc="wk2gtkpdf cpp library and command line interface"
arch=(x86_64)
url="https://github.com/Timh1970/wkgtk-html2pdf"
license=('MIT')
groups=()
depends=(webkit2gtk-4.1 systemd xorg-server-xvfb)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(libicprint)
replaces=()
backup=()
options=()
install=wk2gtkpdf.install
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Timh1970/wkgtk-html2pdf/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('a9b840a1aca075362c570d1e69f772893b62de5f5976426adc8e8f610701b1dd')



build() {

# Build the library
	make -C ${srcdir}/${pkgname}-${pkgver}/src/wk2gtkpdf

# Build the command line interface
	USER_LIBDIR="-L${srcdir}/${pkgname}-${pkgver}/src/wk2gtkpdf -lwk2gtkpdf"
	USER_INCDIR="-I${srcdir}/${pkgname}-${pkgver}/src"
	make USER_LIBDIR="$USER_LIBDIR" USER_INCDIR="$USER_INCDIR" -C ${srcdir}/${pkgname}-${pkgver}/src/cli

}

package() {

	make install -C "${srcdir}/${pkgname}-${pkgver}/src/cli" DESTDIR="${pkgdir}"
	make install -C "${srcdir}/${pkgname}-${pkgver}/src/wk2gtkpdf" DESTDIR="${pkgdir}"
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ${srcdir}/${pkgname}-${pkgver}/xvfb.service
	install -Dm644 -t "$pkgdir/usr/share/polkit-1/rules.d" ${srcdir}/${pkgname}-${pkgver}/50-wk2gtkpdf.rules
	install -Dm644 -t "$pkgdir/usr/share/wk2gtkpdf/" ${srcdir}/${pkgname}-${pkgver}/templates/*.css
	install -Dm644 -t "$pkgdir/usr/lib/pkgconfig" ${srcdir}/${pkgname}-${pkgver}/wk2gtkpdf.pc
	install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}" ${srcdir}/${pkgname}-${pkgver}/LICENSE


}

