# Maintainer: Pavol Hluchy (Lopo) <lopo AT losys DOT eu>

pkgname=netbeans-incubator
pkgver=20190512
pkgrel=1
pkgdesc='IDE for Java, HTML5, PHP, Groovy, C and C++ (incubator/nightly version)'
license=('Apache')
arch=('any')
url="http://netbeans.apache.org"
depends=('java-environment>=9' 'ttf-font')
makedepends=('gendesk' 'setconf' 'curl')
optdepends=('php: for developing programs in php'
	'groovy: for developing programs in groovy'
	'lib32-glibc'
	)
provides=('netbeans')
backup=("usr/lib/$pkgname/etc/netbeans.conf")
install="netbeans.install"
options=(!strip)
source=('netbeans-nightly.png')
sha512sums=('5ce471647913dd0686511724d9b6045f44e9ae06938a8b6f8478bfd7c261c17fea4fa2b692a8c2d6b766503f00aff9c4b8f9e6c26d3b697b8f9a2361a66d9409')
_webroot="https://builds.apache.org/view/Incubator%20Projects/job/netbeans-linux"

prepare() {
	cd "${SRCDEST}"

	rm -f webindex
	curl -gqb "" -fLC - --retry 3 --retry-delay 3 -o webindex "${_webroot}/lastStableBuild/artifact/nbbuild/"

	_file=`grep -e '-release.zip' webindex \
		| awk  'BEGIN{FPAT="NetBeans-dev-netbeans-linux-[[:digit:]]+-on-[[:digit:]]+-release.zip";} {print $1}'`
	download_file "${_webroot}/lastStableBuild/artifact/nbbuild/${_file}"

	cd "$srcdir"
	ln -fs "${SRCDEST}/${_file}"
	extract_file "${_file}"
}

pkgver() {
	cd "${SRCDEST}"
	grep -e '-release.zip' webindex \
		| awk 'BEGIN{FPAT="NetBeans-dev-netbeans-linux-[[:digit:]]+-on-[[:digit:]]+-release.zip";} {print $1}' \
		| awk 'BEGIN{FPAT="[[:digit:]]+";} {print $2"."$1}'
}

build() {
	msg2 "cleanup OS specific files"
	rm $(find -name '*\.exe' -or -name '*\.bat' -or -name '*\.dll')
	rm -r $(find -name 'MacOSX*' -or -name 'Windows*' -or -name 'SunOS*' -or -name 'FreeBSD*')
	rm -r $(find -name 'hpux*' -or -name 'mac*' -or -name 'solaris*' -or -name 'windows*')
	rm -r $(find -name '*-sparc_64' -or -name 'linux-arm*')

	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
		--custom "StartupWMClass=NetBeans IDE Dev"
	setconf "netbeans/bin/netbeans" basedir "/usr/lib/$pkgname"
}

package() {
	mkdir -p "$pkgdir"/usr/{bin,lib}

	# Resources
	cp -r netbeans "$pkgdir/usr/lib/$pkgname"

	# Desktop shortcut and icon
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 netbeans-nightly.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	ln -fs "/usr/lib/$pkgname/bin/netbeans" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=4 sw=4 ai:
