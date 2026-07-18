# Maintainer: Michał Tomczyk <tomczykmk94 _at_ gmail _dot_ com>
# Contributor: Sick Codes <info at sick dot codes>
pkgname=doomtools-bin
pkgver=2026.07.18.161631195
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
	"4f4487ad5095b7e5587e9c3354be7ca5c0c2aee4363a9c882f1979685c3cab36"
	"dab435a5096090c2106875966bec76f357721b27542e9ed2a276df1bc608b673"
	"3af3b18091a53ad34003231c736577e836e2680eee376e3b1c3ffdcaa38cb008"
)

package() {
	mkdir -p ${srcdir}/scripts
	find ${srcdir} -maxdepth 1 -type f -print0 | while IFS= read -r -d $'\0' file; do
		trimfname=${file##*/}
		CLASSNAME=$(sed -nE 's/MAINCLASS=(.+)/\1/p' $file)
		if [[ "$CLASSNAME" == "" ]]; then
			continue
		fi
		cp ${srcdir}/template.sh ${srcdir}/scripts/$trimfname
		sed -i -e "s/MAINCLASS_PLACEHOLDER/$CLASSNAME/g" ${srcdir}/scripts/$trimfname
		sed -i -e "s/PKGVER_PLACEHOLDER/${pkgver}/g" ${srcdir}/scripts/$trimfname
	done

	magick ${srcdir}/docs/doomtools-logo.ico[0] ${srcdir}/doomtools-logo.png
	for file in ${srcdir}/scripts/*; do
		install -Dm755 $file ${pkgdir}/usr/bin/"${file##*/}"
	done
	install -Dm755 ${srcdir}/jar/doomtools-${pkgver}.jar -t ${pkgdir}/usr/share/java/doomtools
	install -Dm755 ${srcdir}/doomtools.desktop -t ${pkgdir}/usr/share/applications
	install -Dm644 ${srcdir}/doomtools-logo.png -t ${pkgdir}/usr/share/icons
	install -Dm644 ${srcdir}/docs/LICENSE.txt -t ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 ${srcdir}/docs/*.md -t ${pkgdir}/usr/share/doomtools/docs
	install -Dm644 ${srcdir}/docs/*.txt -t ${pkgdir}/usr/share/doomtools/docs
	install -Dm644 ${srcdir}/docs/licenses/* -t ${pkgdir}/usr/share/licenses/${pkgname}
	rm ${pkgdir}/usr/share/doomtools/docs/LICENSE.txt
}
