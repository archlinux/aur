# Maintainer: dawidd6 <dawidd0811@gmail.com>
# Contributor: kimotori <kimotori@gmail.com>
# Contributor: Hervé Cauwelier <herve ¤ oursours.net>
pkgname=brscan
pkgver=0.2.4
pkgrel=1
pkgdesc="SANE drivers from Brother for USB scanners"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('custom:brother commercial license')
depends=('sane' 'libusb-compat')
install="$pkgname.install"
if [ "$CARCH" == "i686" ]; then
   source=(
		"http://www.brother.com/pub/bsc/linux/dlf/$pkgname-$pkgver-0.i386.rpm"
		'scanner-license.txt'
		)
	md5sums=('cd93d6b435adca6bc07f321fe716faea' '1bd5f896f3e97fe6d53a85b4d5a4ea79')
else
     source=(
		"http://www.brother.com/pub/bsc/linux/dlf/$pkgname-$pkgver-0.x86_64.rpm"
		'scanner-license.txt'
		)
	md5sums=('f1b3e42fab7bf9ad157428edfd4aa589' '1bd5f896f3e97fe6d53a85b4d5a4ea79')
fi
prepare() {
#  do not install in '/usr/local'
	if [ -d $srcdir/usr/local/Brother ]; then
		install -d $srcdir/usr/share
		mv $srcdir/usr/local/Brother/ $srcdir/usr/share/brother
		rm -rf $srcdir/usr/local
	    sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
		ln -sf /usr/share/brother/sane/brsaneconfig $srcdir/usr/bin/brsaneconfig
        fi
}
package() {
cp -R "$srcdir/usr" "$pkgdir"
install -m 644 -D scanner-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/scanner-licence.txt"
# On x86_64, install in "/usr/lib" instead of "/usr/lib64"
cd "$pkgdir/usr/"
if	[ "$CARCH" == "x86_64" ]; then
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
# some links are wrong now - recreate them
	for fn in 	lib/libbrcolm.so.1.0.1 \
			lib/libbrscandec.so.1.0.0 \
			lib/sane/libsane-brother.so.1.0.7
	do
# break, if file does not exist
		if [ ! -f $fn ] ; then
			echo "ERROR: $fn does not exist"
			return 1
		fi
		base=`echo $fn | cut -d. -f1`.so
		major=`echo $fn | cut -d. -f3`
		ln -sf `basename $fn` $base
		ln -sf `basename $fn` $base.$major
	done
else
# some links are wrong now - recreate them
	for fn in 	lib/libbrcolm.so.1.0.0 \
			lib/libbrscandec.so.1.0.0 \
			lib/sane/libsane-brother.so.1.0.7
	do
# break, if file does not exist
		if [ ! -f $fn ] ; then
			echo "ERROR: $fn does not exist"
			return 1
		fi
		base=`echo $fn | cut -d. -f1`.so
		major=`echo $fn | cut -d. -f3`
		ln -sf `basename $fn` $base
		ln -sf `basename $fn` $base.$major
	done
fi
}