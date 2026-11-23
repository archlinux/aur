# NOT compatible with AUR helpers!
#
# To install:
# 	git clone https://aur.archlinux.org/ida-free.git && cd ida-free
# 	Download the `ida-free-pc_VERSION_x64linux.run` installer from the IDA download center
# 	at https://my.hex-rays.com/, and place it in the same directory
# 	makepkg -sicf

# Inspired from aur's ida-pro package, thanks for @patchouli
# Maintainer: aurora0x27
# Contributor: fatalis <fatalis@fatalis.pw>

pkgver=9.5.0
pkgname="ida-free"
pkgrel=1
pkgdesc="Hex-Rays IDA Free"
url="https://hex-rays.com/ida-free"
license=('custom')
makedepends=('fakechroot')
depends=(
	'libstdc++'
	'libgcc'
	'glib2'
	'dbus'
	'fontconfig'
	'freetype2'
	'zlib'
	'libgl'
	'libx11'
	'libxcb'
	'libxext'
	'libxkbcommon'
	'libxkbcommon-x11'
	'libxtst'
	'xcb-util'
	'xcb-util-cursor'
	'xcb-util-image'
	'xcb-util-keysyms'
	'xcb-util-renderutil'
	'xcb-util-wm'
	'krb5'
	'pcre2'
	'wayland'
)
optdepends=(
	'gtk3: GTK platform theme integration (libqgtk3)'
	'qt6-base: EGLFS and wl-shell platform plugins'
	'qt6-wayland: Wayland compositor integration'
	'openssl: TLS for the cloud decompiler'
	'libsecret: Lumina credential storage'
	'libunwind: stack traces'
)
options=('!strip' '!debug')

_installer='ida-free-pc_95_x64linux.run'

source=("local://${_installer}"
		"${pkgname}.desktop")

sha256sums=('c7828e9b3e87e6448fce171d42acb091a4318e67c28b9eb26ac11becb1e39c88'
            '9852711adc130a2482ac6829ce3df3ea11d9b04c2e5e6453c40e699980124e4a')

arch=('x86_64')

package() {
	install -d "${pkgdir}"/opt/${pkgname}
	install -d "${pkgdir}"/usr/bin
	install -d "${pkgdir}"/usr/share/{icons,applications,licenses/${pkgname}}
	install -d "${pkgdir}"/tmp

	# chroot is needed to prevent the installer from creating a single file outside of prefix
	# have to copy the installer due to chroot
	cp "${srcdir}"/${_installer} "${pkgdir}"/
	chmod +x "${pkgdir}"/${_installer}

    # The installer will write a desktop file in $HOME/.local/share/applications/, so we redirect
    # it to /tmp to avoid including it in package
	HOME=/tmp fakechroot chroot "${pkgdir}" /${_installer} --mode unattended --prefix "/opt/${pkgname}"
	rm "${pkgdir}"/${_installer}
	rm -Rf "${pkgdir}/tmp"

	# the installer needlessly makes a lot of files executable
	find "${pkgdir}"/opt/${pkgname} -type f -exec chmod -x {} \;
	chmod +x "${pkgdir}"/opt/${pkgname}/{ida,picture_decoder}

	# 9.3 change docs permissions
	find "${pkgdir}"/opt/${pkgname}/docs -type d -exec chmod 755 {} \;
	find "${pkgdir}"/opt/${pkgname}/docs -type f -exec chmod 644 {} \;

	rm -f "${pkgdir}"/opt/${pkgname}/{uninstall*,Uninstall*}

	install -Dm644 "${srcdir}"/${pkgname}*.desktop "${pkgdir}"/usr/share/applications
	ln -s /opt/${pkgname}/appico.png "${pkgdir}"/usr/share/icons/${pkgname}.png
	ln -s /opt/${pkgname}/license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	ln -s /opt/${pkgname}/ida "${pkgdir}/usr/bin/ida-free"
}
