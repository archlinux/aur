# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=cartaodecidadao-reorganized
pkgver=1.61.0
pkgrel=1
pkgdesc="Portuguese Citizen Card Application"
arch=('i686' 'x86_64')
url="http://www.cartaodecidadao.pt/"
license=('custom')
depends=('qt4>=4.5.0' 'pcsclite>=1.5.0' 'openssl>=0.9.8' 'ccid>=1.3.0' 'jasper')
optdepends=('autenticacao-gov-pt: Necessário para autenticações online'
            'cartaodecidadao-pki: PKI que confirma a validade dos certificados dos CC'
            'ecce-gov-pt-certificates: Certificados da ECCE (quem assina dos certificados contidos em cartaodecidadao-pki)')

source=("${pkgname}.desktop"
        "${pkgname}-trayapplet.desktop")
source_x86_64=("https://www.cartaodecidadao.pt/ccsoftware/cartaodecidadao-ubuntu.amd64.deb")
source_i686=("https://www.cartaodecidadao.pt/ccsoftware/cartaodecidadao-ubuntu.i386.deb")

md5sums=('e868340d6e07dd66ccfed4ce8e1c4203'
         '606efaa093687f2ed1dcc9baba200270')
md5sums_i686=('115be572c30ccc35028bf878c4300b9e')
md5sums_x86_64=('630442660ffc7419a6d8c82a40c1f8cc')


prepare() {
	tar -xf data.tar.xz
	tar -xf control.tar.gz
}

package() {
	msg2 "Moving stuff in place..."
	
	# Move binaries
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	mv "${srcdir}/usr/local/bin" "${pkgdir}/usr/share/${pkgname}/"
	mv "${srcdir}/usr/local/lib" "${pkgdir}/usr/share/${pkgname}/"
	mv "${srcdir}/usr/local/include" "${pkgdir}/usr/"

	# Create symlinks
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib"
	ln -s "/usr/share/${pkgname}/bin/pteiddlgsrv" "${pkgdir}/usr/bin/"
	ln -s "/usr/share/${pkgname}/bin/pteidgui" "${pkgdir}/usr/bin/"
	ln -s "/usr/share/${pkgname}/bin/pteidtrayapplet" "${pkgdir}/usr/bin/"
	ln -s "/usr/share/${pkgname}/lib/libpteid.so.1.61.0" "${pkgdir}/usr/lib/libpteid.so"
	ln -s "/usr/share/${pkgname}/lib/libpteid.so.1.61.0" "${pkgdir}/usr/lib/libpteid.so.1"
	ln -s "/usr/share/${pkgname}/lib/libpteiddlg.so.1.61.0" "${pkgdir}/usr/lib/libpteiddlg.so"
	ln -s "/usr/share/${pkgname}/lib/libpteiddlg.so.1.61.0" "${pkgdir}/usr/lib/libpteiddlg.so.1"
	ln -s "/usr/share/${pkgname}/lib/libpteidhttps.so.1.61.0" "${pkgdir}/usr/lib/libpteidhttps.so"
	ln -s "/usr/share/${pkgname}/lib/libpteidhttps.so.1.61.0" "${pkgdir}/usr/lib/libpteidhttps.so.1"
	ln -s "/usr/share/${pkgname}/lib/libpteidlibopensc.so.1.61.0" "${pkgdir}/usr/lib/libpteidlibopensc.so"
	ln -s "/usr/share/${pkgname}/lib/libpteidlibopensc.so.1.61.0" "${pkgdir}/usr/lib/libpteidlibopensc.so.1"
	ln -s "/usr/share/${pkgname}/lib/libpteidpkcs11.so.1.61.0" "${pkgdir}/usr/lib/libpteidpkcs11.so"
	ln -s "/usr/share/${pkgname}/lib/libpteidpkcs11.so.1.61.0" "${pkgdir}/usr/lib/libpteidpkcs11.so.1"

	# Move images to apps icons
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
	cp "${pkgdir}/usr/share/${pkgname}/bin/images/app.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"

	# Fix .desktop files
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/etc/xdg/autostart"
	cp "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
	cp "${srcdir}/${pkgname}-trayapplet.desktop" "${pkgdir}/usr/share/applications/"
	cp "${srcdir}/${pkgname}-trayapplet.desktop" "${pkgdir}/etc/xdg/autostart/"

	# License
	install -D -m644 copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

