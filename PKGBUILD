# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: MGislv <nocentinigabriele91@gmail.com>
# Contributor: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>

pkgname=i8086emu-git
pkgver=0.9.2.r35.1143f09
pkgrel=5
pkgdesc='Cross-platform emulator for the Intel 8086 microprocessor'
arch=('x86_64')
url='http://i8086emu.sourceforge.net/'
license=('GPL')
depends=('gtk2')
makedepends=('git' 'nasm' 'beep')
optdepends=('beep: PC-speaker access via asm')
provides=('i8086emu')
conflicts=('i8086emu')

source=('i8086emu::git+https://git.code.sf.net/p/i8086emu/git.git'
        'i8086emu.desktop'
        'extern.patch::https://sourceforge.net/p/i8086emu/patches/9/attachment/extern.patch'
        'fmt.patch::https://sourceforge.net/p/i8086emu/patches/_discuss/thread/5e30f26d55/b83c/attachment/fmt.patch'
        'compilation.patch')
sha512sums=('SKIP'
            'c0501f63012b74fb8e48cdef3c27ac52546308b82cf6a97527e36ef2ea6cee0ff874c804745252b678d13932e0e1aeaa48812189c5d7599a36484a30d453d81e'
            '05c6354741db54ed335bb0f4519b4693add6d2c0780170311f773b05207e28fcb0ce8aadd4d1160429752d94e8d5afe13e1175478421ea1624571801d96f948a'
            'b3cd89c20c38c581c12ebad5ae09f4f48fbd4eeef0e80c37be774b0156a06eb435483e7e1563796d60a06112d80383d0b2a146bf24246d7701577da44bf989d3'
            '23b36265c9f4f8e39d0128e78d9b8648c85cbf7dfa4a73e3acf1f86eb70e84e7eb1183b81d8d709cd6b092bb2c3b3b99f0068ab49db95164f2b5ec487893d208')

pkgver() {
	cd i8086emu
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd i8086emu
	patch --forward --strip=1 --input="${srcdir}/extern.patch"
	patch --forward --strip=1 --input="${srcdir}/fmt.patch"
	patch --forward --strip=1 --input="${srcdir}/compilation.patch"
	cd i8086emu/src
	sed -i 's/"@usegtk@" != "0"/"0" == "0"/g' Makefile.in
}

build() {
	cd i8086emu/i8086emu
	./configure --prefix=/usr \
	--sysconfdir=/etc \
	--infodir=/usr/share/info \
	CFLAGS="$CFLAGS -fPIC $LDFLAGS" LDFLAGS="$LDFLAGS" usegtk=1
	make
}

package() {
	cd i8086emu/i8086emu
	make DESTDIR="${pkgdir}" install

	install -dm755 "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/i8086emu.desktop" "${pkgdir}/usr/share/applications/i8086emu.desktop"
}
