# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=bb_launcher-bin
pkgver=15.07
_pkgname=bb_launcher
_pkgid=BB_Launcher
_pkgdate=2026-06-09
_pkgcommit=aebcb7a
pkgrel=2
pkgdesc="shadPS4 Launcher for Bloodborne (bin version)"
arch=('x86_64')
license=('GPL-3.0-only')
url="https://github.com/rainmakerv3/${_pkgname}"
depends=(
        'glibc' 
        'libgcc' 
        'libgpg-error' 
        'gmp' 
        'e2fsprogs' 
        'expat' 
        'zlib' 
        'bash'
        'libstdc++'
        )
makedepends=('curl' 'unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!zipman' '!emptydirs' '!debug')
_appimage=${_pkgid}-qt.AppImage
noextract=("${_appimage}")
_zip=${_pkgid}-linux-qt-downloader-${_pkgdate}-${_pkgcommit}.zip
source=(https://github.com/rainmakerv3/BB_Launcher/releases/download/Release${pkgver}/${_zip})
sha256sums=('5ea39bd1cf2fbe2b01bbbf6132a61eca250bb15da4fb944e12e5c1c4e90276f8')

prepare() {
    unzip -o "${_zip}"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    cd "${srcdir}/squashfs-root"
    # Patch AppRun to point to the fixed installation directory in /opt,
    sed -i "s|appdir=\$(readlink -f \${APPDIR:-\$(dirname \"\$0\")})|appdir=\"/opt/${_pkgname}\"|" "$srcdir/squashfs-root/AppRun"
    # Patch .desktop file
	mv "BBLauncher.desktop" "${_pkgname}.desktop"
    mv "BBIcon.png" "${_pkgname}.png"
	sed -i -e "s/Exec=${_pkgid}/Exec=${_pkgname}/" "${_pkgname}.desktop"
    sed -i -e "s/Icon=BBIcon/Icon=${_pkgname}/" "${_pkgname}.desktop"
    # Remove .DirIcon file
    rm ".DirIcon"
    # Patch the executable name
    mv "${srcdir}/squashfs-root/usr/bin/${_pkgid}" "${srcdir}/squashfs-root/usr/bin/${_pkgname}"
}

package() {
    # Create directory structure
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
	# Move extracted content to /opt
	cp -rp "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"
	# Install the .desktop file and the icon
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
	# Create a symbolic link for the AppRun
	ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"
	# Permissions
	chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${_pkgname}"
}
