# Maintainer: Michał Tomczyk <tomczykmk94 _at_ gmail _dot_ com>
# Contributor: Sick Codes <info at sick dot codes>
pkgname=doomtools-bin
pkgver=2026.10.04.230602758
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
	"3eca101c119a432d1624103a1ccc2053efd3d89f21ed1bc0b773745701711782"
	"dab435a5096090c2106875966bec76f357721b27542e9ed2a276df1bc608b673"
	"d7ac55b49120883c6076a8c6bb884a96e66a9c111362a68f2e69fe3b894f61c1"
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

	install -Dm644 ${srcdir}/jar/doomtools-${pkgver}.jar -t ${pkgdir}/usr/share/java/doomtools
	install -Dm644 ${srcdir}/doomtools.desktop -t ${pkgdir}/usr/share/applications
	install -Dm644 ${srcdir}/docs/LICENSE.txt -t ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 ${srcdir}/docs/licenses/* -t ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 ${srcdir}/docs/*.md -t ${pkgdir}/usr/share/doomtools/docs
	install -Dm644 ${srcdir}/docs/*.txt -t ${pkgdir}/usr/share/doomtools/docs
	rm ${pkgdir}/usr/share/doomtools/docs/LICENSE.txt
}
