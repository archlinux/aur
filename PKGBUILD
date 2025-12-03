# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=gosplugin
pkgver=1.3.19.0
pkgrel=3
pkgdesc='Crypto Interface Web Browser Plugin for https://gosuslugi.ru/'
arch=('x86_64')
url="https://www.gosuslugi.ru/help/faq/esignature/3842"
license=('unknown')
depends=(
    'brotli'
    'bzip2'
    'curl'
    'double-conversion'
    'duktape'
    'e2fsprogs'
    'freetype2'
    'gcc-libs'
    'glib2'
    'glibc'
    'graphite'
    'harfbuzz'
    'icu'
    'keyutils'
    'krb5'
    'libcap'
    'libffi'
    'libglvnd'
    'libidn2'
    'libnghttp2'
    'libnghttp3'
    'libpng'
    'libproxy'
    'libpsl'
    'libssh2'
    'libunistring'
    'libx11'
    'libxau'
    'libxcb'
    'libxdmcp'
    'md4c'
    'openssl'
    'pcre2'
    'qt5-base'
    'systemd-libs'
    'util-linux-libs'
    'zlib'
    'zstd'
)
optdepends=('rutoken-pkcs' 'jacartauc')
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
	'librtengine.so.3'
	'libboost_atomic.so.1.83.0'
	'libboost_chrono.so.1.83.0'
	'libxalanMsg.so.112'
	)
	for file in "${libs[@]}"; do
	    install -D "${srcdir}/opt/iitrust/gosuslugi_plugin/lib/${file}" "${pkgdir}/opt/iitrust/gosuslugi_plugin/lib/${file}"
	done
	rm -rf "${srcdir}/opt/iitrust/gosuslugi_plugin/lib"

	unused=(
		'tokens'
		'xdg-open.sh'
		'librutoken.so'
	)
	for file in "${unused[@]}"; do
		rm -rf "${srcdir}/opt/iitrust/gosuslugi_plugin/bin/${file}"
	done

	cp -a "${srcdir}/usr" "${pkgdir}"
	cp -a "${srcdir}/etc" "${pkgdir}"
	cp -a "${srcdir}/opt" "${pkgdir}"

	install -D 'gosuslugi_plugin.sh' "${pkgdir}/opt/iitrust/gosuslugi_plugin/bin/gosuslugi_plugin.sh"
}
