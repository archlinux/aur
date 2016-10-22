# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=cartaodecidadao
pkgver=1.61.0
pkgrel=2
pkgdesc="Portuguese Citizen Card Application"
arch=('i686' 'x86_64')
url="http://www.cartaodecidadao.pt/"
license=('custom')
depends=('qt4>=4.5.0' 'pcsclite>=1.5.0' 'openssl' 'ccid')
optdepends=('autenticacao-gov-pt: Necessário para autenticações online'
			'cartaodecidadao-pki: PKI que confirma a validade dos certificados dos CC'
			'ecce-gov-pt-certificates: Certificados da ECCE (quem assina dos certificados contidos em cartaodecidadao-pki)')

source_x86_64=("https://www.cartaodecidadao.pt/ccsoftware/cartaodecidadao-ubuntu-16+.amd64.deb")
source_i686=("https://www.cartaodecidadao.pt/ccsoftware/cartaodecidadao-ubuntu-16+.i386.deb")

md5sums_i686=('fc3590b8b95238291193eaa508a36b02')
md5sums_x86_64=('9bbb0718fdc48133de15ee68a781f84c')

prepare() {
	tar -xf data.tar.xz
}

package() {
	# Fix desktop files
	sed -i -e "s|/local||g" ${srcdir}/usr/share/applications/*
	sed -i -e "s|bin/images/app.png|share/pixmaps/cartaodecidadao.png|g" ${srcdir}/usr/share/applications/*

	# Move binaries out of local
	cp -r ${srcdir}/usr/local/* ${srcdir}/usr/
	rm -r ${srcdir}/usr/local

	# Move images to pixmaps
	mkdir -p ${pkgdir}/usr/share/pixmaps/
	mv ${srcdir}/usr/bin/images/app.png ${pkgdir}/usr/share/pixmaps/cartaodecidadao.png

	# remove uneeeded stuff
	rm -rf ${srcdir}/etc
	rm ${srcdir}/usr/bin/arranque.sh
	rm -rf ${srcdir}/usr/{local,}/bin/images

	# Fix some filenames
	mv "${srcdir}/usr/share/applications/Aplicação da Área da Notificação.desktop" "${srcdir}/usr/share/applications/areadenotificacao.desktop"
	mv "${srcdir}/usr/share/applications/Cartão de Cidadão.desktop"	"${srcdir}/usr/share/applications/cartaodecidadao.desktop"

	# Add missing link to file
	ln -sr ${srcdir}/usr/lib/libpteiddlg.so.1 ${srcdir}/usr/lib/libpteiddlg.so

	# Move everything to install dir
	cp -r ${srcdir}/usr* ${pkgdir}
}
