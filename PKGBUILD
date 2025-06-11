# Maintainer: Michał Tomczyk <tomczykmk94 _at_ gmail _dot_ com>
# Contributor: Sick Codes <info at sick dot codes>
pkgname=doomtools-bin
pkgver=2025.05.10.194013274
_pkgdate=${pkgver%%.?????????}
pkgrel=1
pkgdesc="Set of command-line utilities for building projects or for other things related to Doom Engine games."
arch=('any')
url="https://mtrop.github.io/DoomTools/"
license=('MIT')
provides=(decohack dmxconv doomfetch doomtools rookscript wadscript wswantbl wtexport dimgconv doommake wadmerge wadtex wtexlist wtexscan)
depends=('java-runtime')
makedepends=('imagemagick')
source=(
	"https://github.com/MTrop/DoomTools/releases/download/${_pkgdate}-RELEASE/doomtools-bash-${pkgver}.tar.gz"
	"template.sh"
	"doomtools.desktop"
)
sha256sums=(
	"fff26d6f9e88f9ab4427301acda57fca9088b6f0047c8e42aab9cd62ad8c038e"
	"aaac007643388ee2bb5737f9c8bd1b36d2f17c54bda38c0757b74ad47425ac9e"
	"e90aecc14f66eed27b8afe409de6f058a285f8eee84a8af207b0398b5450cf57"
)

prepare() {
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
}

package() {
	for file in ${srcdir}/scripts/*; do
		install -Dm755 $file ${pkgdir}/usr/bin/"${file##*/}"
	done
	install -Dm755 ${srcdir}/jar/doomtools-${pkgver}.jar ${pkgdir}/usr/share/java/doomtools/doomtools-${pkgver}.jar
	install -Dm755 ${srcdir}/doomtools.desktop ${pkgdir}/usr/share/applications/doomtools.desktop
	install -Dm644 ${srcdir}/doomtools-logo.png ${pkgdir}/usr/share/icons/doomtools-logo.png
	install -Dm644 ${srcdir}/docs/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
	mkdir -p ${pkgdir}/usr/share/doomtools/docs
	cp ${srcdir}/docs/*.md ${pkgdir}/usr/share/doomtools/docs
	cp ${srcdir}/docs/*.txt ${pkgdir}/usr/share/doomtools/docs
	cp ${srcdir}/docs/licenses/* ${pkgdir}/usr/share/licenses/${pkgname}/
	chmod -R 644 ${pkgdir}/usr/share/doomtools 
	chmod 755 ${pkgdir}/usr/share/doomtools
	chmod 755 ${pkgdir}/usr/share/doomtools/docs
}
