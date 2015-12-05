# Maintainer : Remy van Elst
# https://raymii.org

pkgname=scrt
pkgver=7.3.6
incrver=963
pkgrel=1
pkgdesc="Vandyke SecureCRT SSH Client"
arch=('x86_64' 'i686')
url="http://www.vandyke.com/products/securecrt/"
license=('custom')

depends=('openssl' 'glibc' 'qt4')
		
source_x86_64=("${pkgname}-${pkgver}.${incrver}.ubuntu13-64.tar.gz::file://${pkgname}-${pkgver}.${incrver}.ubuntu13-64.tar.gz")
md5sums_x86_64=('dbc351b0082d00581d9889cc71aa70a2')
source_i686=("${pkgname}-${pkgver}.${incrver}.ubuntu13.tar.gz::file://${pkgname}-${pkgver}.${incrver}.ubuntu13.tar.gz")
md5sums_i686=('8c4aa8a386e9a0e9cd160a24bc95d9d3')
options=('!strip')

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	
	install -Dm 755 ./SecureCRT ${pkgdir}/usr/lib/securecrt/SecureCRT
	
	echo '#!/bin/sh' > "${pkgdir}/usr/lib/securecrt/run.sh"
	echo '[[ -z "$LD_LIBRARY_PATH" ]] && export LD_LIBRARY_PATH=/usr/lib/securecrt || export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/securecrt' >> "${pkgdir}/usr/lib/securecrt/run.sh"
	echo 'exec /usr/lib/securecrt/`basename "$0"` "$@"'  >> "${pkgdir}/usr/lib/securecrt/run.sh"
	chmod +x "${pkgdir}/usr/lib/securecrt/run.sh"
	mkdir -p "$pkgdir/usr/bin/"
	ln -s /usr/lib/securecrt/run.sh "$pkgdir/usr/bin/SecureCRT"
	
	install -Dm 644 ./libQtCore.so.4  ${pkgdir}/usr/lib/securecrt/libQtCore.so.4
	install -Dm 644 ./libQtDBus.so.4  ${pkgdir}/usr/lib/securecrt/libQtDBus.so.4
	install -Dm 644 ./libQtGui.so.4  ${pkgdir}/usr/lib/securecrt/libQtGui.so.4
	install -Dm 644 ./libQtNetwork.so.4  ${pkgdir}/usr/lib/securecrt/libQtNetwork.so.4

	install -Dm 644 ./SecureCRT.desktop ${pkgdir}/usr/share/applications/SecureCRT.desktop
	install -Dm 644 ./securecrt_64.png ${pkgdir}/usr/share/vandyke/data/securecrt_64.png

	install -Dm 644 ./SecureCRT_HISTORY.txt ${pkgdir}/usr/share/doc/securecrt/SecureCRT_HISTORY.txt
	install -Dm 644 ./SecureCRT_README.txt ${pkgdir}/usr/share/doc/securecrt/SecureCRT_README.txt
	install -Dm 644 ./SecureCRT_EULA.txt ${pkgdir}/usr/share/doc/securecrt/SecureCRT_EULA.txt 
	cp -r ./SecureCRTHelp ${pkgdir}/usr/share/doc/securecrt/
	
	install -Dm 644 ./changelog.Debian.gz ${pkgdir}/usr/share/doc/securecrt/changelog.Debian.gz

}
