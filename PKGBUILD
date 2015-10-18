pkgname=cartaodecidadao
pkgver=1.26.2
pkgrel=2
pkgdesc="Portuguese Citizen Card Application"
arch=('i686' 'x86_64')
url="http://www.cartaodecidadao.pt/"
license=('custom')
depends=('qt4>=4.5.0' 'pcsclite>=1.5.0' 'openssl' 'ccid')
optdepends=('autenticacao-gov-pt: Necessário para autenticações online')

source=("cartaodecidadao.install")
source_x86_64=("https://www.cartaodecidadao.pt/ccsoftware/cartaodecidadao-ubuntu-${pkgver}-1414.x86_64.deb")
source_i686=("https://www.cartaodecidadao.pt/ccsoftware/cartaodecidadao-ubuntu-${pkgver}-1414.i586.deb")

md5sums=("b716ba8fde53cef3376eedb1a6076cac")
md5sums_x86_64=("06a8e7c60f38f739dd2469c705a48521")
md5sums_i686=("d70efc167675eba20ab8d6467c15374a")

install='cartaodecidadao.install'

prepare() {
	tar -zxf data.tar.gz
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
