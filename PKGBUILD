# Maintainer: Facundo Olasagarre <facundo.vasco@gmail.com>

pkgname=atani
pkgver=14.29.0
pkgrel=1
pkgdesc="The all-in-one crypto platform you’ve been dreaming about. Exchanges, wallets and taxes under one roof"
arch=('x86_64')
url="https://atani.com/"
license=('unknown')
depends=('nss' 'gtk3')
makedepends=('squashfs-tools')
provides=('atani')
conflicts=('atani-snap')
replaces=('atani-snap')
_snapid="fRYdkXBDVAKnSXTJG5xa4PwBR4RqGDkV"
_snaprev="181"
install=$pkgname.install
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")
sha384sums=('8d0112c2917b99e8cf406b3b9d117981a32f21f73ab46e596110177ab2fbd79d8002401cac5845dd4574e2c3cc67c129')

prepare() {
	echo "Extracting snap"
	#Extract snap file
	unsquashfs -q -f -d "${srcdir}/${pkgname}" "${_snapid}_${_snaprev}.snap"
}

package() {
	# Install files
	install -d "${pkgdir}/opt/${pkgname}"
	cp -r "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}"

	# Desktop Entry
	sed -i 's|${SNAP}/meta/gui/icon.png|atani|g' "${pkgdir}/opt/${pkgname}/meta/gui/atani.desktop"
	install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/atani.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/atani.png"

	# Clean up unnecessary files
	rm -rf "${pkgdir}/opt/${pkgname}"/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}

	# Symlink binary to /usr/bin
	install -d "${pkgdir}/usr/bin"
	ln -sf "/opt/${pkgname}/atani" "${pkgdir}/usr/bin"
}
