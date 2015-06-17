# Maintainer: Pavol Hluchy (Lopo) <lopo at losys dot eu>

_bundle='javaee'
pkgname="netbeans-${_bundle}-nightly"
pkgver=latest
pkgrel=6
pkgdesc="Netbeans IDE for Java EE"
license=('CDDL')
arch=('any')
url="http://netbeans.org"
depends=('java-environment' 'ttf-font' 'libxtst' 'giflib' 'atk')
makedepends=('gendesk' 'setconf')
optdepends=('lib32-glibc')
backup=("usr/share/$pkgname/etc/netbeans.conf")
install="netbeans.install"
options=(!strip)
source=('netbeans-nightly.png')
sha512sums=('243e5170718d24a15ab67a0f0491c1c50d5bb8bace08485eb73ce33988583aa7fa0ae9f3ad149c9aaeeb99d130e11888e76ac1474e725f3e57e89ae7b36b6040')
_webroot="http://bits.netbeans.org/download/trunk/nightly/latest"

prepare() {
	cd "${SRCDEST}"

	download_file "${_webroot}/js/build_info.js"
	download_file "${_webroot}/js/files.js"

	_zipname=`grep -e '^build_info\.ZIP_FILES_PREFIX\s' build_info.js \
			| awk 'BEGIN {FPAT="\".+\""} {gsub(/\"/, "", $NF); print}'`
	_file="${_zipname}-${_bundle}.zip"
	_md5=`grep "zip/${_file}" files.js \
		| awk 'BEGIN {FPAT="\"[0-9a-z]+\""} {gsub(/\"/, "", $NF); print}'`

	download_file "${_webroot}/zip/${_file}"

	msg "$(gettext "Validating source files with %s...")" "md5sums"
	file="$(get_filename "${_file}")"
	printf "%s" "    $file ... " >&2
	local _realsum="$(openssl dgst -md5 "${_file}")"
	if [ "${_md5}" != "${_realsum##* }" ]; then
		printf -- "$(gettext "FAILED")\n" >&2
		return 1
	else
		printf -- "$(gettext "Passed")\n" >&2
	fi

	cd "$srcdir"
	ln -fs "${SRCDEST}/${_file}"
	extract_file "${_file}"
}

build() {
	msg2 "cleanup OS specific files"
	rm $(find -name '*\.exe' -or -name '*\.bat' -or -name '*\.dll')
	rm -r $(find -name 'MacOSX*' -or -name 'Windows*' -or -name 'SunOS*' -or -name 'FreeBSD*')
	rm -r $(find -name 'hpux*' -or -name 'mac*' -or -name 'solaris*' -or -name 'windows*')

	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
		--custom "StartupWMClass=NetBeans IDE Dev"
	setconf "netbeans/bin/netbeans" basedir "/usr/share/$pkgname"
#	setconf -a netbeans/etc/netbeans.conf netbeans_jdkhome '"/usr/lib/jvm/default"'
}

package() {
	mkdir -p "$pkgdir"/usr/{bin,share/applications}

	# Resources
	cp -r netbeans "$pkgdir/usr/share/$pkgname"

	# Desktop shortcut and icon
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 netbeans-nightly.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	ln -fs "/usr/share/$pkgname/bin/netbeans" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=4 sw=4 ai:
