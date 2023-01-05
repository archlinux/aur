# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Julio González <juliolokoo at gmail dot com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
# Contributor: alegotta <algottardi at disroot dot org>
# Contributor: oguzkagan <me@oguzkaganeren.com.tr>

pkgname='xampp'
_srcver='8.2.0'
_binver=0
pkgrel=2

# This PKGBUILD deals with two different versioning formats: the upstream
# format MAJOR.MINOR.REVISION-BUILD - used internally by XAMPP - and the
# makepkg-friendly format MAJOR.MINOR.REVISION[.BUILD]-RELEASE (where the only
# hyphen is the one automatically added by makepkg before `$pkgrel`).
pkgver="${_srcver}$(test "${_binver}" -eq 0 || echo ".${_binver}")"

pkgdesc='A stand-alone LAMPP distribution'
url='https://www.apachefriends.org'
license=('GPL')

# This PKGBUILD is configured for both 32-bit and 64-bit architectures, but
# currently no binaries for 32-bit architectures are distributed. The last
# versions where these were available are 5.6.23-0 and 7.0.8-0. If you want
# to include a 32-bit release add 'i686' to the array below and provide a
# compatible version.
arch=('x86_64')

depends=('inetutils' 'net-tools' 'libxcrypt-compat')
optdepends=('polkit: for launching XAMPP Manager and Control Panel from menu'
            'pygtk: for using XAMPP Control Panel')
makedepends=('sdx' 'tclkit' 'rsync' 'pcre')
source=('bitrock-unpacker.tcl'
	'org.apachefriends.xampp.policy'
	'properties.ini.in'
	'xampp.service.in'
	'xampp.svg'
	'xampp.sysusers'
	'xampp.tmpfiles.in'
	'xampp-control-panel.in'
	'xampp-control-panel.desktop'
	'xampp-manager.in'
	'xampp-manager.desktop')
_build32name='linux'
_build64name='linux-x64'

source_i686=("https://sourceforge.net/projects/${pkgname}/files/XAMPP%20Linux/${_srcver}/${pkgname}-${_build32name}-${_srcver}-${_binver}-installer.run")
source_x86_64=("https://sourceforge.net/projects/${pkgname}/files/XAMPP%20Linux/${_srcver}/${pkgname}-${_build64name}-${_srcver}-${_binver}-installer.run")
options=('staticlibs' 'libtool' '!strip')
install='xampp.install'
sha256sums=('3f262ef4b3e752992667ab482cbf364e3b9e6f95b4b6fb12a1ce6fa7a88f124e'
            'd72750c1dba2f754e6ea4eec22770f8a9c3858f270a91e7b1da4129e053a9d68'
            '90a0003840fc9310f22b26e909845d5909a515dbf3f5aff39f730b190e808597'
            '72dffe1ee4ae96a966a301dd1486832ce823cf3132f3ab1cd4ddb75ef9816d08'
            '087ce2c9adffcd88f4a67c881215a451e35e02a6a4a155d76321e05453d80f5d'
            '37e24dacf3a52037d0cddb11d979917f81741bf399ec5fa5e847359909b7bc25'
            '1447876c2d2dcf48c8e94c3bffbb09f1b4005621a55f78fb7d9faecebdb26264'
            '80de3facade04b394a501f13dd1c16d66381715c42c1f597fc1142cdcbe5f3de'
            '39a5617deaf42d17281b3b1b828351c0f6108cee774b3e4671af3d9bbcd48883'
            '8825623ea18abb8bfb3a8811b6c59dc8485f7d767c6f3a013fdc1b1afc979426'
            '83b30970378e8d30d7acd13ebe6dc31652548a44d2cca9fd5919fa7f06fe238d')
sha256sums_x86_64=('37fcc864cce6937f889437e1981216b62082a2a040865f32196d0d51b7d98ac3')
sha256sums_i686=('SKIP')

_platform="$(test "${CARCH}" = 'x86_64' && echo "${_build64name}" || echo "${_build32name}")"
_pkgstring="${pkgname}-${_platform}-${_srcver}-${_binver}"

# Make a string suitable for `sed`, by escaping `[]/&$.*^\` - syntax: `_sed_escape STRING`
_sed_escape() {

	echo "${1}" | sed 's/[]\/&.*$^[]/\\&/g'

}

prepare() {

	cd "${srcdir}"

	msg 'Extracting package...'
	chmod +x "${srcdir}/bitrock-unpacker.tcl"
	rm -rf "${srcdir}/${_pkgstring}"
        "${srcdir}/bitrock-unpacker.tcl" "${srcdir}/${_pkgstring}-installer.run" \
		"${srcdir}/${_pkgstring}"

}

package() {

	# This is a constant, you should not change it - this path is hard-coded in some of the files
	local _xampp_root='/opt/lampp'

	cd "${srcdir}"

	# Package tree
	msg 'Creating package tree...'
	install -dm755 "${pkgdir}${_xampp_root}"
	rsync -azq --remove-source-files \
		"${srcdir}/${_pkgstring}/xampp_core_files/xampp_core_folder"/. \
		"${srcdir}/${_pkgstring}/xampp_developer_files/xampp_developer_folder"/. \
		"${srcdir}/${_pkgstring}/native_apache_adapter/apache_xampp_linux"/. \
		"${srcdir}/${_pkgstring}/native_proftpd_adapter/proftpd_xampp_linux"/. \
		"${srcdir}/${_pkgstring}/native_mysql_adapter/mysql_xampp_linux"/. \
		"${srcdir}/${_pkgstring}/manager/binary"/. \
		"${srcdir}/${_pkgstring}/common_native_adapter/common"/. \
		"${pkgdir}${_xampp_root}"

	rm "${pkgdir}${_xampp_root}/ctlscript.bat" "${pkgdir}${_xampp_root}/killprocess.bat"

	# Root location in all files
	msg 'Setting root location globally (it might take a few minutes)...'
	find "${pkgdir}${_xampp_root}/" -type f \
		-exec sed -i "s/@@BITNAMI_XAMPP_ROOT@@\|@@BITROCK_INSTALLDIR@@\|@@XAMPP_INSTALLDIR@@/$(_sed_escape "${_xampp_root}")/gI" '{}' \;

	# Temp folders
	install -dm777 "${pkgdir}${_xampp_root}/phpmyadmin/tmp"
	chmod 777 "${pkgdir}${_xampp_root}/temp"

	local _extension_dir="$(pcregrep -o1 -o2 -o3 '^\s*extension_dir='\''([^\'\'']+)'\''\s*$|^\s*extension_dir="([^\"]+)"\s*$|^\s*extension_dir=([^\s]+)\s*$' "${pkgdir}${_xampp_root}/bin/php-config")"

	local _sed_subst="
		s/@XAMPP_VERSION@/$(_sed_escape "${_srcver}-${_binver}")/g
		s/@XAMPP_PLATFORM@/$(_sed_escape "${_platform}")/g
		s/@XAMPP_ROOT@/$(_sed_escape "${_xampp_root}")/g
		s/@XAMPP_EXTENSIONDIR@/$(_sed_escape "${_extension_dir}")/g
	"

	# Links and missing files
	sed "${_sed_subst}" "${srcdir}/properties.ini.in" > "${pkgdir}${_xampp_root}/properties.ini"
	echo -n "${_srcver}-${_binver}" > "${pkgdir}${_xampp_root}/lib/VERSION"
	ln -s "${_xampp_root}/xampp" "${pkgdir}${_xampp_root}/lampp"
	test -d "${pkgdir}${_xampp_root}/share/lampp" || \
		ln -sf "${_xampp_root}/share/xampp" "${pkgdir}${_xampp_root}/share/lampp"

	echo "Include \"${_xampp_root}/apache2/conf/httpd.conf\"" >> \
		"${pkgdir}${_xampp_root}/etc/httpd.conf"

	msg 'Copying executables and launcher...'

	# Licenses
	install -dm755 "${pkgdir}/usr/share/licenses"
	chmod -R a+rX,u+w "${pkgdir}${_xampp_root}/licenses"
	ln -s "${_xampp_root}/licenses" "${pkgdir}/usr/share/licenses/xampp"

	# Executables
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "${_xampp_root}/xampp" "${pkgdir}/usr/bin/xampp"
	sed "${_sed_subst}" "${srcdir}/xampp-manager.in" > "${pkgdir}/usr/bin/xampp-manager"
	sed "${_sed_subst}" "${srcdir}/xampp-control-panel.in" > "${pkgdir}/usr/bin/xampp-control-panel"
	chmod +x "${pkgdir}/usr/bin/xampp-control-panel" "${pkgdir}/usr/bin/xampp-manager"

	# Systemd files
	install -dm755 \
		"${pkgdir}/usr/lib/systemd/system" \
		"${pkgdir}/usr/lib/sysusers.d" \
		"${pkgdir}/usr/lib/tmpfiles.d"

	sed "${_sed_subst}" "${srcdir}/xampp.service.in" > "${pkgdir}/usr/lib/systemd/system/xampp.service"
	install -Dm644 "${srcdir}/xampp.sysusers" "${pkgdir}/usr/lib/sysusers.d/xampp.conf"
	sed "${_sed_subst}" "${srcdir}/xampp.tmpfiles.in" > "${pkgdir}/usr/lib/tmpfiles.d/xampp.conf"

	# Launchers and icons
	install -dm755 \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
		"${pkgdir}/usr/share/applications"

	install -Dm644 "${srcdir}/xampp.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/xampp.svg"
	install -Dm644 "${srcdir}/xampp-manager.desktop" "${pkgdir}/usr/share/applications/xampp-manager.desktop"
	install -Dm644 "${srcdir}/xampp-control-panel.desktop" "${pkgdir}/usr/share/applications/xampp-control-panel.desktop"
	ln -s "${_xampp_root}" "${pkgdir}/usr/share/xampp"

	# Polkit files
	install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
	install -Dm644 "${srcdir}/org.apachefriends.xampp.policy" \
		"${pkgdir}/usr/share/polkit-1/actions/org.apachefriends.xampp.policy"

}

