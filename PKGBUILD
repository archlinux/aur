#!/bin/bash

# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Kurt J. Bosch <kjb-temp-2009 at alpenjodel.de>

_lang='de'

# Source directories containing the RPMs to install
_source_dirs=( "${_lang}/RPMS" )

# Install path components as found in RPMs
_install_prefix='opt'
_install_name='openoffice4'
_install_path=${_install_prefix}/${_install_name}

pkgname=openoffice-${_lang}-bin
pkgver=4.1.1
pkgrel=1
pkgdesc="German language pack for OpenOffice.org - Repackaged from upstream"
arch=('i686' 'x86_64')
url="http://www.openoffice.org/"
license=('APACHE') # see below
depends=(
	"openoffice>=${pkgver}"
)
makedepends=(
	'rpmextract'
)
options=(!strip docs)
install=openoffice-i18n-bin.install
# AUR is tricky
source=( http://apache.org/dist/openoffice/${pkgver}/binaries/${_lang}/ )
md5sums=('SKIP')
sha256sums=('SKIP')
case "$CARCH"
in i686 )
	source=(http://apache.org/dist/openoffice/${pkgver}/binaries/${_lang}/Apache_OpenOffice_${pkgver}_Linux_x86_langpack-rpm_${_lang}.tar.gz)
	md5sums[0]='94778092f25efacf20ca5009ea183a4c'
	sha256sums[0]='55ac0837eed89a75359a16518d4634fbd7505f9af399be5b955438568d8a5d56'
;; x86_64 )
	source=(http://apache.org/dist/openoffice/${pkgver}/binaries/${_lang}/Apache_OpenOffice_${pkgver}_Linux_x86-64_langpack-rpm_${_lang}.tar.gz)
	md5sums[0]='f27f1d0a9ac6128359370356e8bfe457'
	sha256sums[0]='556126541c4983c94c41248076775cab386b7e74936657da9531b522cd0dcfc1'
esac

_find_rpms() {
	local dir file
	for dir in "${_source_dirs[@]}"; do
		dir=${srcdir:-src}/${dir}
		( cd "${dir}" ) # check existing
		for file in $( find "${dir}" -type f -name '*.rpm' ); do
			if ! [[ $file == */desktop-integration/* && $file != *-freedesktop-menus-* ]] &&
			   ! [[ $file == */jre-* ]]; then
				echo "${file}"
			elif type -p msg2 >/dev/null; then
				msg2 "Skipping ${file##*/}" >&2
			else
				echo "Skipping ${file##*/}" >&2
			fi
		done
	done
}

_ln_s_t() {
	local dir=$1 prefix=$2
	shift 2
	mkdir -p "$dir"
	local file
	for file in "${@}"; do
		readlink -v -e "${file}" >/dev/null # check existing
		ln -s -T /"${file}" "${dir}/${prefix}${file##*/}"
	done
}

package() {
	cd "${pkgdir}"
	# unpack RPMs
	local file
	for file in $( _find_rpms ); do
		msg2 "Extracting ${file##*/}"
		rpmextract.sh "${file}"
	done
#	msg2 "Completing package"
#	# add licenses (found by find pkg -ipath '*license*')
#	_ln_s_t usr/share/licenses/${pkgname} '' \
#		${_install_path}/program/LICENSE
}

## Functions for manual usage

# makepkg -o && source PKGBUILD && _list_rpm_depends
# Helper for finding external dependencies
_list_rpm_depends() {
	local file
	for file in $( _find_rpms ); do
		r=$( rpmmeta -t requirename "${file}" | sed -re 's;(ooobasis|ooo-dev|ooodev|openoffice|rpmlib)[^ ]*;;g' )
		[[ $r ]] || continue
		echo ${file##*/} $r
	done
}

# makepkg -o && source PKGBUILD && _find_license_files
# Helper for finding license files
_find_license_files() {
	find pkg -ipath '*license*' -type f
}

# makepkg -o && source PKGBUILD && _make_install_script >${install}.new
# Helper for porting install scripts
_make_install_script() {
	cat <<EOF
#!/bin/bash

# Inappropriate parts should be removed:
# - mime.type stuff is already provided by mime-types package
# - /etc/mailcap does not exist on ArchLinux normaly
# - Don't use 'which' because tools are already in depends

EOF

	for args in 'prein pre_install' 'postin post_install' 'preun pre_remove' 'postun post_remove'; do
		set -- $args
		echo "$2() {"
		echo "  local RPM_INSTALL_PREFIX='${_install_prefix}'"
		echo
		local file code
		for file in $( _find_rpms ); do
			code=$( rpmmeta -t $1 "${file}" )
			[[ $code ]] || continue
			echo "  ( ### ${file##*/} $1"
			echo "$code"
			echo "  )"
			echo
		done
		echo "}"
		echo
	done

cat <<EOF
## arg 1:  the new package version
## arg 2:  the old package version
pre_upgrade() {
  pre_install "\$1"
}

## arg 1:  the new package version
## arg 2:  the old package version
post_upgrade() {
  post_install "\$1"
}

# vim:set ts=2 sw=2 et:
EOF
}
