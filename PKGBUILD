# NOT compatible with AUR helpers!
#
# To install:
# 	git clone https://aur.archlinux.org/ida-pro.git && cd ida-pro
# 	Download the `ida-pro_VERSION_x64linux.run` installer from the IDA download center at https://my.hex-rays.com/, and place it in the same directory
# 	makepkg -sicf

# Maintainer: patchouli

pkgver=9.5.0
pkgname="ida-pro"
pkgrel=2
pkgdesc="Hex-Rays IDA Pro"
url="https://hex-rays.com/ida-pro"
license=('custom')
makedepends=('fakechroot')
depends=('libgl'
	'libx11'
	'libxext'
	'libxrender'
	'glib2'
	'qt6-base'
	'python-rpyc'
	)
options=('!strip')

_installer='ida-pro_95_x64linux.run'

source=("file://${_installer}"
		"${pkgname}.desktop"
		"${pkgname}.xml")

sha256sums=('f8bbc7904ab7ab1b864bbaa698374396d52afacd3c39403db6dff2d0cf355075'
            '8e5565769ca1729c9b3199b6bf32a3e3943281340bb7019cae7ff32c22531489'
            'd6b8b1f78b89ba9949d675f40266f3b53335af1fde0610c99ef1aaa645abc7d7')

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

	# IDA Pro 9.0 SP1 (and newer) installer now tries to copy the .desktop files to $HOME even if you specify a prefix. Very annoying.
	mkdir -p $pkgdir/$HOME/.local/share/applications
	fakechroot chroot "${pkgdir}" /${_installer} --mode unattended --prefix "/opt/${pkgname}"
	rm "${pkgdir}"/${_installer}
	rm -Rf "${pkgdir}"/{tmp,home}

	# the installer needlessly makes a lot of files executable
	find "${pkgdir}"/opt/${pkgname} -type f -exec chmod -x {} \;
	chmod +x "${pkgdir}"/opt/${pkgname}/{hv,ida,idapyswitch,idat,lc,lsadm,picture_decoder,upg32}

	# 9.3 change docs permissions
	find "${pkgdir}"/opt/${pkgname}/docs -type d -exec chmod 755 {} \;
	find "${pkgdir}"/opt/${pkgname}/docs -type f -exec chmod 644 {} \;

	rm "${pkgdir}"/opt/${pkgname}/{uninstall*,Uninstall*}

	install "${srcdir}"/${pkgname}*.desktop "${pkgdir}"/usr/share/applications
	install -Dm644 "${srcdir}/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
	ln -s /opt/${pkgname}/appico.png "${pkgdir}"/usr/share/icons/${pkgname}.png
	ln -s /opt/${pkgname}/license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	ln -s /opt/${pkgname}/ida "${pkgdir}"/usr/bin/ida
}
