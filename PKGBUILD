# Maintainer: Dmitry Barker Medvedev <dimon@bitel.ru>
pkgname=bgbillingclient62
pkgver=6.2.811
pkgrel=1
pkgdesc='Client for billing system BGBilling 6.2'
arch=('i686' 'x86_64')
url='http://bgbilling.ru'
license=('custom')
depends=('java-runtime=8')
install=bgbillingclient.install
source=(bgbillingclient{_versuf}.sh bgbillingclient{_versuf}.desktop bgbillingclient{_versuf}.png)
md5sums=('5c6031713ab88c1d6fa71e43d27d1071'
         '64cbed916271ecc83f2af450cfececbc'
         'e33f57ef3a2e711f47ccc3ec5ecddaf8')

# vesions: major, build, version suffix for package
_vermajor=$(echo ${pkgver}|cut -d'.' -f1,2)
_verbuild=$(echo ${pkgver}|cut -d'.' -f3)
_versuf=$(echo ${_vermajor}|sed -e "s/\.//g")
# product/archive name
_achivename=BGBillingClient
# program directory name
_dstdirname=bgbillingclient

_patch_var_file() {
	local file="$1"
	v1="s/\\\${_versuf}/${_versuf}/g"
	v2="s/\\\${pkgver}/${pkgver}/g"
	v3="s/\\\${_vermajor}/${_vermajor}/g"
	sed -i "$v1" $file
	sed -i "$v2" $file
	sed -i "$v3" $file
}

_rename_var_file() {
	local file="$1"
	local basefile=$(basename "$file")
	v1="s/{_versuf}/${_versuf}/g"
	local replace=$(echo $basefile | sed "$v1")
	rename $basefile $replace $file
}

pkgver() {
	wget --no-remove-listing ftp://ftp.bgbilling.ru/pub/bgbilling/${_vermajor}/${_achivename}_${_vermajor}_*.zip
	# -rw-r--r-- 9 500 100 31493131 Oct 25 19:32 BGBillingClient_6.0_1258.zip
	_ver=$(grep -o -P "${_achivename}_(\d+)\.(\d+)_(\d+)" .listing)
	# BGBillingClient_6.0_1258
	_v1=$(echo ${_ver}|cut -d'_' -f2)
	_v2=$(echo ${_ver}|cut -d'_' -f3)
	echo "${_v1}.${_v2}"
}

package() {
	msg2 "unzip distributive"
	unzip -o ./${_achivename}_${_vermajor}_${_verbuild}.zip

	msg2 "create structure"
	mkdir $pkgdir/opt
	mv ${_achivename} $pkgdir/opt/${_dstdirname}${_versuf}

	msg2 "remove win files"
	rm -f $pkgdir/opt/${_dstdirname}${_versuf}/*.{bat,exe,ini}

	msg2 "rename launch scripts (add suffix) and chmod"
	rename .sh ${_versuf}.sh $pkgdir/opt/${_dstdirname}${_versuf}/*.sh
	chmod +x $pkgdir/opt/${_dstdirname}${_versuf}/*.sh

	msg2 "patch env in launch script"
	sed -i "s/BGBILLING_DIR=\./BGBILLING_DIR=\$\{BGBILLING_DIR_${_versuf}\}/" $pkgdir/opt/${_dstdirname}${_versuf}/bgbilling*${_versuf}.sh

	msg2 "patch JAVA_HOME in launch script"
	sed -i "s|\${JAVA_HOME}\/bin\/java|java|" $pkgdir/opt/${_dstdirname}${_versuf}/bgbilling*${_versuf}.sh
	sed -i '5d' $pkgdir/opt/${_dstdirname}${_versuf}/bgbilling*${_versuf}.sh
	sed -i '5d' $pkgdir/opt/${_dstdirname}${_versuf}/bgbilling*${_versuf}.sh
	sed -i '5d' $pkgdir/opt/${_dstdirname}${_versuf}/bgbilling*${_versuf}.sh
	sed -i '5d' $pkgdir/opt/${_dstdirname}${_versuf}/bgbilling*${_versuf}.sh
	sed -i '5d' $pkgdir/opt/${_dstdirname}${_versuf}/bgbilling*${_versuf}.sh

	msg2 "patch var in files"
	_patch_var_file bgbillingclient{_versuf}.desktop
	_patch_var_file bgbillingclient{_versuf}.sh

	msg2 "rename var in files"
	_rename_var_file $srcdir/bgbillingclient{_versuf}.png
	_rename_var_file $srcdir/bgbillingclient{_versuf}.desktop
	_rename_var_file $srcdir/bgbillingclient{_versuf}.sh

	msg2 "copy file"
	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install    -m644 $srcdir/bgbillingclient${_versuf}.png $pkgdir/usr/share/pixmaps/
	install    -m644 $srcdir/bgbillingclient${_versuf}.desktop $pkgdir/usr/share/applications/
	install -D -m755 $srcdir/bgbillingclient${_versuf}.sh $pkgdir/etc/profile.d/bgbillingclient${_versuf}.sh
}
