# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
pkgname=usbdm-git
pkgver=1657.d74be9b5
pkgrel=1
pkgdesc="Debugger interface for Freescale RS08,HCS08,HCS12,Coldfire and ARM-Kinetis Devices."
arch=("x86_64")
url="http://usbdm.sourceforge.net/"
license=('GPL2')
depends=("java-runtime" "webkit2gtk" "xerces-c" "tcl" "wxgtk2" "xdg-utils")
makedepends=("java-environment")
provides=("usbdm")
conflicts=("usbdm")
options=("!makeflags")
install="usbdm.install"

source=("git+https://github.com/podonoghue/usbdm-eclipse-makefiles-build.git"
        "undebian.patch"
        "60-usbdm.rules")
sha256sums=('SKIP'
            'c12b63567e9623b1587aac6140b20976b29ac063d7c21c7221b295be64cd5dec'
            '88eaab73a1020ac84d4979a4f70f122214b0042d167942a95bddd0560f0e3aa8')

pkgver() {
	cd "usbdm-eclipse-makefiles-build"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/usbdm-eclipse-makefiles-build"
	patch -p1 -i "${srcdir}/undebian.patch"
	sed -i -e 's/xercesc_3_1/xercesc/g' 'MergeXML/src/xmlParser.h'
}

build() {
	cd "${srcdir}/usbdm-eclipse-makefiles-build"
	./MakeAll
}

# This function tracks the CreateDebFile script from upstream.
package() {
	SOURCE_DIRECTORY="${srcdir}/usbdm-eclipse-makefiles-build"

	CP="cp -p"
	MKDIR="mkdir -p"
	RM="rm -f"
	MV="mv"

	# Where to find libraries and binaries
	USBDM_SOURCE_LIBDIR=${SOURCE_DIRECTORY}/PackageFiles/lib

	# Where to copy executables from
	USBDM_SOURCE_BINDIR=${SOURCE_DIRECTORY}/PackageFiles/bin

	# Where to construct the install tree
	DUMMY_ROOT="$pkgdir"

	# Where to copy libraries to
	USBDM_LIBDIR="${DUMMY_ROOT}/usr/lib/usbdm"

	# Shared files
	USBDM_SHARED_DIR="${DUMMY_ROOT}/usr/share/usbdm"

	# Shared document files
	USBDM_SHARED_DOC_DIR="${DUMMY_ROOT}/usr/share/doc/usbdm"

	# Binary files
	USBDM_BINDIR="${DUMMY_ROOT}/usr/bin"

	# Icon files
	PIXMAP_DIR="${DUMMY_ROOT}/usr/share/pixmaps"

	# Where to put .desktop files
	LINUX_APPLICATIONS_DIR="${DUMMY_ROOT}/usr/share/applications"

	# Where to put Man page files
	USBDM_MANUAL_DIR="${DUMMY_ROOT}/usr/share/man/man1"

	${MKDIR} ${PIXMAP_DIR}
	${CP} "${SOURCE_DIRECTORY}/PackageFiles"/MiscellaneousLinux/Hardware-Chip.png ${PIXMAP_DIR}

	${MKDIR} ${LINUX_APPLICATIONS_DIR}
	${CP} "${SOURCE_DIRECTORY}/PackageFiles"/MiscellaneousLinux/*.desktop       ${LINUX_APPLICATIONS_DIR}
	chmod  644 ${LINUX_APPLICATIONS_DIR}/*.desktop

	${MKDIR} ${USBDM_SHARED_DOC_DIR}
	${CP} "${SOURCE_DIRECTORY}/PackageFiles"/MiscellaneousLinux/changelog.Debian.gz   ${USBDM_SHARED_DOC_DIR}
	${CP} "${SOURCE_DIRECTORY}/PackageFiles"/MiscellaneousLinux/copyright             ${USBDM_SHARED_DOC_DIR}

	${MKDIR} ${USBDM_SHARED_DIR}
	${CP} -r "${SOURCE_DIRECTORY}/PackageFiles/WizardPatches"                   ${USBDM_SHARED_DIR}
	${CP} -r "${SOURCE_DIRECTORY}/PackageFiles/DeviceData"                      ${USBDM_SHARED_DIR}
	${CP} -r "${SOURCE_DIRECTORY}/PackageFiles/Stationery"                      ${USBDM_SHARED_DIR}
	${CP} -r "${SOURCE_DIRECTORY}/PackageFiles/Examples"                        ${USBDM_SHARED_DIR}
	${CP} -r "${SOURCE_DIRECTORY}/PackageFiles/FlashImages"                     ${USBDM_SHARED_DIR}
	${CP} -r "${SOURCE_DIRECTORY}/PackageFiles/LaunchConfig"                    ${USBDM_SHARED_DIR}

	${CP} "${SOURCE_DIRECTORY}/PackageFiles"/Miscellaneous/nano.specs           ${USBDM_SHARED_DIR}
	${CP} "${SOURCE_DIRECTORY}/PackageFiles"/Miscellaneous/*.xlkr               ${USBDM_SHARED_DIR}
	${CP} "${SOURCE_DIRECTORY}/PackageFiles"/Miscellaneous/error.wav            ${USBDM_SHARED_DIR}
	${CP} "${SOURCE_DIRECTORY}/PackageFiles"/MiscellaneousLinux/TryProgrammer   ${USBDM_SHARED_DIR}	
	chmod -f 755 ${USBDM_SHARED_DIR}/TryProgrammer
	${CP} "${SOURCE_DIRECTORY}/PackageFiles"/MiscellaneousLinux/usbdm.rules     ${USBDM_SHARED_DIR}
	${CP} "${SOURCE_DIRECTORY}/PackageFiles"/Scripts/*.tcl                      ${USBDM_SHARED_DIR}

	${MKDIR} ${USBDM_LIBDIR}
	${CP} -r -P "${USBDM_SOURCE_LIBDIR}"/*      ${USBDM_LIBDIR}
	#${RM} ${USBDM_LIBDIR}/*-debug*
	chmod 644  ${USBDM_LIBDIR}/*

	${MKDIR} ${USBDM_BINDIR}
	${CP} -r "${USBDM_SOURCE_BINDIR}"/*      ${USBDM_BINDIR}
	# Remove debug and test files
	${RM} ${USBDM_BINDIR}/CopyFlash
	${RM} ${USBDM_BINDIR}/*TestImage
	${RM} ${USBDM_BINDIR}/*Example*   
	#${RM} ${USBDM_BINDIR}/*-debug
	${RM} ${USBDM_BINDIR}/Test*
	chmod 755  ${USBDM_BINDIR}/*

	${MKDIR} ${USBDM_MANUAL_DIR}
	#echo ${SOURCE_DIRECTORY}/Documentation/ManPages/*
	for MANPAGE_FILE in ${SOURCE_DIRECTORY}/Documentation/ManPages/*; do   
		${CP} ${MANPAGE_FILE} ${MANPAGE_FILE}.1
		gzip --best -f ${MANPAGE_FILE}.1
		${MV} ${MANPAGE_FILE}.1.gz ${USBDM_MANUAL_DIR}
	done
	chmod 644 ${USBDM_MANUAL_DIR}/* 

	find ${DUMMY_ROOT}   -type d -exec chmod 755 {} \;
	find ${USBDM_LIBDIR} -type f -executable -exec chmod 755 {} \; -exec strip {} \;
	find ${USBDM_LIBDIR} -type f -name \*.so\* -exec chmod 644 {} \;
	find ${DUMMY_ROOT}   -type f ! -executable -exec chmod 644 {} \;

	install -pD -m=664 "${srcdir}/60-usbdm.rules" "${pkgdir}/usr/lib/udev/rules.d/60-usbdm.rules"
}
