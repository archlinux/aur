# Maintainer: Joseph Simone <averagejoey2000 tfwno . gf>
pkgname=mccgdi
pkgver="2.0.10"
pkgrel=1
pkgdesc="PPD files for Panasonic Printers"
arch=('x86_64' 'i686')
url="panasonic.com"
license=('custom: panasonic')
depends=(gtk2)
source=(https://www.psn-web.net/cs/support/fax/common/file/Linux_PrnDriver/Driver_Install_files/$pkgname-$pkgver-$arch.tar.gz)
noextract=()
md5sums_x86_64=('67fd55f535b2b4f84dcadcc4b024c39b')
md5sums_i686=('1ac3aeea150d531868ca8162aa9dcb0e')
package(){
cd $srcdir/$pkgname-$pkgver-$arch/
_INSTALL_PATH="$pkgdir/usr/share/panasonic/printer"
_MODEL_PATH="$pkgdir/usr/share/cups/model"
_FILTER_PATH="$pkgdir/usr/lib/cups/filter"
mkdir -p $_FILTER_PATH
mkdir -p $_MODEL_PATH
mkdir -p $_INSTALL_PATH
_FILTER_PROGRAMS="L_H0JDGCZAZ"


_SCRIPT=`readlink -f $0`
_SCRIPTPATH=`dirname $_SCRIPT`
_PWD=`pwd`
cd $_SCRIPTPATH

mkdir -p $_MODEL_PATH/panasonic/
chown root:root $_MODEL_PATH/panasonic/
chmod 755 $_MODEL_PATH/panasonic/

mkdir -p $_INSTALL_PATH/
mkdir -p $_INSTALL_PATH/bin
mkdir -p $_INSTALL_PATH/conf
mkdir -p $_INSTALL_PATH/data

chmod 777 $_INSTALL_PATH/conf

mkdir -p $pkgdir/var/spool/.panamfs
chmod 777 $pkgdir/var/spool/.panamfs


# copy Version file
install -D -m644 $srcdir/$pkgname-$pkgver-$arch/Version.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

# copy lib files
_INSTALL_LIB_PATH="$pkgdir/usr/lib"
_RESTORECON=/sbin/restorecon

_LIB_FILES="L_H0JDJCZAZ_2 L_H0JDJCZAZ"
for _file in $_LIB_FILES; do
	cp $srcdir/$pkgname-$pkgver-$arch/lib/$_file.so.1.0.0 $_INSTALL_LIB_PATH/
	ln -sf /usr/lib/$_file.so.1.0.0 $_INSTALL_LIB_PATH/$_file.so.1
	ln -sf /usr/lib/$_file.so.1 $_INSTALL_LIB_PATH/$_file.so
done

for _file in $_FILTER_PROGRAMS; do
	cp $srcdir/$pkgname-$pkgver-$arch/filter/$_file $_FILTER_PATH/
	if test -f $_RESTORECON
	then
		$_RESTORECON $_FILTER_PATH/$_file
	fi
done

# copy ppd files
_PPD_FILES=`find $srcdir/$pkgname-$pkgver-$arch/ppd -name *.ppd`
for _file in $_PPD_FILES; do
	cp $_file $_MODEL_PATH/panasonic/
	_file=`basename $_file`
done

## copy SPC & RCT files
#_DATA_FILES=`find $srcdir/$pkgname-$pkgver-$arch/data`
#for _file in $_DATA_FILES; do
#	if test -d $_file
#	then
#		mkdir -p $_INSTALL_PATH/$_file
#	else
#		if test -f $_file
#		then
#			cp $_file $_INSTALL_PATH/$_file
#		fi
#	fi
#done
cp -rf $srcdir/$pkgname-$pkgver-$arch/data/ $pkgdir/usr/share/panasonic/printer/data/
mkdir -p $pkgdir/usr/local/share/panasonic/printer/
ln -sfn /usr/share/panasonic/printer/data $pkgdir/usr/local/share/panasonic/printer/
# copy tools
cp $srcdir/$pkgname-$pkgver-$arch/panautil/L_H0JDUIZAZ $_INSTALL_PATH/bin/
cp $srcdir/$pkgname-$pkgver-$arch/panautil/L_H0JDUCZAZ $_INSTALL_PATH/bin/
chmod 4755 $_INSTALL_PATH/bin/L_H0JDUCZAZ
cp $srcdir/$pkgname-$pkgver-$arch/panautil/L_H0JDUIZAZ.png $_INSTALL_PATH/bin/


  mkdir -p $pkgdir/usr/share/applications
  chown root:root $pkgdir/usr/share/applications
  chmod 755 $pkgdir/usr/share/applications

if test -d $pkgdir/usr/share/applications/
then
  cp $srcdir/$pkgname-$pkgver-$arch/panautil/L_H0JDUIZAZ.desktop $pkgdir/usr/share/applications/
fi

}
