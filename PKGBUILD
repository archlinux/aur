# Maintainer: Szentesi Botond
pkgname=powercord-git
_pkgname=powercord
pkgver=r1208.76108c4
pkgrel=1
pkgdesc="A lightweight discord client mod focused on simplicity and performance."
arch=("any")
url="https://github.com/powercord-org/$_pkgname"
license=('Porkord')
depends=('nodejs' 'git' 'npm')
makedepends=('jq')
source=(
	"git+https://github.com/powercord-org/powercord#branch=v2"
	"injector_index.js.patch"
	"injector_main.js.patch"
	"index.js.patch"
	"pc-settings_index.js.patch"
	"pc-updater_index.js.patch"
	"pc-updater_settings.jsx.patch"
	"powercord.8"
	)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	)
options=('!strip')

prepare() {
	patch -u ${srcdir}/${_pkgname}/injectors/index.js -i ${srcdir}/injector_index.js.patch
	patch -u ${srcdir}/${_pkgname}/injectors/main.js -i ${srcdir}/injector_main.js.patch
	patch -u ${srcdir}/${_pkgname}/src/Powercord/index.js -i ${srcdir}/index.js.patch
	patch -u ${srcdir}/${_pkgname}/src/Powercord/plugins/pc-settings/index.js -i ${srcdir}/pc-settings_index.js.patch
	patch -u ${srcdir}/${_pkgname}/src/Powercord/plugins/pc-updater/index.js -i ${srcdir}/pc-updater_index.js.patch
	patch -u ${srcdir}/${_pkgname}/src/Powercord/plugins/pc-updater/components/Settings.jsx -i ${srcdir}/pc-updater_settings.jsx.patch
	
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
