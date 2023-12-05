# Maintainer: Facundo Olasagarre <facundo.vasco@gmail.com>

pkgname=atani
pkgver=14.39.0
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
_snaprev="193"
install=$pkgname.install
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")
md5sums=('SKIP')
#sha384sums=('2f69cc4963e935a89d54a62dfe452f5bcc9c027d6480dc4e4b561bccd04f0104a745389b552712c64f82068b6a766ee4')

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
