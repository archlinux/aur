# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>
# Original Submitter: Wessel Dirksen "p-we" <wdirksen at gmail dot com>

pkgname=tbs-dvb-drivers
pkgver=v150429
pkgrel=3
pkgdesc="TBS proprietary DVB drivers + firmware"
url="http://www.tbsdtv.com"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('linux-headers' 'wget' 'moreutils' 'coreutils')
optdepends=('linuxtv-dvb-apps: handy DVB tools' 'v4l-utils: hardware support for some cards')
conflicts=('ffdecsawrapper' 'tbs-linux-drivers' 'tbs-dvb-drivers')
provides=('tbs-dvb-drivers')
install='tbs-dvb-drivers.install'

_tbsver=v150429

source=("http://www.tbsdtv.com/download/document/common/tbs-linux-drivers_$_tbsver-new.zip"
	'tbs-dvb-drivers.install') 

sha256sums=('731217b1a2245321d7ff9ed1b2b2863caca6b3ddfd787cfdd842c91d900a79e8'
            '3fdfa6f14af91b3301f0f29c2a2386a7f84504688c766e714287ad8d450e2a57')
            
pkgver() {

	_kernel=`uname -r | sed -r 's/-/_/g'`
	echo "$_tbsver"_"$_kernel"
}

build() {

	cd $srcdir
	rm -rf /linux-tbs-drivers_$_tbsver
	tar xjvf tbs-linux-drivers_$_tbsver.tar.bz2
	chmod 777 -R $srcdir/tbs-linux-drivers_$_tbsver
	cd $srcdir/tbs-linux-drivers_$_tbsver
	./installer.sh -b

}

package() {

	mkdir -p $pkgdir/usr/lib/modules/`uname -r`/updates/tbs
	mkdir -p $pkgdir/usr/lib/firmware

	find "$srcdir/tbs-linux-drivers_$_tbsver/driver/linux-tbs-drivers/v4l/" -name '*.ko' -exec cp {} $pkgdir/usr/lib/modules/`uname -r`/updates/tbs \;
	install -m0644 $srcdir/tbs-linux-drivers_$_tbsver/firmware/*dvb*.fw  $pkgdir/usr/lib/firmware

	msg "Compressing modules, this will take awhile..."
	find "$pkgdir" -name '*.ko' -print0 | xargs -0 -P`nproc` -n10 gzip -9

	chmod 755 -R $pkgdir/usr/lib/modules/`uname -r`/updates
}
