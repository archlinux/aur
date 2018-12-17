# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=cartaodecidadao-v1
pkgver=1.61.0
pkgrel=3
pkgdesc="Portuguese Citizen Card Application"
arch=('i686' 'x86_64')
url="http://www.cartaodecidadao.pt/"
license=('custom')
depends=('qt4>=4.5.0' 'pcsclite>=1.5.0' 'openssl' 'ccid')
optdepends=('autenticacao-gov-pt: Necessário para autenticações online'
			'cartaodecidadao-pki: PKI que confirma a validade dos certificados dos CC'
			'ecce-gov-pt-certificates: Certificados da ECCE (quem assina dos certificados contidos em cartaodecidadao-pki)')

source_x86_64=("https://www.autenticacao.gov.pt/documents/10179/11962/Aplica%C3%A7%C3%A3o+do+Cart%C3%A3o+de+Cidad%C3%A3o+%28Linux+-+Ubuntu+-+64+bits%29%20%28v.1.61.0%29%20Jan+2016/013924f5-dee7-4eeb-ac82-ef81e3db1dec")
source_i686=("https://www.autenticacao.gov.pt/documents/10179/11962/Aplica%C3%A7%C3%A3o+do+Cart%C3%A3o+de+Cidad%C3%A3o+%28Linux+-+Ubuntu+-+32+bits%29%20%28v.1.61.0%29%20Jan+2016/e69e59f5-781d-4095-bdd4-9c1c8af8cb1a")

md5sums_i686=('115be572c30ccc35028bf878c4300b9e')
md5sums_x86_64=('630442660ffc7419a6d8c82a40c1f8cc')

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
