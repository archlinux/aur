# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>
# Original Submitter: Wessel Dirksen "p-we" <wdirksen at gmail dot com>

pkgname=tbs-dvb-drivers
pkgver=v160405_4.4.5_1_ARCH
pkgrel=1
pkgdesc="TBS proprietary DVB drivers + firmware"
url="http://www.tbsdtv.com"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('linux-headers' 'wget' 'moreutils' 'coreutils')
optdepends=('linuxtv-dvb-apps: handy DVB tools' 'v4l-utils: hardware support for some cards')
conflicts=('ffdecsawrapper' 'tbs-linux-drivers' 'tbs-dvb-drivers')
provides=('tbs-dvb-drivers')
install='tbs-dvb-drivers.install'

_tbsver=v160405

source=("http://www.tbsdtv.com/download/document/common/tbs-linux-drivers_$_tbsver.zip"
        'tbs-dvb-drivers.install') 

sha256sums=('e827121ce871deacdbc170e85b81aa67e0652e913a30b57ce8a17b085d18969c'
            '3fdfa6f14af91b3301f0f29c2a2386a7f84504688c766e714287ad8d450e2a57')

pkgver() {

        _kernel=`uname -r | sed -r 's/-/_/g'`
        echo "$_tbsver"_"$_kernel"

}

prepare() {

        cd $srcdir
        tar xjf linux-tbs-drivers.tar.bz2
        chmod -R u+rwX $srcdir/linux-tbs-drivers

}

build() {

        cd $srcdir/linux-tbs-drivers
        make distclean

        if [ `uname -m` == "x86_64" ]; then
            ./v4l/tbs-x86_64.sh
        else
            ./v4l/tbs-x86_r3.sh
        fi

        if [ -z "$_kernel" ]
        then
                _kernel=`uname -r`
        fi

        make

}

package() {
        _kernver=`uname -r`

        for r in /lib/modules/*; do
            s=${r:13}
            if [[ ${s:0:3} = "ext" ]]; then
                if [[ `cat ${r}/version | grep -c ${_kernver}` != 0 ]]; then
                    _destidir=${s}
                fi
            elif [[ ${s} = ${_kernver} ]] && [[ ! -e ${r}/extramodules ]]; then
                _destidir=${_kernver}/video
            fi  
        done

        mkdir -p $pkgdir/usr/lib/modules/${_destidir}/tbs
        mkdir -p $pkgdir/usr/lib/firmware

        install -m0644 $srcdir/*dvb*.fw  $pkgdir/usr/lib/firmware
        find "$srcdir/linux-tbs-drivers" -name '*.ko' -exec cp {} $pkgdir/usr/lib/modules/${_destidir}/tbs \;

        echo ""
        msg "Compressing modules, this will take awhile..."
        echo ""
        find "$pkgdir" -name '*.ko' -print0 | xargs -0 -P`nproc` -n10 gzip -9

        chmod -R go-w $pkgdir/usr/lib/modules/${_destidir}/tbs

}
