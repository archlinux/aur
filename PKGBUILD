# Maintainer: Padraic Fanning <fanninpm AT miamoh DOT edu>

_pkgname=gaphor
pkgname="${_pkgname}-bin"
pkgver=2.12.0
pkgrel=1
pkgdesc="Simple and easy to use modeling tool for UML using GTK3"
arch=('x86_64')
url="https://github.com/gaphor/gaphor/"
license=('Apache')
groups=()
depends=()
makedepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=(
	"${_pkgname}-git"
	"python-${_pkgname}"
	"python-${_pkgname}-git"
)
options=(!strip)
_appimage=("${pkgname}-${pkgver}-${CARCH}.AppImage")
source=("${_appimage}::https://github.com/gaphor/${_pkgname}/releases/download/${pkgver}/Gaphor-${pkgver}-${CARCH}.AppImage")
noextract=(${_appimage})
sha256sums=('c5b21c0ee2e557a9c68f5e06e5b56d102dabea40936125be5a0724c8ff60398a')

prepare() {
	cd "$srcdir"
	# Extract AppImage contents so we install bypassing every and all AppImage
	# desktop integration/deployment mechanisms
	chmod +x "${_appimage}"
	"./${_appimage}" --appimage-extract > /dev/null
}

build() {
	cd "$srcdir"
	sed -i 's/Exec=gaphor-exe/Exec=gaphor/' "squashfs-root/org.gaphor.Gaphor.desktop"
}

package() {
	# Installation procedure adapted from the PKGBUILD for Ripcord:
	# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ripcord
	cd "$srcdir"

	# directories
	rm -rf "squashfs-root/share/glib-2.0/schemas"
	ln -s "/usr/share/glib-2.0/schemas" "squashfs-root/share/glib-2.0/schemas"
	install -d "${pkgdir}/usr/bin/"
	install -d "${pkgdir}/usr/lib/gaphor/"
	install -d "${pkgdir}/usr/share/applications/"
	install -d "${pkgdir}/usr/share/pixmaps/"

	# icon
	install -m644 "squashfs-root/org.gaphor.Gaphor.png" "${pkgdir}/usr/share/pixmaps/org.gaphor.Gaphor.png"

	# .desktop file
	install -m644 "squashfs-root/org.gaphor.Gaphor.desktop" "${pkgdir}/usr/share/applications/org.gaphor.Gaphor.desktop"

	# application
	chmod 755 -R squashfs-root
	mv squashfs-root/* "${pkgdir}/usr/lib/gaphor/"
	ln -s "/usr/lib/gaphor/gaphor-exe" "${pkgdir}/usr/bin/gaphor"
}
