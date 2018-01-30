# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=poseidon
pkgver=0.7.3
_pkgver=0.7.3-1
pkgrel=1
pkgdesc="Fast, minimal and lightweight web browser"
arch=('x86_64' 'i686')
url="https://github.com/sidus-dev/poseidon"
license=('GPL3')
depends=('gtksourceview3' 'python-decorator' 'python-gobject' 'python-pillow' 'python-pyopenssl'
         'python-pysocks' 'python-requests' 'webkit2gtk')
optdepends=('vte3: embedded terminal')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/sidus-dev/$pkgname/archive/$_pkgver.tar.gz")
sha256sums=('706aad82e17be5cafb79f92fe3fe8f62f4df8cd107bf147df39b0b149346e3ba')

prepare() {
	cd $pkgname-$_pkgver
	rm lib/pythonloader.so
	sed -i 's|${LD}|${CC}|' lib/src/Makefile
	sed -i 's|browser = __file__.replace(".py", "")|browser = "poseidon"|
                s|event.get_state() and Gdk.ModifierType.CONTROL_MASK|event.get_state() \& Gdk.ModifierType.CONTROL_MASK|' poseidon.py
	sed -i 's|lib_path = "lib"|lib_path = "/usr/lib/poseidon"|' include/settings.py
	sed -i 's|cd "$(dirname "$0")"|cd "/usr/share/poseidon/"|' poseidon
	sed -i 's|Exec=/opt/poseidon-browser-git/poseidon %U|Exec=poseidon %U|
		s|/opt/poseidon-browser-git|/usr/share/poseidon|' poseidon.desktop
}

build() {
	cd $pkgname-$_pkgver
	cd lib/src && make && mv pythonloader.so ../ && cd ../../
}

package() {
	cd $pkgname-$_pkgver
	install -dm755 "$pkgdir"/usr/share/poseidon
	cp -r . "$pkgdir"/usr/share/poseidon
	rm -r "$pkgdir"/usr/share/poseidon/{.gitignore,LICENSE,README.md,lib,poseidon,poseidon.desktop}
	install -Dm644 lib/pythonloader.so "$pkgdir"/usr/lib/poseidon/pythonloader.so
	install -Dm755 poseidon "$pkgdir"/usr/bin/poseidon
	install -Dm644 poseidon.desktop "$pkgdir"/usr/share/applications/poseidon.desktop
	python3 -m compileall "$pkgdir"/usr/share/poseidon/
}
