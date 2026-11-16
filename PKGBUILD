# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=saturn-bin
pkgver=4.0.2
pkgrel=1
_rel=58
pkgdesc="Cross-platform deezer, SoundCloud, YouTube Music & Neurokaraoke client made in Flutter"
arch=('x86_64')
url="https://github.com/Sheathed/Saturn"
license=('GPL-3.0-only')
makedepends=('patchelf')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libsoup3'
    'glib2'
    'mpv'
    'libx11'
    'libxi'
    'libepoxy'
    'fontconfig'
    'glibc'
    'hicolor-icon-theme'
)
provides=( 'saturnmusic' )
conflicts=('saturn-git')

source=( "${url}/releases/download/v${pkgver}/saturn-stable-${pkgver}+${_rel}-linux.deb" )

sha256sums=('5d0889f17734529f6d1211d460bcd68e68cc9738b04f98bd97f7e53b0f97fcfa')

package() {
	cd "${srcdir}"
	tar -xf "${srcdir}/data.tar.zst"
	install -dm755 "${pkgdir}/opt"
	cp --preserve=mode -r 'opt' "${pkgdir}/"

	for lib in "${pkgdir}"/opt/Saturn/lib/*.so; do
		patchelf --set-rpath '$ORIGIN' "$lib"
	done

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/Saturn/Saturn" "${pkgdir}/usr/bin/saturn"

	for res in 128x128 256x256; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
		install -m644 "${srcdir}/usr/share/icons/hicolor/${res}/apps/Saturn.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/saturn.png"
	done

	install -dm755 "${pkgdir}/usr/share/applications"
	sed -i "s|Exec=.*|Exec=/opt/Saturn/Saturn %U|" "${srcdir}/usr/share/applications/Saturn.desktop"
	sed -i "s|Icon=.*|Icon=saturn|" "${srcdir}/usr/share/applications/Saturn.desktop"
	install -Dm644 "${srcdir}/usr/share/applications/Saturn.desktop" "${pkgdir}/usr/share/applications/saturn.desktop"

}
