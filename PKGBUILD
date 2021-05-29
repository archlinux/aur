# Maintainer: Mythbusters123 (Adam Reisenauer <atr10605@hotmail.com>)
# Original Maintainer: monosans

pkgname=lunarclient
_pkgname=lunarclient
pkgver=2.7.3
pkgrel=1
pkgdesc='PvP Modpack for Minecraft 1.7, 1.8, 1.12, 1.15 and 1.16'
url=https://lunarclient.com
arch=(x86_64)
license=(unknown)
depends=(fuse xorg-xrandr alsa-lib atk at-spi2-atk at-spi2-core avahi bzip2 cairo dbus e2fsprogs expat fontconfig freetype2 fribidi gcc-libs gdk-pixbuf2 glib2 glibc gmp gnutls graphite gtk3 harfbuzz keyutils krb5 libcap libcloudproviders libcups libdatrie libdrm libepoxy libffi libgcrypt libgpg-error libidn2 libjpeg-turbo libp11-kit libpng libtasn1 libthai libtiff libunistring libx11 libxau libxcb libxcomposite libxcursor libxdamage libxdmcp libxext libxfixes libxi libxinerama libxkbcommon libxrandr libxrender libxshmfence lz4 mesa nettle nspr nss pango pcre pixman systemd-libs util-linux-libs wayland xz zlib zstd)
conflicts=(lunarclient)
provides=(lunarclient)
options=(!strip)
_appimage="Lunar Client-${pkgver}.AppImage"
source=("https://launcherupdates.lunarclientcdn.com/${_appimage}")
sha256sums=('ce7a27a097a37f48c7342db7ccf1ca4af3742124eb9cb1923fc7c89ccf481146')

prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}

build() {
	# Adjust .desktop so it will work outside of AppImage container
	sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
		"squashfs-root/${_pkgname}.desktop"
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX squashfs-root/usr
}

package() {
	# AppImage
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

	# Desktop file
	install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
			"${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Icon images
	install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
