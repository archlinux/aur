# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=saturn-canary-bin
pkgver=4.0.2
_canary_rel=59
pkgrel=1
pkgdesc="Cross-platform deezer, SoundCloud, YouTube Music & Neurokaraoke client made in Flutter - Canary Version"
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
conflicts=('saturn-canary-git')

source=( "${url}/releases/download/v${pkgver}-canary.${_canary_rel}/saturn-canary-${pkgver}+${_canary_rel}-linux-canary.${_canary_rel}.deb" )

sha256sums=('f034ae1757b53a6edd36f3c23ee59e5806548d43b85cd1df5ca5931723ee7be7')

package() {
	cd "${srcdir}"
	tar -xf "${srcdir}/data.tar.zst"
	install -dm755 "${pkgdir}/opt"
	cp --preserve=mode -r "${srcdir}/opt/Saturn" "${pkgdir}/opt/saturn-canary"

	for lib in "${pkgdir}"/opt/saturn-canary/lib/*.so; do
		patchelf --set-rpath '$ORIGIN' "$lib"
	done

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/saturn-canary/Saturn" "${pkgdir}/usr/bin/saturn-canary"

	for res in 128x128 256x256; do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
		install -m644 "${srcdir}/usr/share/icons/hicolor/${res}/apps/Saturn.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/s.s.saturn.canary.png"
	done

	install -dm755 "${pkgdir}/usr/share/applications"
	sed -i "s|Exec=.*|Exec=saturn-canary %U|" "${srcdir}/usr/share/applications/Saturn.desktop"
	sed -i "s|Icon=.*|Icon=s.s.saturn.canary|" "${srcdir}/usr/share/applications/Saturn.desktop"
	install -Dm644 "${srcdir}/usr/share/applications/Saturn.desktop" "${pkgdir}/usr/share/applications/s.s.saturn.canary.desktop"

}
