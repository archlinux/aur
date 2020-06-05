# Maintainer = Caleb Yates (caldog20@gmail.com)
# SecureCRT software is owned and copyrighted by Vandyke Inc. The software is free to download for eval and requires a separately purchased license for full features and support
 
## To install this package, you need to download the SecureCRT for Linux package in tar.gz format and place it in the same directory as the PKGBUILD

## Ensure the 'pkgver' and 'incrver' variables are updated below to match your package version

pkgname=scrt
pkgver=8.7.2
incrver=2214
pkgrel=1
pkgdesc="Vandyke SecureCRT SSH Client"
arch=('x86_64')
url="http://www.vandyke.com/products/securecrt/"
license=('custom')

depends=('openssl' 'glibc' 'qt5-base' 'icu63')
		
source=("local://${pkgname}-${pkgver}.${incrver}.ubuntu19-64.tar.gz")
md5sums=('55f77c1d82f5ddec4ee08f0a6b973f69')
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

	install -Dm 644 ./SecureCRT.desktop ${pkgdir}/usr/share/applications/SecureCRT.desktop
	install -Dm 644 ./securecrt_64.png ${pkgdir}/usr/share/vandyke/data/securecrt_64.png

	install -Dm 644 ./SecureCRT_HISTORY.txt ${pkgdir}/usr/share/doc/securecrt/SecureCRT_HISTORY.txt
	install -Dm 644 ./SecureCRT_README.txt ${pkgdir}/usr/share/doc/securecrt/SecureCRT_README.txt
	install -Dm 644 ./SecureCRT_EULA.txt ${pkgdir}/usr/share/doc/securecrt/SecureCRT_EULA.txt 
	cp -r ./SecureCRTHelp ${pkgdir}/usr/share/doc/securecrt/
	
	install -Dm 644 ./changelog.Debian.gz ${pkgdir}/usr/share/doc/securecrt/changelog.Debian.gz

}
