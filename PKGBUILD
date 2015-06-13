# Contributor: Tom < reztho at archlinux dot us >
# Based on an AUR contribution of: Juraj Misur <juraj.misur@gmail.com>
pkgname=capt-src
pkgver=2.60
pkgrel=3
pkgdesc="Canon CAPT Printer Driver for Linux. Compiled from source code."
arch=('i686' 'x86_64')
url='http://support-asia.canon-asia.com/'
license=('custom')
depends=('cups' 'libglade' 'libxml2' 'popt')
[ "${CARCH}" == "x86_64" ] && depends=('cups' 'libglade' 'lib32-libcups' 'lib32-libxml2' 'lib32-popt' 'lib32-gcc-libs')
optdepends=('gtk2: for gui')
install=${pkgname}.install
_tardir=Linux_CAPT_PrinterDriver_V260_uk_EN
source=("http://gdlp01.c-wss.com/gds/6/0100004596/03/${_tardir}.tar.gz"
        'ccpd.service')
options=(!strip !zipman)

package() {
    unset LDFLAGS
    _common_dir=${srcdir}/cndrvcups-common-${pkgver}-1
    _capt_dir=${srcdir}/cndrvcups-capt-${pkgver}-1
    _endlibdir=/usr/lib
    [ "${CARCH}" == "x86_64" ] && _endlibdir=/usr/lib32

    # Decompressing source and proprietary code packages
    cd ${srcdir}
    tar xvzf ${srcdir}/${_tardir}/Src/cndrvcups-common-${pkgver}-1.tar.gz
    tar xvzf ${srcdir}/${_tardir}/Src/cndrvcups-capt-${pkgver}-1.tar.gz

    # Starting source code compilation
    # (based on the official Debian rules/Red Hat spec file of the driver)

    # cndrvcups-common package
    msg "cndrvcups-common package"
    msg "Configuring cndrvcups-common package"
    msg "Configuring: buftool"
    cd ${_common_dir}/buftool && /usr/bin/autoreconf -fi && ./autogen.sh --prefix=/usr --libdir=/usr/lib
    msg "Configuring: cngplp"
    cd ${_common_dir}/cngplp && /usr/bin/autoreconf -fi && LIBS=-lgmodule-2.0 ./autogen.sh --prefix=/usr --libdir=/usr/lib


    msg "Compiling cndrvcups-common package"
    cd ${_common_dir}
    make

    cd ${_common_dir}/c3plmod_ipc
    make

    msg "Installing cndrvcups-common package"
    for _dir in buftool cngplp
    do
        msg "Installing: $_dir"
        cd ${_common_dir}/$_dir && make DESTDIR=${pkgdir} install
    done

    msg "Installing: c3plmod_ipc"
    cd ${_common_dir}/c3plmod_ipc/
    make install DESTDIR=${pkgdir} LIBDIR=/usr/lib

    # cndrvcups-capt package
    msg "cndrvcups-capt package"
    
    #Patching statusui
    sed -i 's@#include <cups/cups.h>@#include <cups/cups.h>\n#include <cups/ppd.h>@' "${_capt_dir}/statusui/src/ppapdata.c"
    sed -i 's@char req_header\[4\];@char req_header\[5\];@' "${_capt_dir}/statusui/cnsktmodule/cnsktmodule.h"

    msg "Configuring cndrvcups-capt package"
    
    msg "Configuring: driver"
    cd ${_capt_dir}/driver && /usr/bin/autoreconf -fi && LDFLAGS=-L${pkgdir}/usr/lib CPPFLAGS=-I${pkgdir}/usr/include ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --disable-static
    
    for _dir in backend pstocapt pstocapt2 pstocapt3
    do
        msg "Configuring: "${_dir}
        cd ${_capt_dir}/$_dir && /usr/bin/autoreconf -fi && LDFLAGS=-L${pkgdir}/usr/lib CPPFLAGS=-I${pkgdir}/usr/include ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
    done
        
    msg "Configuring: ppd"
    cd ${_capt_dir}/ppd && /usr/bin/autoreconf -fi && LDFLAGS=-L${pkgdir}/usr/lib CPPFLAGS=-I${pkgdir}/usr/include ./autogen.sh --prefix=/usr
        
    msg "Configuring: statusui"
    cd ${_capt_dir}/statusui && /usr/bin/autoreconf -fi && LDFLAGS=-L${pkgdir}/usr/lib LIBS=-lpthread CPPFLAGS=-I${pkgdir}/usr/include ./autogen.sh --prefix=/usr --disable-static
    
    msg "Configuring: cngplp"
    cd ${_capt_dir}/cngplp/ && LDFLAGS=-L${pkgdir}/usr/lib /usr/bin/autoreconf -fi && LDFLAGS=-L${pkgdir}/usr/lib CPPFLAGS=-I${pkgdir}/usr/include ./autogen.sh --prefix=/usr --libdir=/usr/lib
    msg "Configuring: cngplp/files"
    cd ${_capt_dir}/cngplp/files && LDFLAGS=-L${pkgdir}/usr/lib /usr/bin/autoreconf -fi && LDFLAGS=-L${pkgdir}/usr/lib CPPFLAGS=-I${pkgdir}/usr/include ./autogen.sh

    msg "Compiling cndrvcups-capt package"
    cd ${_capt_dir}
    make

    msg "Installing cndrvcups-capt package"
    for _dir in driver ppd backend pstocapt pstocapt2 pstocapt3 statusui cngplp
    do
        msg "installing: $_dir"
        cd ${_capt_dir}/$_dir && make DESTDIR=${pkgdir} install
    done
    # End of the source code compilation

    # Starting copying of proprietary binaries...
    # (based on the official Debian rules of the driver)

    msg "Finished source code compilation... copying rest of files"

    # For the cndrvcups-common package...
    cd ${_common_dir}
    install -dm755 ${pkgdir}/usr/bin
    install -c -m 755 libs/c3pldrv ${pkgdir}/usr/bin
    install -dm755 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libcaiowrap.so.1.0.0 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libcaiousb.so.1.0.0 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libc3pl.so.0.0.1 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libcaepcm.so.1.0 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libcanon_slim.so.1.0.0 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libColorGear.so.0.0.0 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libColorGearC.so.0.0.0 ${pkgdir}${_endlibdir}

    cd ${pkgdir}${_endlibdir}
    ln -s libc3pl.so.0.0.1 libc3pl.so.0
    ln -s libc3pl.so.0.0.1 libc3pl.so
    ln -s libcaepcm.so.1.0 libcaepcm.so.1
    ln -s libcaepcm.so.1.0 libcaepcm.so
    ln -s libcaiowrap.so.1.0.0 libcaiowrap.so.1
    ln -s libcaiowrap.so.1.0.0 libcaiowrap.so
    ln -s libcaiousb.so.1.0.0 libcaiousb.so.1
    ln -s libcaiousb.so.1.0.0 libcaiousb.so
    ln -s libcanon_slim.so.1.0.0 libcanon_slim.so.1
    ln -s libcanon_slim.so.1.0.0 libcanon_slim.so
    ln -s libColorGear.so.0.0.0 libColorGear.so.0
    ln -s libColorGear.so.0.0.0 libColorGear.so
    ln -s libColorGearC.so.0.0.0 libColorGearC.so.0
    ln -s libColorGearC.so.0.0.0 libColorGearC.so

    cd ${pkgdir}/usr/lib
    ln -s libcanonc3pl.so.1.0.0 libcanonc3pl.so.1
    ln -s libcanonc3pl.so.1.0.0 libcanonc3pl.so

    install -dm755 ${pkgdir}/usr/share/caepcm
    cd ${_common_dir}
    install -c -m 644 data/CA*    ${pkgdir}/usr/share/caepcm
    install -c -m 644 data/CNZ0*  ${pkgdir}/usr/share/caepcm

    # Debian postinst

    # For the cndrvcups-capt package...
    cd ${_capt_dir}
    install -dm755 ${pkgdir}${_endlibdir}
    install -c libs/libcaptfilter.so.1.0.0  ${pkgdir}${_endlibdir}
    install -c libs/libcaiocaptnet.so.1.0.0 ${pkgdir}${_endlibdir}
    install -c libs/libcncaptnpm.so.2.0.1   ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libcnaccm.so.1.0   ${pkgdir}${_endlibdir}
    cd ${pkgdir}${_endlibdir}
    ln -s libcaptfilter.so.1.0.0 libcaptfilter.so.1
    ln -s libcaptfilter.so.1.0.0 libcaptfilter.so
    ln -s libcaiocaptnet.so.1.0.0 libcaiocaptnet.so.1
    ln -s libcaiocaptnet.so.1.0.0 libcaiocaptnet.so
    ln -s libcncaptnpm.so.2.0.1 libcncaptnpm.so.2
    ln -s libcncaptnpm.so.2.0.1 libcncaptnpm.so
    ln -s libcnaccm.so.1.0 libcnaccm.so.1
    ln -s libcnaccm.so.1.0 libcnaccm.so

    install -dm755 ${pkgdir}/usr/bin
    
    cd ${_capt_dir}
    install -c libs/captdrv                 ${pkgdir}/usr/bin
    install -c libs/captfilter              ${pkgdir}/usr/bin
    install -c libs/captmon/captmon         ${pkgdir}/usr/bin
    install -c libs/captmon2/captmon2       ${pkgdir}/usr/bin
    install -c libs/captemon/captmon*       ${pkgdir}/usr/bin
    install -c libs/ccpd                    ${pkgdir}/usr/bin
    install -c libs/ccpdadmin               ${pkgdir}/usr/bin
    install -dm755 ${pkgdir}/etc
    install -c samples/ccpd.conf            ${pkgdir}/etc
    install -dm755 ${pkgdir}/usr/share/ccpd
    install -dm755 ${pkgdir}/usr/share/captfilter
    install -c libs/ccpddata/CNA*L.BIN    ${pkgdir}/usr/share/ccpd
    install -c libs/ccpddata/CNA*LS.BIN    ${pkgdir}/usr/share/ccpd
    install -c libs/ccpddata/cnab6cl.bin    ${pkgdir}/usr/share/ccpd
    install -c libs/CnA*INK.DAT ${pkgdir}/usr/share/captfilter
    install -c libs/captemon/CNAC*.BIN    ${pkgdir}/usr/share/ccpd
    install -dm755 ${pkgdir}/usr/share/captmon
    install -c libs/captmon/msgtable.xml    ${pkgdir}/usr/share/captmon
    install -dm755 ${pkgdir}/usr/share/captmon2
    install -c libs/captmon2/msgtable2.xml  ${pkgdir}/usr/share/captmon2
    install -dm755 ${pkgdir}/usr/share/captemon
    install -c libs/captemon/msgtablelbp*   ${pkgdir}/usr/share/captemon
    install -c libs/captemon/msgtablecn*    ${pkgdir}/usr/share/captemon
    install -dm755 ${pkgdir}/usr/share/caepcm
    install -c -m 644 data/C*   ${pkgdir}/usr/share/caepcm
    install -dm755 ${pkgdir}/usr/share/doc/capt-src
    install *capt*.txt ${pkgdir}/usr/share/doc/capt-src
    # End of copying the proprietary source

    # Other dirs...
    install -dm755 ${pkgdir}/usr/share/ppd/cupsfilters
    cd ${pkgdir}/usr/share/cups/model
    for fn in CN*CAPT*.ppd; do
  	    ln -s /usr/share/cups/model/${fn} ${pkgdir}/usr/share/ppd/cupsfilters/${fn}
    done

    install -dm750 -o root -g lp ${pkgdir}/var/captmon/

    # Installation of the custom Arch Linux CCPD systemd service
    install -dm755 ${pkgdir}/usr/lib/systemd/system/
    install -Dm664 ${srcdir}/ccpd.service ${pkgdir}/usr/lib/systemd/system/ccpd.service

    # Custom License
    install -dm755 ${pkgdir}/usr/share/licenses/$pkgname
    install -Dm664 ${srcdir}/${_tardir}/Doc/LICENSE-captdrv-${pkgver}E.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE-captdrv-${pkgver}E.txt

    # Guide
    install -Dm664 ${srcdir}/${_tardir}/Doc/guide-capt-2.6xUK.tar.gz ${pkgdir}/usr/share/doc/capt-src/guide-capt-2.6xUK.tar.gz
}

md5sums=('356fe6abed036f107eaaca92186e0c56'
         '4a6e0263535e96c119feafdbfd62cdd0')
