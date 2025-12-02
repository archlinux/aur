# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=gosplugin
pkgver=1.3.19.0
pkgrel=1
pkgdesc='Crypto Interface Web Browser Plugin for https://gosuslugi.ru/'
arch=('x86_64')
url="https://www.gosuslugi.ru/help/faq/esignature/3842"
license=('unknown')
depends=('pcsc-tools' 'pcsclite' 'opensc' 'libxcb' 'icu' 'jacartauc')
makedepends=('grep' 'libarchive')

source=(
	'https://gu-st.ru/content/Gosplugin/Gosplugin_Linux-Debian_Installer.deb.zip'
	'gosuslugi_plugin.sh'
)
sha256sums=(
	'5cce84af9529ae636a6732393b40f99287f1c1f046b356ab909607156cdadda1'
	'b2a148903b0fc84a60a8e1423b01c865491401a2b65d6b16dbe8442b15705dda'
)

_script='Gosplugin_Linux-Debian_Installer.deb.sh'

prepare() {
	payload_offset=$(grep --text --line-number '^PAYLOAD:$' "${srcdir}/${_script}" | cut -d: -f1)
	tail -n +$((payload_offset + 1)) "${_script}" | bsdtar -xC "${srcdir}"
	filename=$(ls "${srcdir}"/gosuslugi-plugin_*.deb)
	bsdtar -xf "${filename}"
	bsdtar -xf "${srcdir}/data.tar.gz"
}

pkgver() {
	filename=$(ls "${srcdir}"/gosuslugi-plugin_*.deb)
	# Убираем префикс до первой подчеркивания
	temp=${filename#*_}
	# Убираем суффикс после дефиса
	version=${temp%-*}
	echo "$version"
}

package() {
	rm -rf "${srcdir}/usr/lib"
	rm -rf "${srcdir}/usr/share"
	mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"

	cp -a "${srcdir}/usr" "${pkgdir}"
	install -D "${srcdir}/opt/iitrust/gosuslugi_plugin/bin/gosuslugi_plugin" "${pkgdir}/opt/iitrust/gosuslugi_plugin/bin/gosuslugi_plugin"
	install -D 'gosuslugi_plugin.sh' "${pkgdir}/opt/iitrust/gosuslugi_plugin/bin/gosuslugi_plugin.sh"
	cp -a "${srcdir}/etc" "${pkgdir}"
}

