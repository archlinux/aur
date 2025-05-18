# Contributor: Samuel Bernard <samuel.bernard@gmail.com>
# Based on https://aur.archlinux.org/packages/mathematica/
pkgname=wolframengine
pkgver=14.2.0
pkgrel=1
pkgdesc="Free Wolfram Engine(TM) for Developers"
arch=('x86_64')
url="https://www.wolfram.com/engine/"
license=('proprietary')
provides=("wolframscript" "wolframplayer" "wolfram")
source=(
	"WolframEngine_${pkgver}_LINUX.sh::https://account.wolfram.com/dl/WolframEngine?platform=Linux&version=${pkgver%".0"}"
)
noextract=("WolframEngine_${pkgver}_LINUX.sh")
sha256sums=('ea967fd28eba2150834fae7d174af47aa5cadda58262928a79784c8afa2c5b07')
# TODO: list based on namcap, all in opt but some are probably mandatory
depends=()
optdepends=(
	flint
	assimp
	bzip2
	clucene
	curl
	espeak-ng
	ffmpeg
	flite
	gmime3
	intel-mkl
	java-environment
	java-runtime
	lib32-glibc
	libarchive
	libmad
	libnet
	libxinerama
	libxtst
	minizip
	mongo-c-driver
	mpfr
	nss
	nvidia-utils
	opencascade
	portaudio
	primecount
	primesieve
	protobuf
	qhull
	qt6-quick3d
	r
	ruby
	tbb
	tiled
	tre
)
options=("!strip")

prepare() {
	if [ $(echo "${srcdir}" | wc -w) -ne 1 ]; then
		echo "ERROR: The WolframEngine installer doesn't support directory names with spaces."
		echo "Current build directory: ${srcdir}"
		exit 1
	fi

	chmod +x ${srcdir}/WolframEngine_${pkgver}_LINUX.sh
}

package() {
	echo "Running WolframEngine installer"
	# https://support.wolfram.com/46072
	sh ${srcdir}//WolframEngine_${pkgver}_LINUX.sh -- \
		-execdir=${pkgdir}/usr/bin \
		-targetdir=${pkgdir}/opt/WolframEngine \
		-auto
	echo "Errors related to 'xdg-icon-resource' and 'xdg-desktop-menu' are to be expected during WolframEngine's installation."
	#
	echo "Fixing symbolic links"
	#    cd ${pkgdir}/opt/WolframEngine/Executables
	#    rm wolframscript
	#    ln -s /opt/WolframEngine/SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript
	cd ${pkgdir}/usr/bin
	rm -f WolframKernel
	ln -s /opt/WolframEngine/Executables/math
	ln -s /opt/WolframEngine/Executables/MathKernel
	ln -s /opt/WolframEngine/Executables/mcc
	ln -s /opt/WolframEngine/Executables/wolfram
	ln -s /opt/WolframEngine/Executables/WolframKernel
	ln -s /opt/WolframEngine/Executables/wolframplayer
	ln -s /opt/WolframEngine/Executables/WolframPlayer
	ln -s /opt/WolframEngine/SystemFiles/Kernel/Binaries/Linux-x86-64/ELProver
	ln -s /opt/WolframEngine/SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript

	echo "Setting up WolframScript"
	install -vd ${srcdir}/WolframScript
	install -vd ${pkgdir}/usr/share/
	cd ${srcdir}/WolframScript
	bsdtar -xf ${pkgdir}/opt/WolframEngine/SystemFiles/Installation/wolframscript_*+*_amd64.deb data.tar.xz
	tar -xf data.tar.xz -C ${pkgdir}/usr/share/ --strip=3 ./usr/share/

	echo "Copying menu and mimetype information"
	install -vd \
		${pkgdir}/usr/share/applications \
		${pkgdir}/usr/share/desktop-directories \
		${pkgdir}/usr/share/mime/packages
	cd ${pkgdir}/opt/WolframEngine/SystemFiles/Installation
	cp wolfram-all.directory ${pkgdir}/usr/share/desktop-directories/
	cp *.xml ${pkgdir}/usr/share/mime/packages/

	echo "Copying icons"
	install -vd ${pkgdir}/usr/share/icons/hicolor/{32x32,64x64,128x128}/{apps,mimetypes}
	cd ${pkgdir}/opt/WolframEngine/SystemFiles/FrontEnd/SystemResources/X
	for i in 32 64 128; do
		cp App-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-mathematica.png
		for mimetype in $(ls vnd.* | cut -d '-' -f1 | uniq); do
			install -vDm644 ${mimetype}-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-${mimetype}.png
		done
	done

	echo "Copying man pages"
	install -vd ${pkgdir}/usr/share/man/man1
	cd ${pkgdir}/opt/WolframEngine/SystemFiles/SystemDocumentation/Unix
	cp *.1 ${pkgdir}/usr/share/man/man1

	echo "Copying license"
	install -vd ${pkgdir}/usr/share/licenses/WolframEngine/
	install -vDm644 ${pkgdir}/opt/WolframEngine/LICENSE.txt \
		${pkgdir}/usr/share/licenses/WolframEngine/license.txt

	echo "Fixing file permissions"
	chmod go-w -R ${pkgdir}/*

	echo "Clean up"
	rm -f ${pkgdir}/opt/WolframEngine/SystemFiles/Installation/wolframscript*
	rm -f ${pkgdir}/opt/WolframEngine/SystemFiles/Installation/wolfram-mathematica${pkgver%%\.*}.desktop
	rm -f ${pkgdir}/opt/WolframEngine/InstallErrors
}
