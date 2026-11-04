# Maintainer: Michał Tomczyk <tomczykmk94 _at_ gmail _dot_ com>
# Contributor: Sick Codes <info at sick dot codes>
pkgname=doomtools-bin
pkgver=2026.10.30.234413298
_pkgdate=${pkgver%%.?????????}
pkgrel=1
pkgdesc="Set of command-line utilities for building projects or for other things related to Doom Engine games."
arch=('any')
url="https://mtrop.github.io/DoomTools/"
license=('MIT')
provides=(decohack dmxconv doomfetch doomtools rookscript wadscript wswantbl wtexport dimgconv doommake wadmerge wadtex wtexlist wtexscan)
depends=('java-runtime>=8')
makedepends=('imagemagick')
source=(
	"https://github.com/MTrop/DoomTools/releases/download/${_pkgdate}-RELEASE/doomtools-bash-${pkgver}.tar.gz"
	"template.sh"
	"doomtools.desktop"
)
sha256sums=(
	"bd0b2b28fb16cf69d3be0aa6fcfea3dd67b958fe9b6dbd4a2cc1f53cf85540be"
	"65ac67f9e70102e1079f4dcb4039c22e31d2e667d1d7a09a0c3b9bf226c68c07"
	"fb72eabdddc4adf3575cda217d6eb6ffd49545c83fc51213ef61b3d16fa9d9ce"
)

package() {
	mkdir -p ${srcdir}/scripts
	find ${srcdir} -maxdepth 1 -type f -print0 | while read -r -d $'\0' _file; do
		_trimfname=${_file##*/}
		_classname=$(sed -nE 's/MAINCLASS=(.+)/\1/p' ${_file})
		if [[ "${_classname}" == "" ]]; then
			continue
		fi
		cp ${srcdir}/template.sh ${srcdir}/scripts/${_trimfname}
		sed -i -e "s/MAINCLASS_PLACEHOLDER/${_classname}/g" ${srcdir}/scripts/${_trimfname}
		sed -i -e "s/PKGVER_PLACEHOLDER/${pkgver}/g" ${srcdir}/scripts/${_trimfname}
		install -Dm755 ${srcdir}/scripts/${_trimfname} -t ${pkgdir}/usr/bin
	done

	magick identify ${srcdir}/docs/doomtools-logo.ico | while read -r _icon _dummy _icon_res _dummy; do
		magick ${_icon} ${srcdir}/${_icon_res}.png
		install -Dm644 ${srcdir}/${_icon_res}.png ${pkgdir}/usr/share/icons/hicolor/${_icon_res}/apps/doomtools.png
	done

	mv ${srcdir}/docs/LICENSE.txt ${srcdir}/docs/licenses
	install -Dm644 ${srcdir}/jar/doomtools-${pkgver}.jar -t ${pkgdir}/usr/share/java/doomtools
	install -Dm644 ${srcdir}/doomtools.desktop -t ${pkgdir}/usr/share/applications
	install -Dm644 ${srcdir}/docs/licenses/* -t ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 ${srcdir}/docs/*.md -t ${pkgdir}/usr/share/doc/doomtools
	install -Dm644 ${srcdir}/docs/*.txt -t ${pkgdir}/usr/share/doc/doomtools
	install -Dm644 ${srcdir}/docs/changelogs/* -t ${pkgdir}/usr/share/doc/doomtools/changelogs
}
