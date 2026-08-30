# Maintainer: Michał Tomczyk <tomczykmk94 _at_ gmail _dot_ com>
# Contributor: Sick Codes <info at sick dot codes>
pkgname=doomtools-bin
pkgver=2026.08.29.201519238
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
	"47d31b4977016b447db30432d5d4c1f242fff6f5e4435e7b99d7454feefc16dd"
	"dab435a5096090c2106875966bec76f357721b27542e9ed2a276df1bc608b673"
	"d7ac55b49120883c6076a8c6bb884a96e66a9c111362a68f2e69fe3b894f61c1"
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

	magick ${srcdir}/docs/doomtools-logo.ico ${srcdir}/doomtools.png
	for file in ${srcdir}/scripts/*; do
		install -Dm755 $file ${pkgdir}/usr/bin/"${file##*/}"
	done
	install -Dm755 ${srcdir}/jar/doomtools-${pkgver}.jar -t ${pkgdir}/usr/share/java/doomtools
	install -Dm755 ${srcdir}/doomtools.desktop -t ${pkgdir}/usr/share/applications
	install -Dm644 ${srcdir}/doomtools-0.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/doomtools.png
	install -Dm644 ${srcdir}/doomtools-1.png ${pkgdir}/usr/share/icons/hicolor/96x96/apps/doomtools.png
	install -Dm644 ${srcdir}/doomtools-2.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/doomtools.png
	install -Dm644 ${srcdir}/doomtools-3.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/doomtools.png
	install -Dm644 ${srcdir}/doomtools-4.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/doomtools.png
	install -Dm644 ${srcdir}/doomtools-5.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/doomtools.png
	install -Dm644 ${srcdir}/docs/LICENSE.txt -t ${pkgdir}/usr/share/licenses/${pkgname}
	install -Dm644 ${srcdir}/docs/*.md -t ${pkgdir}/usr/share/doomtools/docs
	install -Dm644 ${srcdir}/docs/*.txt -t ${pkgdir}/usr/share/doomtools/docs
	install -Dm644 ${srcdir}/docs/licenses/* -t ${pkgdir}/usr/share/licenses/${pkgname}
	rm ${pkgdir}/usr/share/doomtools/docs/LICENSE.txt
}
