# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of 'AMDuProf_Linux_x64_${pkgver}.tar.bz2' required from upstream

pkgname=amduprof
pkgver=3.2.228
pkgrel=1
pkgdesc="AMD uProf performance analysis tool."
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-uprof/"
source=("local://AMDuProf_Linux_x64_${pkgver}.tar.bz2"
		"local://modulefile")
options=('staticlibs' '!strip' 'libtool')
depends=('env-modules')
install=amduprof.install
md5sums=("5b7927f1b583fc56f9d021d8116496af"
		"SKIP")

amduprof_prefix=/opt/${pkgname}

package() {
	prefix=${pkgdir}/${amduprof_prefix}
	mkdir -p ${prefix}
	cp -r ${srcdir}/AMDuProf_Linux_x64_${pkgver}/* ${prefix}

	# pkg-config file
	mkdir -p ${prefix}/lib/pkgconfig
	cat > ${prefix}/lib/pkgconfig/amduprof.pc <<EOF
prefix=${amduprof_prefix}/${pkgname}
libdir=\${prefix}/lib/x86
includedir=\${prefix}/include

Name: ${pkgname}
Version: ${pkgver}
Description: ${pkgdesc}
URL: ${url}
Requires:
Cflags: -I\${includedir}
Libs: -L\${libdir} -l:libAMDProfileController.a
Libs.private:
EOF

	# modulefile
	echo -e "\nSymlinking modulefile '${modulefile}'..."
	cp ${srcdir}/modulefile ${prefix}
	mkdir -p ${pkgdir}${MODULESHOME}/modulefiles/
	ln -s ${amduprof_prefix}/modulefile ${pkgdir}${MODULESHOME}/modulefiles/${pkgname}
}
