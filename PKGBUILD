# Maintainer: aisuneko icecat <iceneko@protonmail.ch>

pkgname=vita3k-appimage
pkgver=r3932.328a79de
pkgrel=1
pkgdesc="Experimental PlayStation Vita emulator (AppImage continuous build)"
url="https://vita3k.org"
arch=("x86_64")
license=('GPL-2.0-only')
depends=(
	'gtk3'
	'sdl3'
	'unzip'
	'xdg-desktop-portal'
)
optdepends=(
	'vulkan-validation-layers: Descriptive vulkan errors'
)
options=(!strip)
provides=('vita3k')
conflicts=('vita3k' 'vita3k-git' 'vita3k-bin')
source=("https://github.com/Vita3K/Vita3K/releases/download/continuous/Vita3K-x86_64.AppImage")

sha256sums=('SKIP')

pkgver(){
	cd "${srcdir}"
    chmod +x ./Vita3K-x86_64.AppImage
    ./Vita3K-x86_64.AppImage --version | cut -d ' ' -f3- | sed  -e "s/^/r/" -e "s/-/\./"
}

prepare(){
	cd "${srcdir}"
	
	chmod +x ./Vita3K-x86_64.AppImage
	./"Vita3K-x86_64.AppImage" --appimage-extract
}

package(){
	install -d "${pkgdir}/opt/vita3k"

	install -d "${pkgdir}/usr/bin"

	cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/share/Vita3K/." "${pkgdir}/opt/vita3k/"
	
    install -Dm644 "${srcdir}/squashfs-root/vita3k.desktop" "${pkgdir}/usr/share/applications/vita3k.desktop"

    install -Dm644 "${srcdir}/squashfs-root/vita3k.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/vita3k.png"

    install -Dm755 "${srcdir}/squashfs-root/usr/bin/Vita3K" "${pkgdir}/opt/vita3k/Vita3K"

    ln -s "/opt/vita3k/Vita3K" "${pkgdir}/usr/bin/Vita3K"

	chmod 777 "${pkgdir}/opt/vita3k/"
	chmod 777 "${pkgdir}/opt/vita3k/data"
	chmod 755 "${pkgdir}/opt/vita3k/Vita3K"

	# Hopefully someone would be able to scrap this poor workaround...
	echo ">>> Caveats"
	echo "It is recommended to symlink the following directories to prevent incomprehensible crashes due to missing user config: "
	echo ""
	echo "ln -s /opt/vita3k/shaders-builtin ~/.local/share/Vita3K/shaders-builtin"
	echo "ln -s /opt/vita3k/data ~/.local/share/Vita3K/data"
	echo "ln -s /opt/vita3k/lang ~/.local/share/Vita3K/lang"
}
