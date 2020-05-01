# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=ventoy
_pkgname=ventoy
pkgrel=1
pkgver=1.0.08
pkgdesc='A new multiboot USB solution'
arch=('x86_64' 'i686')
provides=(ventoy)
conflicts=(ventoy)
depends=('bash' 'util-linux')
license=('GPL3')
url='http://www.ventoy.net/'
source=("https://github.com/ventoy/Ventoy/releases/download/v$pkgver/ventoy-$pkgver-linux.tar.gz")
sha512sums=('4b2e1e4bbe33cd08758bc7d7ca6a9518f3c4c8a4a6002c9b5c98e7b87e9453b2b3162c01bb2b751851a582b0e4e352dc042613f10a9e51c8672abc3c5f10f227')

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
