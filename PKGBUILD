# Maintainer: Scott Lawrence <bytbox@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Sebastian Voecking <voeck@web.de>

pkgname=root
pkgver=6.04.02
pkgrel=1
pkgdesc='C++ data analysis framework and interpreter from CERN.'
arch=('i686' 'x86_64')
url='http://root.cern.ch'
license=('LGPL2.1')
makedepends=('cmake')
depends=('desktop-file-utils'
'fftw'
'ftgl'
'giflib'
'glew'
'graphviz'
'gsl'
'libmysqlclient'
'postgresql-libs'
'python'
'unixodbc'
'shared-mime-info'
'xmlrpc-c'
'xorg-fonts-75dpi'
'gcc-fortran'
'libiodbc'
'gtk-update-icon-cache'
'libafterimage')
install='root.install'
options=('!emptydirs')
source=("ftp://root.cern.ch/root/root_v${pkgver}.source.tar.gz"
'root.sh'
'rootd'
'root.xml'
'python3.diff')
md5sums=('ead93da34ad0f017e630e62721aae91c'
         '0e883ad44f99da9bc7c23bc102800b62'
         'efd06bfa230cc2194b38e0c8939e72af'
         'e2cf69b204192b5889ceb5b4dedc66f7'
		 '673e0f4d21a19381a2eba8277ce7d4b1')
						   
prepare(){
	## https://sft.its.cern.ch/jira/browse/ROOT-6924
	cd ${pkgname}-${pkgver}

	patch -p1 < ${srcdir}/python3.diff
	2to3 -w etc/dictpch/makepch.py 2>&1 > /dev/null

	#msg 'python2 switch'
	#find . -type f -exec sed -e 's_#!/usr/bin/env python_&2_' \
	#	-e 's/python -O/python2 -O/g' \
	#	-e 's/python -c/python2 -c/g' -i {} \;
}

build() {
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	local sys_libs=""
	for sys_lib in ftgl freetype glew pcre zlib lzma; do
		sys_libs+="-Dbuiltin_${sys_lib}=ON "
	done

	cmake ${srcdir}/${pkgname}-${pkgver} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Dgnuinstall=ON \
		-Droofit=ON \
		-Dtesting=OFF \
		-Dcastor=OFF \
		${sys_libs}

	make
}

package() {
	cd ${srcdir}/build

	make DESTDIR=${pkgdir} install

	install -D ${srcdir}/root.sh \
		${pkgdir}/etc/profile.d/root.sh
	install -D ${srcdir}/rootd \
		${pkgdir}/etc/rc.d/rootd
	install -D -m644 ${srcdir}/root.xml \
		${pkgdir}/usr/share/mime/packages/root.xml

	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/build/package/debian/root-system-bin.desktop.in \
		${pkgdir}/usr/share/applications/root-system-bin.desktop
	# replace @prefix@ with /usr for the desktop
	sed -e 's_@prefix@_/usr_' -i ${pkgdir}/usr/share/applications/root-system-bin.desktop

	install -D -m644 ${srcdir}/${pkgname}-${pkgver}/build/package/debian/root-system-bin.png \
		${pkgdir}/usr/share/icons/hicolor/48x48/apps/root-system-bin.png

	# use a file that pacman can track instead of adding directly to ld.so.conf
	install -d ${pkgdir}/etc/ld.so.conf.d
	echo '/usr/lib/root' > ${pkgdir}/etc/ld.so.conf.d/root.conf

	rm -rf ${pkgdir}/etc/root/daemons
}

