# Maintainer: ju.adde-gmail-com

pkgname=flutter-group-pacman-hook
pkgver=1
pkgrel=4
pkgdesc="Pacman hook to fix permission after flutter install/upgrade"
arch=("any")
license=("GPL")
optdepends=("flutter")
source=(flutter-group-template.hook)
sha512sums=('3d67f48bb56f4312c113daddbd6884c09371f3099a3ad466fb490f2e257dd9c6e8c6f1224de900a774f5bb6b50da2d0ebf1cf617b5077ddffefbff417edbc590')

_group=flutterusers
_path=/opt/flutter

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
		echo -e "\n  ${_COL_BBLUE_}->${_COL_DEFAULT_} ${_COL_BRED_}NOTE:${_COL_DEFAULT_} If you want to package ${_COL_BWHITE_}${pkgname}${_COL_DEFAULT_} with a group different than ${_COL_BWHITE_}${_group}${_COL_DEFAULT_},"
		echo -e "     please set a \`${_COL_YELLOW_}FLUTTER_GROUP${_COL_DEFAULT_}\` environment variable before running makepkg.\n"
		echo '     For instance:'
		echo -e "\n        ${_COL_LIGHTGREY_}FLUTTER_GROUP='flutterusers' makepkg${_COL_DEFAULT_}\n"
	fi

	if [[ -z "${FLUTTER_PATH}" ]]; then
		echo -e "\n  ${_COL_BBLUE_}->${_COL_DEFAULT_} ${_COL_BRED_}NOTE:${_COL_DEFAULT_} If you want to package ${_COL_BWHITE_}${pkgname}${_COL_DEFAULT_} with a path different than ${_COL_BWHITE_}${_path}${_COL_DEFAULT_},"
		echo -e "     please set a \`${_COL_YELLOW_}FLUTTER_PATH${_COL_DEFAULT_}\` environment variable before running makepkg.\n"
		echo '     For instance:'
		echo -e "\n        ${_COL_LIGHTGREY_}FLUTTER_PATH='/opt/flutter' makepkg${_COL_DEFAULT_}\n"
	fi

    if [[ -n "${FLUTTER_GROUP}" ]]; then
        _group=$FLUTTER_GROUP
    fi

	if [[ -n "${FLUTTER_PATH}" ]]; then
        _path=${FLUTTER_PATH}
    fi
    
	sed -e "s/\$FLUTTER_GROUP/${_group}/g" -e "s/\$FLUTTER_PATH/${_path//\//\\\/}/g" -e "s/Target = \//Target = /g" flutter-group-template.hook > flutter-group.hook
}

package() {
    install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
    install -m644 "${srcdir}/flutter-group.hook" "${pkgdir}/usr/share/libalpm/hooks/flutter-group.hook"
}
