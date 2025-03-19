# Maintainer: Ben Towali <bentowalii@gmail.com>

pkgname=raindrop
pkgver='5.6.76'
pkgrel=1
pkgdesc="All-in-one bookmark manager"
arch=('x86_64')
url="https://raindrop.io"
license=('MIT')
depends=()
makedepends=('squashfs-tools')
provides=(raindrop)
install=
_snapid="B8ZjYQVKEem99E5WjVMGUr75feAUrnH5"
_snaprev="28"
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")
sha512sums=("21deca2c20fddf6b3290d942cbcd1d35ce8fbc45b14f8b13c88a1b8a948a44a5e1fd82985977c9749a04de6446dec64c66cc816d1d767a5dbfd0f1709abe9a62")

prepare() {
	echo "Extracting snap file..."
	unsquashfs -q -f -d "${srcdir}/${pkgname}" "${_snapid}_${_snaprev}.snap"
}

package() {
	# Install Files
	install -d "${pkgdir}/opt/${pkgname}"
	cp -r "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}"

	# Desktop Entry
	sed -i 's|${SNAP}/meta/gui/icon.png|raindrop|g' "${pkgdir}/opt/${pkgname}/meta/gui/${pkgname}.desktop"
	install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	# Clean up unnecessary files
	rm -rf "${pkgdir}/opt/${pkgname}"/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}

	# Symlink binary to /usr/bin
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin"
}
