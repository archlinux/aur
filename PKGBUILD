# Maintainer: Dmitry Barker Medvedev <dimon@bitel.ru>
pkgname=bgcashcheckserver60
pkgver=6.0.345
pkgrel=1
pkgdesc='BGCashcheckServer 6.0 for billing system BGBilling 6.0'
arch=('i686' 'x86_64')
url='http://bgbilling.ru'
license=('custom')
depends=('java-runtime=7')
install=bgcashcheckserver.install
source=(bgcashcheckserver{_versuf}.sh)
md5sums=('f7a6f1a725124178f868da4b5a590a89')

# vesions: major, build, version suffix for package
_vermajor=$(echo ${pkgver}|cut -d'.' -f1,2)
_verbuild=$(echo ${pkgver}|cut -d'.' -f3)
_versuf=$(echo ${_vermajor}|sed -e "s/\.//g")
# product/archive name
_achivename=BGCashcheckServer
# program directory name
_dstdirname=bgcashcheckserver

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
	# unzip distributive
	unzip -o ./${_achivename}_${_vermajor}_${_verbuild}.zip
	# create structure
	mkdir $pkgdir/opt
	mv ${_achivename} $pkgdir/opt/${_dstdirname}${_versuf}
	# remove win files
	rm -f $pkgdir/opt/${_dstdirname}${_versuf}/*.{bat,exe,ini}
	# rename launch scripts (add suffix) and chmod
	rename .sh ${_versuf}.sh $pkgdir/opt/${_dstdirname}${_versuf}/*.sh
	chmod +x $pkgdir/opt/${_dstdirname}${_versuf}/*.sh
	# patch	./server.sh in launch script
	sed -i "s/\.\/server\.sh/\.\/server${_versuf}\.sh/" $pkgdir/opt/${_dstdirname}${_versuf}/*.sh
	# patch env in launch script
	sed -i "s/#BGCASHCHECK_SERVER_DIR=\/opt\/BGCashcheckServer/BGCASHCHECK_SERVER_DIR=\$\{BGCASHCHECK_SERVER_DIR_${_versuf}\}/" $pkgdir/opt/${_dstdirname}${_versuf}/*.sh
	# patch var in files
	_patch_var_file bgcashcheckserver{_versuf}.sh
	# rename var in files
	_rename_var_file $srcdir/bgcashcheckserver{_versuf}.sh
	# file
	install -D -m755 $srcdir/bgcashcheckserver${_versuf}.sh $pkgdir/etc/profile.d/bgcashcheckserver${_versuf}.sh
}
