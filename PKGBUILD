# Maintainer: italoghost <eduprodive at posteo dot me>
pkgname=leshade-bin
_pkgname=leshade
pkgver=2.4.3
pkgrel=2
pkgdesc="An ReShade manager for linux."
arch=('x86_64')
url="https://github.com/Ishidawg/LeShade"
license=("MIT")
provides=("$_pkgname")
depends=(
'keyutils' 'libcap' 'bzip2' 'libgcrypt' 'xz' 'krb5' 'libstdc++'
'libgpg-error' 'systemd-libs' 'util-linux-libs' 'brotli' 'lz4'
'openssl' 'glib2' 'libffi' 'pcre2' 'dbus' 'libgcc' 'zlib' 
'zstd' 'expat' 'e2fsprogs' 'glibc'
)
makedepends=('patchelf')
options=('!strip' '!emptydirs' '!libtool')
_appimage="LeShade-x86_64.AppImage"
noextract=("${_appimage}")
source=(
"https://github.com/Ishidawg/LeShade/releases/download/${pkgver}/${_appimage}"
"${pkgname}-LICENSE::https://raw.githubusercontent.com/Ishidawg/LeShade/main/LICENSE"
)
sha256sums=('753b03f7c15a2f3cb03444baf48823161c944fcbcdf45316edaac0a1051880d4'
            'a7b8f406ed4e1a5311d51a1967f91e569a6c0ce815c2bf74956d926613dd61a3')

prepare() {
	# Extract AppImage
	cd "${srcdir}"
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
	cd "${srcdir}/squashfs-root/"
	# Change the exec name
	sed -i -e "s/Exec=LeShade/Exec=leshade/" "${_pkgname}.desktop"
	# Remove insecure RUNPATH
	find . -type f -exec file {} + | grep -E 'ELF.*(executable|shared object)' | cut -d: -f1 | while read -r elf; do
		patchelf --remove-rpath "$elf" 2>/dev/null || true
	done
}

package() {
	# Create directory structure
	install -dm755 "${pkgdir}/opt/${_pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	# Move extracted content to /opt
	cp -ar "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"
	# Install the .desktop file and the icon
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
	# Create a symbolic link for the AppRun
	ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"
	# License
	install -Dm644 "${srcdir}/${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	# Permissions
	chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${_pkgname}"
}
