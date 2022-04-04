# Maintainer: Your Name <youremail@domain.com>

_pkgname=gaphor
pkgname="${_pkgname}-bin"
pkgver=2.9.2
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
sha256sums=('cfc551b972262c6527d7ce122c5a38e34a70d4d9300413dbfbb3ea3010edc1bd')

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
    cd "$srcdir"
    install -Dm755 ${_appimage} "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 "squashfs-root/org.gaphor.Gaphor.desktop" "${pkgdir}/usr/share/applications/org.gaphor.Gaphor.desktop"
    install -Dm644 "squashfs-root/org.gaphor.Gaphor.png" "${pkgdir}/usr/share/pixmaps/org.gaphor.Gaphor.png"
}
