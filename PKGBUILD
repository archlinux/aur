# Maintainer: Inplico UK James@inplico.uk
pkgname=wkgtk-html2pdf
pkgver=0.0.16
pkgrel=0
pkgdesc="C++ Library with CLI tool to convert HTML to PDF, A modern replacement for wkhtmltopdf"
arch=(x86_64)
url="https://github.com/Timh1970/wkgtk-html2pdf"
license=('MIT')
makedepends=(git)
depends=(podofo webkit2gtk-4.1 systemd xorg-server-xvfb)
conflicts=(libicprint)
install=wk2gtkpdf.install
# TESTING
#source=("git+https://github.com/Timh1970/wkgtk-html2pdf.git#branch=testing")
# RC1
#source=("git+https://github.com/Timh1970/wkgtk-html2pdf.git#tag=v${pkgver}-rc1")
source=("https://github.com/Timh1970/wkgtk-html2pdf/archive/refs/tags/v0.0.16-rc1.tar.gz")
sha256sums=('907d66b9d693235e53a704c4ee7939049dddd9d216d3ec8e6f361a45b5a598e5')



build() {

    stagedir="${srcdir}/staging"
    rm -rf "${stagedir}"
    mkdir -p "${stagedir}"

    # library
    make -C "${srcdir}/${pkgname}-${pkgver}-rc1/src/wk2gtkpdf"
    make -C "${srcdir}/${pkgname}-${pkgver}-rc1/src/wk2gtkpdf" install DESTDIR="${stagedir}"

    # command line interface
    export PKG_CONFIG_PATH="${stagedir}/usr/lib/pkgconfig:${PKG_CONFIG_PATH:-}"
    # debug
    # pkg-config --debug --cflags wk2gtkpdf 2>&1 | sed -n '1,200p'
    # pkg-config --cflags --libs wk2gtkpdf

    export CPPFLAGS="-DPODOFO_010 -I${stagedir}/usr/include ${CPPFLAGS:-}"
    export LDFLAGS="-L${stagedir}/usr/lib ${LDFLAGS:-}"

    make -C "${srcdir}/${pkgname}-${pkgver}-rc1/src/cli"

}

package() {

	make install -C "${srcdir}/${pkgname}-${pkgver}-rc1/src/cli" DESTDIR="${pkgdir}"
	make install -C "${srcdir}/${pkgname}-${pkgver}-rc1/src/wk2gtkpdf" DESTDIR="${pkgdir}"
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system" ${srcdir}/${pkgname}-${pkgver}-rc1/xvfb.service
	install -Dm644 -t "$pkgdir/usr/share/polkit-1/rules.d" ${srcdir}/${pkgname}-${pkgver}-rc1/50-wk2gtkpdf.rules
	install -Dm644 -t "$pkgdir/usr/share/wk2gtkpdf/" ${srcdir}/${pkgname}-${pkgver}-rc1/templates/*.css
	install -Dm644 -t "$pkgdir/usr/share/wk2gtkpdf/" ${srcdir}/${pkgname}-${pkgver}-rc1/overflow-monitor.js
	install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname}" ${srcdir}/${pkgname}-${pkgver}-rc1/LICENSE

}

