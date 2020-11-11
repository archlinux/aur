# Maintainer = Skip Barker (skipbarker@gmail.com)
# Contributer: Kabir Sala <aur AT mail DOT ksala DOT eu>
# Inspired by the 'scrt' package by Remy van Elst (https://aur.archlinux.org/packages/scrt/)
# SecureCRT+SecureFX software is commercial software by Vandyke Inc. 
## To install this package, you need to download scrt-sfx-8.7.3.2279.ubuntu19-64.tar.gz and place it in the same directory as the PKGBUILD

pkgname=scrt-sfx
pkgver=8.7.3
incrver=2279
pkgrel=1
pkgdesc="Vandyke SecureCRT+SecureFX SSH / SFTP Client"
arch=('x86_64')
url="http://www.vandyke.com/products/securecrt/"
license=('custom')

depends=('openssl' 'glibc' 'qt5-base' 'icu63' 'python2')
		
source=("local://${pkgname}-${pkgver}.${incrver}.ubuntu19-64.tar.gz")
md5sums=('013d9c16163ef344628db444c38c0384')
options=('!strip')

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	
	install -Dm 755 ./SecureCRT ${pkgdir}/usr/lib/securecrt/SecureCRT
	install -Dm 755 ./SecureFX ${pkgdir}/usr/lib/securefx/SecureFX
	
	echo '#!/bin/sh' > "${pkgdir}/usr/lib/securecrt/run.sh"
	echo '#!/bin/sh' > "${pkgdir}/usr/lib/securefx/run.sh"
	echo '[[ -z "$LD_LIBRARY_PATH" ]] && export LD_LIBRARY_PATH=/usr/lib/securecrt || export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/securecrt' >> "${pkgdir}/usr/lib/securecrt/run.sh"
	echo '[[ -z "$LD_LIBRARY_PATH" ]] && export LD_LIBRARY_PATH=/usr/lib/securefx || export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/securefx' >> "${pkgdir}/usr/lib/securefx/run.sh"
	echo 'exec /usr/lib/securecrt/`basename "$0"` "$@"'  >> "${pkgdir}/usr/lib/securecrt/run.sh"
	echo 'exec /usr/lib/securefx/`basename "$0"` "$@"'  >> "${pkgdir}/usr/lib/securefx/run.sh"
	chmod +x "${pkgdir}/usr/lib/securecrt/run.sh"
	chmod +x "${pkgdir}/usr/lib/securefx/run.sh"
	mkdir -p "$pkgdir/usr/bin/"
	ln -s /usr/lib/securecrt/run.sh "$pkgdir/usr/bin/SecureCRT"
	ln -s /usr/lib/securefx/run.sh "$pkgdir/usr/bin/SecureFX"

	install -Dm 644 ./SecureCRT.desktop ${pkgdir}/usr/share/applications/SecureCRT.desktop
	install -Dm 644 ./securecrt_64.png ${pkgdir}/usr/share/vandyke/data/securecrt_64.png
        install -Dm 644 ./SecureFX.desktop ${pkgdir}/usr/share/applications/SecureFX.desktop
        install -Dm 644 ./securefx_64.png ${pkgdir}/usr/share/vandyke/data/securefx_64.png

	install -Dm 644 ./SecureCRT_HISTORY.txt ${pkgdir}/usr/share/doc/securecrt/SecureCRT_HISTORY.txt
	install -Dm 644 ./SecureCRT_README.txt ${pkgdir}/usr/share/doc/securecrt/SecureCRT_README.txt
        install -Dm 644 ./SecureFX_HISTORY.txt ${pkgdir}/usr/share/doc/securecrt/SecureCRT_HISTORY.txt
        install -Dm 644 ./SecureFX_README.txt ${pkgdir}/usr/share/doc/securecrt/SecureCRT_README.txt
	install -Dm 644 ./SecureCRT_SecureFX_EULA.txt ${pkgdir}/usr/share/doc/securecrt/SecureCRT_EULA.txt 
	cp -r ./SecureCRTHelp ${pkgdir}/usr/share/doc/securecrt/
	
	install -Dm 644 ./changelog.Debian.gz ${pkgdir}/usr/share/doc/securecrt/changelog.Debian.gz

}
