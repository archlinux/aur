# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=sulis-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Turn based tactical RPG with several campaigns, written in Rust"
arch=('x86_64')
url="https://www.sulisgame.com"
license=('GPL-3.0')
depends=('alsa-lib')
provides=('sulis')
makedepends=('gendesk')
provides=('sulis')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Grokmoo/sulis/releases/download/${pkgver}/sulis-${pkgver}-linux64.zip"
		'sulis.png')
md5sums=('58d09805b387b3b9ac5e293e549fbcad'
  		 '3c6dad6618d3835f41636ace44b43abe')

prepare() {
	cd "${srcdir}/sulis"
	echo "#!/usr/bin/env bash
cd /opt/sulis
./sulis" > sulis.sh
	chmod 755 sulis.sh
	gendesk -f -n --pkgname "sulis" --pkgdesc "${pkgdesc}" --exec="sulis.sh" --categories=Game --icon sulis
}

package() {
	cd "${srcdir}/sulis"
	mkdir -p ${pkgdir}/opt/sulis
	cp -R ${srcdir}/sulis/* ${pkgdir}/opt/sulis
	mkdir -p ${pkgdir}/usr/bin
	ln -s /opt/sulis/sulis.sh ${pkgdir}/usr/bin/
	mkdir -p ${pkgdir}/usr/share/applications
	install -Dm644 "sulis.desktop" "${pkgdir}/usr/share/applications/sulis.desktop"
	mkdir -p ${pkgdir}/usr/share/licenses/sulis/
	install -Dm644 "${srcdir}/sulis/docs/GPLv3-LICENSE" "${pkgdir}/usr/share/licenses/sulis/LICENSE"
	mkdir -p ${pkgdir}/usr/share/pixmaps/
	install -Dm644 "${srcdir}/sulis.png" "${pkgdir}/usr/share/pixmaps/sulis.png"
}