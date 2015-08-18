# Maintainer: Ethan Schoonover <es@ethanschoonover.com> @ethanschoonover IRC/BBS/AUR:altercation

pkgname=gam
pkgver=3.51
pkgrel=3
holdver=$pkgver
pkgdesc="Command line tool for Google Apps Administrators to manage domain and user settings; patched for managed installation"
arch=('any')
url="https://github.com/jay0lee/GAM"
license=('Apache')
depends=('python2')
makedepends=('tar gzip')
optdepends=()
provides=()
source=("https://github.com/jay0lee/GAM/archive/v${pkgver}.tar.gz"
        "client_secrets.patch")
noextract=("v${pkgver}.tar.gz")
md5sums=('0ab658cb70b375a4634d477edcd02123'
         '89d247a2ab0612c0edf098d0284d9a8b')

build() {
	cd $srcdir
	[[ -d $srcdir/build ]] && rm -rf $srcdir/build
        mkdir build
	tar --gzip --extract --overwrite --strip-components=1 --directory=build --file=v${pkgver}.tar.gz
        cd build
        patch -uN -i ../client_secrets.patch || return 1
}

package() {
	cd "${srcdir}/build"
	install -d ${pkgdir}/opt/${pkgname}
	install -d ${pkgdir}/usr/bin
	touch ${pkgdir}/opt/${pkgname}/noupdatecheck.txt
	touch ${pkgdir}/opt/${pkgname}/nobrowser.txt
	cp -af * ${pkgdir}/opt/${pkgname}/
	echo "python2 /opt/${pkgname}/gam.py \"\$@\"" > ${pkgdir}/usr/bin/gam
	chmod 0755 ${pkgdir}/usr/bin/gam
	rm -rf ../build
}
