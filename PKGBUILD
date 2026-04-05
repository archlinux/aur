# Maintainer: Inplico UK James@inplico.uk
pkgname=wkgtk-html2pdf
pkgver=1.0.13
pkgrel=2
pkgdesc="C++ Library with CLI tool to convert HTML to PDF, A modern replacement for wkhtmltopdf"
arch=(x86_64)
url="https://github.com/Timh1970/wkgtk-html2pdf"
license=('MIT')
makedepends=('git' 'pkgconf')
depends=('podofo' 'webkit2gtk-4.1' 'webkitgtk-6.0' 'json-c' 'libsystemd' 'xorg-server-xvfb')
conflicts=()
install=wk2gtkpdf.install
source=("https://github.com/Timh1970/wkgtk-html2pdf/archive/v${pkgver}.tar.gz")
sha256sums=('3a08ef5c96bcc41deb6be7f3dfcbcb7047636375b6f7af9419168cdc834926b1')

build() {

	stagedir="${srcdir}/staging"
    rm -rf "${stagedir}"
    mkdir -p "${stagedir}"


    CPPFLAGS="$CPPFLAGS -DPODOFO_010" make -C ${srcdir}/${pkgname}-${pkgver}/src/wk2gtkpdf
	CPPFLAGS="$CPPFLAGS -DPODOFO_010" make -C "${srcdir}/${pkgname}-${pkgver}/src/wk2gtkpdf" install DESTDIR="${stagedir}"

	# library
	rm ${srcdir}/${pkgname}-${pkgver}/src/wk2gtkpdf/*.o

	CPPFLAGS="-DPODOFO_010 -DUSE_WEBKIT_6 $CPPFLAGS" make -C ${srcdir}/${pkgname}-${pkgver}/src/wk2gtkpdf
    CPPFLAGS="-DPODOFO_010 -DUSE_WEBKIT_6 $CPPFLAGS" make -C "${srcdir}/${pkgname}-${pkgver}/src/wk2gtkpdf" install DESTDIR="${stagedir}"
	export PKG_CONFIG_PATH="${stagedir}/usr/lib/pkgconfig:${PKG_CONFIG_PATH:-}"
    export LDFLAGS="-L${stagedir}/usr/lib ${LDFLAGS:-}"
	CPPFLAGS="-I${stagedir}/usr/include -DPODOFO_010 -DUSE_WEBKIT_6 $CPPFLAGS" make -C ${srcdir}/${pkgname}-${pkgver}/src/cli

}

package() {

	CPPFLAGS="-DPODOFO_010 -DUSE_WEBKIT_6 ${CPPFLAGS:-}" make install -C "${srcdir}/${pkgname}-${pkgver}/src/cli" DESTDIR="${pkgdir}"
	CPPFLAGS="-DPODOFO_010 -DUSE_WEBKIT_6 ${CPPFLAGS:-}" make install -C "${srcdir}/${pkgname}-${pkgver}/src/wk2gtkpdf" DESTDIR="${pkgdir}"

	make install -C "${srcdir}/${pkgname}-${pkgver}/src/wk2gtkpdf" DESTDIR="${pkgdir}"
 	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ${srcdir}/${pkgname}-${pkgver}/xvfb.service
 	install -Dm644 -t "$pkgdir/usr/share/polkit-1/rules.d" ${srcdir}/${pkgname}-${pkgver}/50-wk2gtkpdf.rules

	# INSTALL THE EXAMPLES
	cd "$srcdir/$pkgname-${pkgver}/examples"
    # Find every file and install it, recreating the directory structure
    find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/doc/$pkgname/examples/{}" \;

	install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}" ${srcdir}/${pkgname}-${pkgver}/LICENSE

}

