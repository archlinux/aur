# Maintainer: Ben Towali <bentowalii@gmail.com>

pkgname=raindrop
pkgver='5.6.71'
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
_snaprev="26"
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")
sha512sums=("8f2c64ae7c6155436b4cb53776516c8f0b562d54fc53d104b2e65bd0d200805dfceb7ff0836d8ed7fa2b50c67a31f90d0b0a4eaff7f667472081f8b41416d5de")

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
