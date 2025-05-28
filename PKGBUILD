# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Tom < reztho at archlinux dot us >
# Based on an AUR contribution of: Juraj Misur <juraj.misur@gmail.com>
# Contributors:
# - veger
pkgname=capt-src
pkgver=2.71
pkgrel=7
pkgdesc="Canon CAPT Printer Driver for Linux. Compiled from source code."
arch=('i686' 'x86_64')
url='http://support-asia.canon-asia.com/'
license=('custom')
depends=('cups' 'glib2' 'libglade' 'gtk2' 'atk' 'libxml2' 'popt' 'ghostscript')
depends_x86_64=('lib32-libxml2-legacy' 'lib32-popt' 'lib32-gcc-libs' 'lib32-libcups' 'lib32-glibc')
conflicts=('cndrvcups-lb' 'cndrvcups-lb' 'cndrvcups-common-lb')
install=${pkgname}.install
_tardir=linux-capt-drv-v271-uken
source=("http://gdlp01.c-wss.com/gds/6/0100004596/05/${_tardir}.tar.gz"
        'ccpd.service')
b2sums=('10d1b76865f2e3ea8f974191cc7967d3969ce144a03b971945eb292ec2a3e78bf40ce53b921b5cab9b1da14a218aac9b946d4526e5e4e860f5eb4ab172e4e2a2'
        '6da164622ac9f889c96a2c6bdf99fde27959f6e2f9e6e89d9dbbbc4362b0ff2292e613bc737dc4bdb49792fd0c5f854b6684810188242fa1aae98b88865946ee')
options=(!strip !zipman !buildflags)
backup=('etc/ccpd.conf')

_pkgcommonver=3.21
_endlibdir=/usr/lib

prepare() {
    _capt_dir=${srcdir}/cndrvcups-capt-${pkgver}
    _common_dir=${srcdir}/cndrvcups-common-${_pkgcommonver}

    cd ${srcdir}
    tar xvzf ${srcdir}/${_tardir}/Src/cndrvcups-common-${_pkgcommonver}-1.tar.gz
    tar xvzf ${srcdir}/${_tardir}/Src/cndrvcups-capt-${pkgver}-1.tar.gz

    # Enables compilation
    sed -i 's@#include <cups/cups.h>@#include <cups/cups.h>\n#include <cups/ppd.h>@' "${_capt_dir}/statusui/src/ppapdata.c"
    # Enables captstatusui - Thanks to kaztai
    sed -i 's@#include <cups/cups.h>@#include <cups/cups.h>\n#include <cups/ppd.h>@' "${_capt_dir}/statusui/src/uimain.c"
#
    # Enables compilation (A smattering of fixes)
    sed -i 's@#include <cups/cups.h>@#include <cups/cups.h>\n#include <cups/ppd.h>@' "${_common_dir}/cngplp/src/printerinfo.c"
    sed -i 's/int StartProcess2(mode)/int StartProcess2(int mode)/' "${_capt_dir}/statusui/src/main.c"
    sed -i 's/int StartProcess(mode)/int StartProcess(int mode)/' "${_capt_dir}/statusui/src/main.c"
    sed -i 's@#include <asm/errno.h>@#include <asm/errno.h>\n#include "../cnsktmodule/cnsktmodule.h"@' "${_capt_dir}/statusui/src/data_process.c"
    sed -i 's@#include <stdlib.h>@#include <stdlib.h>\n#include <cups/ppd.h>@' "${_capt_dir}/cngplp/cngplpmod/cngplpmod.c"

}

_build_cndrvcups_common() {
    _common_dir=${srcdir}/cndrvcups-common-${_pkgcommonver}

    msg "cndrvcups-common package"
    msg "Configuring cndrvcups-common package"
    msg "Configuring: buftool"
    cd ${_common_dir}/buftool && /usr/bin/autoreconf -fi && ./autogen.sh --prefix=/usr --libdir=/usr/lib
    msg "Configuring: cngplp"
    cd ${_common_dir}/cngplp && /usr/bin/autoreconf -fi && LDFLAGS='-z muldefs' LIBS='-lgmodule-2.0 -lgtk-x11-2.0 -lglib-2.0 -lgobject-2.0' ./autogen.sh --prefix=/usr --libdir=/usr/lib
    msg "Configuring: backend"
    cd ${_common_dir}/backend && /usr/bin/autoreconf -fi && ./autogen.sh --prefix=/usr --libdir=/usr/lib

    msg "Compiling cndrvcups-common package"
    cd ${_common_dir}
    make

    cd ${_common_dir}/c3plmod_ipc
    make
}

_package_cndrvcups_common() {
    _common_dir=${srcdir}/cndrvcups-common-${_pkgcommonver}

    msg "Installing cndrvcups-common package"
    for _dir in buftool cngplp backend
    do
        msg "Installing: $_dir"
        cd ${_common_dir}/$_dir && make DESTDIR=${pkgdir} install
    done

    msg "Installing: c3plmod_ipc"
    cd ${_common_dir}/c3plmod_ipc/
    make install DESTDIR=${pkgdir} LIBDIR=/usr/lib

    cd ${_common_dir}
    install -dm755 ${pkgdir}/usr/bin
    install -c -m 755 libs/c3pldrv ${pkgdir}/usr/bin
    install -dm755 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libcaiowrap.so.1.0.0 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libcaiousb.so.1.0.0 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libc3pl.so.0.0.1 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libcaepcm.so.1.0 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libColorGear.so.0.0.0 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libColorGearC.so.0.0.0 ${pkgdir}${_endlibdir}
    install -c -m 755 libs/libcanon_slim.so.1.0.0 ${pkgdir}${_endlibdir}

    cd ${pkgdir}${_endlibdir}
    ln -s libc3pl.so.0.0.1 libc3pl.so.0
    ln -s libc3pl.so.0.0.1 libc3pl.so
    ln -s libcaepcm.so.1.0 libcaepcm.so.1
    ln -s libcaepcm.so.1.0 libcaepcm.so
    ln -s libcaiowrap.so.1.0.0 libcaiowrap.so.1
    ln -s libcaiowrap.so.1.0.0 libcaiowrap.so
    ln -s libcaiousb.so.1.0.0 libcaiousb.so.1
    ln -s libcaiousb.so.1.0.0 libcaiousb.so
    ln -s libcanonc3pl.so.1.0.0 libcanonc3pl.so.1
    ln -s libcanonc3pl.so.1.0.0 libcanonc3pl.so
    ln -s libcanon_slim.so.1.0.0 libcanon_slim.so.1
    ln -s libcanon_slim.so.1.0.0 libcanon_slim.so
    ln -s libColorGear.so.0.0.0 libColorGear.so.0
    ln -s libColorGear.so.0.0.0 libColorGear.so
    ln -s libColorGearC.so.0.0.0 libColorGearC.so.0
    ln -s libColorGearC.so.0.0.0 libColorGearC.so

    install -dm755 ${pkgdir}/usr/share/caepcm

    cd ${_common_dir}
    install -c -m 644 data/*.ICC  ${pkgdir}/usr/share/caepcm
}

_build_cndrvcups_capt() {
    _capt_dir=${srcdir}/cndrvcups-capt-${pkgver}

    msg "cndrvcups-capt package"

    msg "Configuring cndrvcups-capt package"

    for _dir in driver ppd backend pstocapt pstocapt2 pstocapt3
    do
        msg "Configuring: "${_dir}
        cd ${_capt_dir}/$_dir && /usr/bin/autoreconf -fi && LDFLAGS="-L${pkgdir}/usr/lib" CPPFLAGS=-I${pkgdir}/usr/include ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --disable-static
    done

    msg "Configuring: statusui"
    cd ${_capt_dir}/statusui && /usr/bin/autoreconf -fi && LDFLAGS="-z muldefs -L${pkgdir}/usr/lib" LIBS='-lpthread -lgdk-x11-2.0 -lgobject-2.0 -lglib-2.0 -latk-1.0 -lgdk_pixbuf-2.0' CPPFLAGS=-I${pkgdir}/usr/include ./autogen.sh --prefix=/usr --disable-static

    msg "Configuring: cngplp"
    cd ${_capt_dir}/cngplp/ && LDFLAGS=-L${pkgdir}/usr/lib /usr/bin/autoreconf -fi && LDFLAGS=-L${pkgdir}/usr/lib CPPFLAGS=-I${pkgdir}/usr/include ./autogen.sh --prefix=/usr --libdir=/usr/lib

    msg "Configuring: cngplp/files"
    cd ${_capt_dir}/cngplp/files && LDFLAGS=-L${pkgdir}/usr/lib /usr/bin/autoreconf -fi && LDFLAGS=-L${pkgdir}/usr/lib CPPFLAGS=-I${pkgdir}/usr/include ./autogen.sh

    msg "Compiling cndrvcups-capt package"
    cd ${_capt_dir}
    make CFLAGS=-D_CNSKT_LCAPT
}

_package_cndrvcups_capt() {
    _capt_dir=${srcdir}/cndrvcups-capt-${pkgver}

    msg "Installing cndrvcups-capt package"
    for _dir in driver ppd backend pstocapt pstocapt2 pstocapt3 statusui cngplp
    do
        msg "installing: $_dir"
        cd ${_capt_dir}/$_dir && make install DESTDIR=${pkgdir}
    done

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

    if [ "${CARCH}" == "x86_64" ]; then
        install -c libs64/ccpd                    ${pkgdir}/usr/bin
        install -c libs64/ccpdadmin               ${pkgdir}/usr/bin
    else
        install -c libs/ccpd                    ${pkgdir}/usr/bin
        install -c libs/ccpdadmin               ${pkgdir}/usr/bin
    fi

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
    install -c -m 644 *capt*.txt ${pkgdir}/usr/share/doc/capt-src
}

package() {
    _build_cndrvcups_common
    _package_cndrvcups_common
    _build_cndrvcups_capt
    _package_cndrvcups_capt

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
    install -Dm664 ${srcdir}/${_tardir}/Doc/LICENSE-EN.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE-EN.txt

    # Guide & README
    install -Dm664 ${srcdir}/${_tardir}/Doc/guide-capt-2.7xUK.tar.gz ${pkgdir}/usr/share/doc/capt-src/guide-capt-2.7xUK.tar.gz
    install -Dm664 ${srcdir}/${_tardir}/Doc/README-capt-${pkgver}UK.txt ${pkgdir}/usr/share/doc/capt-src/README-capt-${pkgver}UK.txt
}
