# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com> 
# Original Contributors: Giancarlo Bianchi <giancarlobianchi76@gmail.com>
#                        Fortunato Ventre (voRia) <vorione@gmail.com>
#                        Custom Processing Unlimited (CPUnltd) <CPUnltd 'at' gmail 'dot' com>
pkgname=cnijfilter-mg5300
pkgver=3.60
pkgrel=6
_pkgver=3.60-1
pkgdesc="Canon IJ Printer Driver (for MG5300 series)"
url="http://support-au.canon.com.au/contents/AU/EN/0100392802.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('libcups' 'cups' 'popt' 'ghostscript' 'gsfonts' 'atk>=1.9.0' 'gtk2>=2.8.0' 
				 'pango>=1.12.3' 'libpng' 'libtiff' 'cairo>=1.0.2' 'libxml2>=2.6.24' 
				 'fontconfig>=2.3.0' 'libxinerama')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
conflicts=('cnijfilter-common')
install=cnijfilter-mg5300.install
source=("http://gdlp01.c-wss.com/gds/8/0100003928/01/cnijfilter-source-${_pkgver}.tar.gz"
				'build-fixes.patch'
				'cups.patch'
				'id.po.patch'
				'libpng.patch')
sha256sums=('7e4f91a0aebfa32d75da046a20bab992bd6032bb2069cf0091e77d8119a489de'
	       'ffd5c8cf926d6956cd8eec7e36c27fd080ea4f6dfd9e324f4890902584080617'
	       '0b0cad3fad763a35d06550eda1c9de9b7592d4b29b2acb4a927efcad77fbb76c'
	       'b535f0cf501ec4023a3166f85d230d9c0da24e3cdaa5ba3ba435669cb14cbd4c'
	       'f1723e8e6a84942bd9fcfefef3efb20a40384ffb449101eccecf02aac929399c')

prepare() {
  ## Patches
	msg "Applying patches"
  patch -p0 < build-fixes.patch
	patch -p0 < cups.patch
	patch -p0 < id.po.patch
	patch -p0 < libpng.patch
}

build() {
	if [ "$CARCH" == "x86_64" ]; then
		libdir=libs_bin64
	else
		libdir=libs_bin32
	fi

	## Compile mg5300 stuff
	# ppd file
	msg "Building ppd"
	cd ${srcdir}/cnijfilter-source-${_pkgver}/ppd
	./autogen.sh --prefix=/usr --enable-ppdpath=/usr/share/cups/model --program-suffix=mg5300
	make clean
	make

	# cnijfilter
	msg "Building cnijfilter"
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cnijfilter
	autoreconf -i
	./autogen.sh --prefix=/usr --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --program-suffix=mg5300
	make clean
	make

	# printui
	msg "Building printui"
	cd ${srcdir}/cnijfilter-source-${_pkgver}/printui
	./autogen.sh --prefix=/usr --datadir=/usr/share --program-suffix=mg5300
	make clean
	make

	# lgmon
	msg "Building lgmon"
	cd ${srcdir}/cnijfilter-source-${_pkgver}/lgmon
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --program-suffix=mg5300
	make clean
	make

	# cngpijmon
	msg "Building cngpijmon"
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --datadir=/usr/share --program-suffix=mg5300
	make clean
	make
	
	## Compile common stuff
	# libs
	msg "Building common libs"
	cd ${srcdir}/cnijfilter-source-${_pkgver}/libs
	./autogen.sh --prefix=/usr
	make clean
	make

	# cngpij
	msg "Building cngpij"
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpij
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
	make clean
	make
	
	# pstocanonij
	msg "Building pstocanonij"
	cd ${srcdir}/cnijfilter-source-${_pkgver}/pstocanonij
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
	make clean
	make
	
	# backend
	msg "Building backend"
	cd ${srcdir}/cnijfilter-source-${_pkgver}/backend
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
	make clean
	make

	# backendnet
	msg "Building backendnet"
	cd ${srcdir}/cnijfilter-source-${_pkgver}/backendnet
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LDFLAGS="-L../../com/${libdir}"
	make clean
	make

	# sm sub process
	msg "Building cnijnpr"
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon/cnijnpr
	./autogen.sh --prefix=/usr LDFLAGS="-ldl"
	make clean
	make
}

package() {
  if [ "$CARCH" == "x86_64" ]; then
		libdir=libs_bin64
	else
		libdir=libs_bin32
	fi

  cd ${srcdir}/cnijfilter-source-${_pkgver}/ppd
  msg "Installing ppd"
  make DESTDIR=${pkgdir} install


  cd ${srcdir}/cnijfilter-source-${_pkgver}/cnijfilter
  msg "Installing cnijfilter"
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/cnijfilter-source-${_pkgver}/printui
  msg "Installing printui"
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/cnijfilter-source-${_pkgver}/lgmon
  msg "Installing lgmon"
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon
  msg "Installing cngpijmon"
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/cnijfilter-source-${_pkgver}/libs
  msg "Installing libs"
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/cnijfilter-source-${_pkgver}/pstocanonij
  msg "Installing pstocanonij"
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/cnijfilter-source-${_pkgver}/backend
  msg "Installing backend"
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/cnijfilter-source-${_pkgver}/backendnet
  msg "Installing backendnet"
  make DESTDIR=${pkgdir} install

  cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon/cnijnpr
  msg "Installing cnijnpr"
  make DESTDIR=${pkgdir} install

  # Install mg5300 libraries
	msg "Installing libraries"
	install -d ${pkgdir}/usr/lib/
  for lib in libcnbpcmcm393.so.8.10.1 libcnbpcnclapi393.so.3.6.1 libcnbpcnclbjcmd393.so.3.3.0 libcnbpcnclui393.so.3.6.1 libcnbpess393.so.4.1.3 libcnbpo393.so.1.0.4
  do
	  install -m 755 ${srcdir}/cnijfilter-source-${_pkgver}/393/${libdir}/${lib} ${pkgdir}/usr/lib/
  done
	install -d ${pkgdir}/usr/lib/bjlib/
	install -m 644 ${srcdir}/cnijfilter-source-${_pkgver}/393/database/* ${pkgdir}/usr/lib/bjlib/

  # Install common libraries
	install -m 755 ${srcdir}/cnijfilter-source-${_pkgver}/com/${libdir}/libcnnet.so.1.2.2 ${pkgdir}/usr/lib/
	install -m 666 ${srcdir}/cnijfilter-source-${_pkgver}/com/ini/cnnet.ini ${pkgdir}/usr/lib/bjlib/

	# Make symbolic links for libraries
	cd ${pkgdir}/usr/lib/
	ln -s libcnnet.so.1.2.2 libcnnet.so
	ln -s libcnbpcmcm393.so.8.10.1 libcnbpcmcm393.so
	ln -s libcnbpcnclapi393.so.3.6.1 libcnbpcnclapi393.so
	ln -s libcnbpcnclbjcmd393.so.3.3.0 libcnbpcnclbjcmd393.so
	ln -s libcnbpcnclui393.so.3.6.1 libcnbpcnclui393.so
	ln -s libcnbpess393.so.4.1.3 libcnbpess393.so
	ln -s libcnbpo393.so.1.0.4 libcnbpo393.so

	# Install license file
	cd ${srcdir}/cnijfilter-source-${_pkgver}
	install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
}

# vim:set ts=2 sw=2 :et
