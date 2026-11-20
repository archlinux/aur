# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=gosplugin
pkgver=1.3.43.1
pkgrel=1
pkgdesc='Crypto Interface Web Browser Plugin for https://gosuslugi.ru/'
arch=('x86_64')
url="https://www.gosuslugi.ru/help/faq/esignature/3842"
license=('unknown')
# Прямые runtime-зависимости (soname, которые напрямую требуют ELF пакета).
# Остальное (curl, icu, freetype, harfbuzz, krb5, libssh2, …) — транзитивные
# зависимости qt5-base/openssl-3/pcsclite, pacman подтянет их сам.
# openssl-3 (а не openssl): плагину нужен libcrypto.so.3 / libssl.so.3,
# тогда как openssl в Arch/CachyOS уже 4.x (libcrypto.so.4).
depends=(
    'gcc-libs'
    'glibc'
    'libglvnd'
    'openssl-3'
    'pcsclite'
    'qt5-base'
    'rutoken-connect'
)
optdepends=('jacartauc')
makedepends=('grep' 'libarchive')

source=(
    "${pkgname}-${pkgver}-${pkgrel}.deb.zip::https://gu-st.ru/content/Gosplugin/Gosplugin_Linux-Debian_Installer.deb.zip"
	'gosuslugi_plugin.sh'
)
sha256sums=('f7ab21f9ef21b2090a189ff7df2147074f4252e1255930df689d3f31acc258f2'
            '547408c8c098b17ad2f3c474dc4cc442ed067244f3ebbc6868908c9c6a7bbc9c')

_script='Gosplugin_Linux-Debian_Installer.deb.sh'

prepare() {
	payload_offset=$(grep --text --line-number '^PAYLOAD:$' "${srcdir}/${_script}" | cut -d: -f1)
	tail -n +$((payload_offset + 1)) "${_script}" | bsdtar -xC "${srcdir}"
	filename=$(ls "${srcdir}"/gosuslugi-plugin_*.deb)
	bsdtar -xf "${filename}"
	bsdtar -xf "${srcdir}/data.tar.xz"
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

    # Эти зависимости оставляем из пакета, остальные не копируем, а используем системные.
	libs=(
	'libboost_program_options.so.1.83.0'
	'libboost_date_time.so.1.83.0'
	'libwincrypt.so'
	'libui.so'
	'libcrypto_core.so'
	'libxml_dsign.so'
	'libboost_regex.so.1.83.0'
	'libxml-security-c.so.20'
	'libxml_soap.so'
	'libcryptoki.so'
	'libplugin_ssl.so'
	'libsession.so'
	'libasn.so'
	'libxml_document.so'
	'libshared.so'
	'libboost_serialization.so.1.83.0'
	'libboost_filesystem.so.1.83.0'
	'libboost_thread.so.1.83.0'
	'libboost_locale.so.1.83.0'
	'libboost_log.so.1.83.0'
	'libboost_log_setup.so.1.83.0'
	'libxerces-c-3.2.so'
	'libxalan-c.so.112'
	'libboost_atomic.so.1.83.0'
	'libboost_chrono.so.1.83.0'
	'libxalanMsg.so.112'
	)
	for file in "${libs[@]}"; do
	    install -D "${srcdir}/opt/iitrust/gosuslugi_plugin/lib/${file}" "${pkgdir}/opt/iitrust/gosuslugi_plugin/lib/${file}"
	done
	rm -rf "${srcdir}/opt/iitrust/gosuslugi_plugin/lib"

	# librutoken.so и tokens/ (librtpkcs11ecp.so) ОБЯЗАТЕЛЬНЫ: плагин загружает
	# собственный rutoken-модуль из bin/ (подтверждено логами рабочего 1.3.42.0
	# и тестом 1.3.43.1: без librutoken.so модуль rutoken не грузится).
	# Удаляем только xdg-open.sh — его заменяет gosuslugi_plugin.sh.
	unused=(
		'xdg-open.sh'
	)
	for file in "${unused[@]}"; do
		rm -rf "${srcdir}/opt/iitrust/gosuslugi_plugin/bin/${file}"
	done

	cp -a "${srcdir}/usr" "${pkgdir}"
	cp -a "${srcdir}/etc" "${pkgdir}"
	cp -a "${srcdir}/opt" "${pkgdir}"

	install -D 'gosuslugi_plugin.sh' "${pkgdir}/opt/iitrust/gosuslugi_plugin/bin/gosuslugi_plugin.sh"
}
