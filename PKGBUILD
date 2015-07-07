# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>
# Original Submitter: Wessel Dirksen "p-we" <wdirksen at gmail dot com>

pkgname=tbs-dvb-drivers
pkgver=v150525_4.0.7_2_ARCH
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

_tbsver=v150525

source=("http://www.tbsdtv.com/download/document/common/tbs-linux-drivers_$_tbsver.zip"
        'tbs-dvb-drivers.install') 

sha256sums=('914e3d838613988bcc88f2ef847b6146a73bef64e5402aec34e12d74ed2071f5'
            '3fdfa6f14af91b3301f0f29c2a2386a7f84504688c766e714287ad8d450e2a57')

pkgver() {

        _kernel=`uname -r | sed -r 's/-/_/g'`
        echo "$_tbsver"_"$_kernel"
        
}

prepare() {
 
        cd $srcdir
        tar xjf linux-tbs-drivers.tar.bz2
        chmod -R 777 $srcdir/linux-tbs-drivers
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
 
        mkdir -p $pkgdir/usr/lib/modules/`uname -r`/updates/tbs
        mkdir -p $pkgdir/usr/lib/firmware
 
        install -m0644 $srcdir/*dvb*.fw  $pkgdir/usr/lib/firmware
        find "$srcdir/linux-tbs-drivers" -name '*.ko' -exec cp {} $pkgdir/usr/lib/modules/`uname -r`/updates/tbs \;
 
        echo ""
        msg "Compressing modules, this will take awhile..."
        echo ""
        find "$pkgdir" -name '*.ko' -print0 | xargs -0 -P`nproc` -n10 gzip -9
 
        chmod -R go-w $pkgdir/usr/lib/modules/`uname -r`/updates
}
