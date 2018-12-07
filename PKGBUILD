# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=libpcanbasic
pkgver=4.2.2
pkgrel=1
pkgdesc='Linux driver for PEAK CAN adapter'
arch=('x86_64')
url='https://www.peak-system.com/PCAN-USB.199.0.html'
license=('LGPL')
depends=('peak-linux-headers')
source=(
    "https://www.peak-system.com/produktcd/Develop/PC%20interfaces/Linux/PCAN-Basic_API_for_Linux/PCAN_Basic_Linux-${pkgver}.tar.gz"
)
sha256sums=(
    "95b1916a28f9dd02d2840da8369558a7e5a3a977b9e9f1046ff67616dcc8977b"
)

prepare() {
    # go into source directory 
    cd "PCAN_Basic_Linux-${pkgver}/pcanbasic"

    # add new install target into the makefile
    echo -e ''                                                                  >> 'Makefile_latest.mk'
    echo -e 'install-archlinux:'                                                >> 'Makefile_latest.mk'
    echo -e '\tcp $(TARGET) $(DESTDIR)/$(LIBPATH)/$(TARGET)'                    >> 'Makefile_latest.mk'
    echo -e '\t$(LN) /$(LIBPATH)/$(TARGET) $(DESTDIR)/$(LIBPATH)/$(SONAME)'     >> 'Makefile_latest.mk'
	echo -e '\t$(LN) /$(LIBPATH)/$(TARGET) $(DESTDIR)/$(LIBPATH)/$(SONAME_OLD)' >> 'Makefile_latest.mk'
	echo -e '\t$(LN) /$(LIBPATH)/$(SONAME) $(DESTDIR)/$(LIBPATH)/$(LDNAME)'     >> 'Makefile_latest.mk'
	echo -e '\tcp PCANBasic.h $(DESTDIR)/usr/include/PCANBasic.h'               >> 'Makefile_latest.mk'
	echo -e '\tchmod 644 $(DESTDIR)/usr/include/PCANBasic.h'                    >> 'Makefile_latest.mk'
}

build() {
    # go into source directory 
    cd "PCAN_Basic_Linux-${pkgver}/pcanbasic"

    # build libpcanbasic
    make clean
    make
}

package() {
    # go into source directory 
    cd "PCAN_Basic_Linux-${pkgver}/pcanbasic"

    # create directories
    install -d "${pkgdir}/usr/lib"
    install -d "${pkgdir}/usr/include"

    # install files
    make LIBPATH="usr/lib" DESTDIR="${pkgdir}" install-archlinux
}
