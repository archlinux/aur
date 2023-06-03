# Maintainer: Ben Towali <bentowalii@gmail.com>

pkgname=raindrop
pkgver='5.6.4'
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
_snaprev="10"
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")
sha512sums=("6e0b160674c57a0ee525223fe00766d8d47fcd06f1fa1d4354ab66455a391874144d8fd5e68e62d0274ba47d915420d4b2998a62c4fa7724db2822af1e3068d4")

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
