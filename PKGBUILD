# Maintainer: ju.adde-gmail-com

pkgname=flutter-group-pacman-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to fix permission after flutter install/upgrade"
arch=("any")
license=("GPL")
depends=("flutter")
source=(flutter-group-template.hook)
sha512sums=("ec692caa79eebfc17717dd227cc96a677cbca5a24adb4c824908ce24f186b1d8b66bfe5e562a975ef70f9cf34d30e78666ad7d3f89f27049accfa113ba888f01")

_group=flutterusers

prepare(){
    # use colors only if we have them (taken from Tor Browser AUR package)
	if [[ $(which tput > /dev/null 2>&1 && tput -T "${TERM}" colors || echo -n '0') -ge 8 ]] ; then
		local _COL_YELLOW_='\e[0;33m'
		local _COL_LIGHTGREY_='\e[0;37m'
		local _COL_BRED_='\e[1;31m'
		local _COL_BBLUE_='\e[1;34m'
		local _COL_BWHITE_='\e[1;37m'
		local _COL_DEFAULT_='\e[0m'
	fi

    if [[ -z "${FLUTTER_GROUP}" ]]; then
		echo -e "\n  ${_COL_BBLUE_}->${_COL_DEFAULT_} ${_COL_BRED_}NOTE:${_COL_DEFAULT_} If you want to package ${_COL_BWHITE_}${pkgname}${_COL_DEFAULT_} with a group different than ${_COL_BWHITE_}flutterusers${_COL_DEFAULT_},"
		echo -e "     please set a \`${_COL_YELLOW_}FLUTTER_GROUP${_COL_DEFAULT_}\` environment variable before running makepkg.\n"
		echo '     For instance:'
		echo -e "\n        ${_COL_LIGHTGREY_}FLUTTER_GROUP='flutterusers' makepkg${_COL_DEFAULT_}\n"
	fi

    if [[ -n "${FLUTTER_GROUP}" ]]; then
        _group=$FLUTTER_GROUP
    fi
    
    sed 's/\$FLUTTER_GROUP/'${_group}'/g' flutter-group-template.hook > flutter-group.hook
}

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/flutter-group.hook" "${pkgdir}/usr/share/libalpm/hooks/flutter-group.hook"
}
