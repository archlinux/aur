# Maintainer: Szentesi Botond
# Patches By: Marie Ramlow
pkgname=powercord-git
_pkgname=powercord
pkgver=r1390.8a471180
pkgrel=1
pkgdesc="A lightweight discord client mod focused on simplicity and performance. Includes a patch to fix mouse thumb buttons."
arch=("any")
url="https://github.com/powercord-org/$_pkgname"
license=('MIT')
depends=('nodejs' 'git' 'npm' 'discord-canary')
makedepends=('jq')
source=(
	"git+https://github.com/powercord-org/powercord#branch=v2"
	"injector_index.js.patch"
	"injector_main.js.patch"
	"index.js.patch"
	"pc-settings_index.js.patch"
	"pc-updater_index.js.patch"
	"pc-updater_settings.jsx.patch"
	"browserWindow.js.patch"
	"powercord.8"
	)
sha256sums=(
	'SKIP'
	'4636c2b0db9e25ee2a70d75352e8f5ae5d03d512b70e1a4b300048396d98b661'
	'a3543f74cbe07752f81fd0b5a2b29647e7138acd11ae76a6b723e28928504fb0'
	'd8174069f7f4180d770a942030bd1d90275e2a000088d9caa94aa44b79f7d7ee'
	'59356c741dea8192e340f009c5d148e526c1f723be91a8224489ed66d6b3a070'
	'b9e17f6091ea5eaee58d625aa9921f14b579f068eb7b4bd7a70068413b614bc3'
	'1f3b303f5ddfb04badb1c909f3da2cee49ffa6a13e4a8ebb255aef715d381c6f'
	'd554cc48d14e4085bf3976a5b3439abb6fbea94c7593240b717d9883ee923b8d'
	'0f06f85a3d80b00cf577d8d3a38589e8230bb7480871eca4c7ee6b04f28b61da'
	)
options=('!strip')

prepare() {
	patch -u ${srcdir}/${_pkgname}/injectors/index.js -i ${srcdir}/injector_index.js.patch
	patch -u ${srcdir}/${_pkgname}/injectors/main.js -i ${srcdir}/injector_main.js.patch
	patch -u ${srcdir}/${_pkgname}/src/Powercord/index.js -i ${srcdir}/index.js.patch
	patch -u ${srcdir}/${_pkgname}/src/Powercord/plugins/pc-settings/index.js -i ${srcdir}/pc-settings_index.js.patch
	patch -u ${srcdir}/${_pkgname}/src/Powercord/plugins/pc-updater/index.js -i ${srcdir}/pc-updater_index.js.patch
	patch -u ${srcdir}/${_pkgname}/src/Powercord/plugins/pc-updater/components/Settings.jsx -i ${srcdir}/pc-updater_settings.jsx.patch
	patch -u ${srcdir}/${_pkgname}/src/browserWindow.js -i ${srcdir}/browserWindow.js.patch
	
	cd "${srcdir}/${_pkgname}"
	local _revision="$(git rev-list HEAD | head -n 1)"
	sed -i "s/REVISION_NUMBER/${_revision}/" "${srcdir}/${_pkgname}/src/Powercord/index.js"
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	
	local install_dir="${pkgdir}/opt"
	install -d "${install_dir}"
	cp -a "${srcdir}/${_pkgname}" "${install_dir}"	
	cd "${install_dir}/${_pkgname}"
	npm install --only=prod
	
	install -m755 "${srcdir}/${_pkgname}/injectors/index.js"  ${install_dir}/${_pkgname}/injectors/index.js
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/injectors/index.js" "${pkgdir}/usr/bin/powercord"
	
	find "${install_dir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	
	local tmppackage="$(mktemp)"
	local pkgjson="${install_dir}/${_pkgname}/package.json"
	jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
	mv "${tmppackage}" "${pkgjson}"
	chmod 644 "${pkgjson}"

	chown -R root:root "${install_dir}/${_pkgname}/"
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	install -g 0 -o 0 -Dm 0644 "${srcdir}/powercord.8" -t ${pkgdir}/usr/share/man/man8/
	gzip ${pkgdir}/usr/share/man/man8/powercord.8

	# This is not ideal. It's only required because it seems like discord needs write and execute permissions.
	chmod -R 757 "${install_dir}/${_pkgname}"	

	echo -e "\e[5m\e[101mWARNING"
	echo -e "\e[5m\e[101mWARNING\e[49m \e[91m \e[4mUsing this tool could get you banned. Read the whole disclaimer on the github page!\e[0m\e[39m"	
	echo -e "\e[5m\e[101mWARNING\e[39m\e[49m"
}
