# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="mesen-s-bin"
_pkgname="Mesen-S"
pkgver="0.4.0"
pkgrel=1
arch=('x86_64')
pkgdesc="A cross-platform Super Nintendo emulator"
url='https://github.com/SourMesen/Mesen-S'
license=('GPL3')
makedepends=('gendesk' 'wget')
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3')
conflicts=('mesen-s-git' 'mesen-s')
source_x86_64=(
    "Mesen-S.${pkgver}.zip::https://github.com/SourMesen/${_pkgname}/releases/download/${pkgver}/Mesen-S.${pkgver}.zip"
    "icon.png::https://raw.githubusercontent.com/SourMesen/${_pkgname}/master/UI/Resources/Icon.ico"
    "libMesenSCore.dll::https://cdn.crankysupertoon.live/dist/libMesenSCore.dll"
)

md5sums_x86_64=('SKIP' 'SKIP' 'SKIP')

prepare() {
    # Generate .desktop
    gendesk --pkgname "Mesen-S" --pkgdesc "${pkgdesc}" --icon ${pkgname} --exec "/usr/bin/${pkgname}" -n -f
    mv "Mesen-S.desktop" "${pkgname}.desktop"
    
	# Invoke using mono in a wrapper, since wine (if installed) would open it otherwise
	cat > "${pkgname}" <<-EOT
	#!/bin/sh
	/usr/bin/mono /opt/Mesen-S/Mesen-S.exe "\$@"
	EOT
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${_pkgname}"
    cp -Rr "${srcdir}/"* "${pkgdir}/opt/${_pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"
    cp -Rr "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/${pkgname}.png"

    # install the required but non bundled library???
    install -d -m755 "${pkgdir}/usr/lib"
    cp -Rr "${srcdir}/libMesenSCore.dll" "${pkgdir}/usr/lib/libMesenSCore.dll"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    cp -Rr "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${_pkgname}/${_pkgname}.exe"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"	
}
