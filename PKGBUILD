# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=ventoy
_pkgname=ventoy
pkgrel=2
pkgver=1.0.06
pkgdesc='A new multiboot USB solution'
arch=('x86_64' 'i686')
provides=(ventoy)
conflicts=(ventoy)
depends=('bash' 'util-linux')
license=('GPL3')
url='http://www.ventoy.net/'
source=("https://github.com/ventoy/Ventoy/releases/download/v1.0.06/ventoy-$pkgver-linux.tar.gz")
sha512sums=('ac57bc4e8398e7113f2dc5ef5458dc8d7be132d0a636ceaf5a7ca82411aa8bdfaff116f64dd6085c4848a8c901460787513a3b88e2fa859fdab9caa65be41039')

# NOTE: Hard tabs are required here.
prepare() {
	msg2 'Generating ventoy launcher file...'
	cat <<-MAGIC > ventoy
	#!/bin/bash
	cd /opt/ventoy
	./Ventoy2Disk.sh "\$@"
	MAGIC
	
	msg2 'Patching log.txt shit...'
	cd $_pkgname-$pkgver
	sed -i '/log\.txt/s/.*/true/' tool/ventoy_lib.sh 
}

package() {
	cd $_pkgname-$pkgver
	
	mkdir -p "$pkgdir"/opt/ventoy/{boot,tool,ventoy} "$pkgdir"/usr/bin
	
	install -Dm644 boot/* -t "$pkgdir"/opt/ventoy/boot/
	install -Dm644 ventoy/* -t "$pkgdir"/opt/ventoy/ventoy/
	install -Dm755 tool/* -t "$pkgdir"/opt/ventoy/tool/
	install -Dm755 Ventoy2Disk.sh -t "$pkgdir"/opt/ventoy/
	
	cd ..
	install -Dm755 ventoy -t "$pkgdir"/usr/bin/
}
