# Maintainer: xifan <xifan2333@gmail.com>
# NOTE: This is an unofficial, community-maintained package.

pkgname=awesun-bin
_pkgname=awesun
pkgver=16.5.0.30560
pkgrel=1
pkgdesc="AweSun remote control client for Linux (Unofficial Community Package)"
arch=('x86_64')
url="https://sunlogin.oray.com/download/linux"
license=('custom')
depends=('gtk3' 'libappindicator-gtk3' 'webkit2gtk-4.1' 'libnotify' 'util-linux-libs' 'libepoxy')
provides=("${_pkgname}" 'sunloginclient' 'sunlogin')
conflicts=("${_pkgname}" 'sunloginclient' 'sunlogin' 'sunloginenterprise' 'awesunhost' 'awesuncli')
options=(!strip emptydirs)
install="${pkgname}.install"
backup=('etc/orayconfig.conf')
source=("LICENSE::https://service.oray.com/question/1820.html")
source_x86_64=("awesun-16.5.0.30560-x86_64.deb::https://dl.oray.com/sl/linux/awesun-16.5.0.30560-x86_64.deb")
sha256sums=('SKIP')
sha256sums_x86_64=('eda3fffe6d5324afbc4f939f0cb85c08b7851efad3c01878621474ec7503d10f')

package() {
	cd "${srcdir}"

	bsdtar -xf "${_pkgname}-${pkgver}-x86_64.deb"
	bsdtar -xf data.tar.xz

	install -d "${pkgdir}/opt/${_pkgname}"
	cp -a "usr/local/${_pkgname}/." "${pkgdir}/opt/${_pkgname}/"

	install -Dm644 "usr/share/applications/${_pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/scripts/run${_pkgname}.service" \
		"${pkgdir}/usr/lib/systemd/system/run${_pkgname}.service"
	install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.png" \
		"${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 /dev/null "${pkgdir}/etc/orayconfig.conf"
	install -dm777 "${pkgdir}/var/log/${_pkgname}"

	local old_path="/usr/local/${_pkgname}"
	local new_path="/opt/${_pkgname}"
	local padded_path="///////opt/${_pkgname}"

	while IFS= read -r -d '' file; do
		sed -i "s#${old_path}#${padded_path}#g" "${file}"
	done < <(grep -RslZ "${old_path}" \
		"${pkgdir}/opt/${_pkgname}" \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop" \
		"${pkgdir}/usr/lib/systemd/system/run${_pkgname}.service")

	find "${pkgdir}/opt/${_pkgname}/scripts" -type f \
		-exec sed -i "s#${padded_path}#${new_path}#g" {} +
	sed -i \
		-e "s#${padded_path}#${new_path}#g" \
		-e "s#^Icon=.*#Icon=${_pkgname}#" \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	sed -i "s#${padded_path}#${new_path}#g" \
		"${pkgdir}/usr/lib/systemd/system/run${_pkgname}.service"
}
