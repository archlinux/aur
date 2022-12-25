# Maintainer: Ben Towali <bentowalii@gmail.com>
pkgname=raindrop
pkgver='5.5.10'
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
_snaprev="6"
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")
sha512sums=("aaa44d813e7edef1b92a8c3c3775b4e05207b6303a469dd2fe99adbd2f0d8135dd93d5acc1ebb5fef7195149acaddb59ebc357aded938f46e6623ed36c5d7730")

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
