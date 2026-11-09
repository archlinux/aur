# Maintainer: Luna Z. <stoffi05@pm.me>
_pkgname="silkfly"
pkgname="${_pkgname}-bin"
pkgver=0.1.1
pkgrel=1
pkgdesc="Mod manager for Hollow Knight: Silksong"
arch=('x86_64')
url="https://github.com/Ishmael-GameDev/Silkfly"
license=('GPL-3.0-only')
depends=('bash' 'glibc' 'libgcc' 'libstdc++' 'fontconfig' 'hicolor-icon-theme'
	'openssl' 'icu' 'libx11' 'libice' 'libsm')
provides=("${_pkgname=${pkgver}}")
conflicts=("${_pkgname}")
_appimage=("${_pkgname}-${pkgver}.AppImage")
noextract=("${_appimage}")
options=('!strip' '!debug')

source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Silkfly-Linux.AppImage")
sha256sums=('43be6745a343e944c7b7253738c2029648180ea2bcd36090acb558bdc672add1')

prepare() {
	chmod +x "${_appimage}"

	./"${_appimage}" --appimage-extract >/dev/null

	chmod -R u=rwX,go=rX squashfs-root

	sed -i -E \
		-e "s|^Exec=[^ ]*|Exec=${_pkgname}|" \
		-e "s|^TryExec=.*|TryExec=${_pkgname}|" \
		-e "s|^Icon=.*|Icon=${_pkgname}|" \
		-e "/^X-AppImage-/d" \
		"squashfs-root/SilkflyApp.desktop"
}

package() {
	cd "${srcdir}/squashfs-root"

	install -d "${pkgdir}/opt/${_pkgname}"
	cp -a . "${pkgdir}/opt/${_pkgname}"

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/bin/sh
export APPDIR=/opt/${_pkgname}
exec /opt/${_pkgname}/AppRun "\$@"
EOF

	install -Dm644 SilkflyApp.desktop \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	install -Dm644 SilkflyApp.png \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
	rm -f "${pkgdir}/opt/${_pkgname}"/*.desktop
}
