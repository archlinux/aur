# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgname=dbshell
pkgver=210311
pkgrel=1
pkgdesc="Multi-Database SQL Command Line Client"
arch=('any')
url="https://dbschema.com/documentation/dbshell.html"
license=('Apache')
depends=('java-runtime' 'sh')
makedepends=('unzip')
source=("https://dbschema.com/download/dbshell/dbshell_no_jre.tar.gz")
sha256sums=('7f843ecc3cc308eef6ee9dac61fcfc35930bd26ca772856a6edc398f813b977b')

pkgver() {
	cd "${pkgname}"
	# appears to be date in YYMMDD format
	unzip -p lib/dbshell.jar META-INF/MANIFEST.MF |
		sed -En '/Implementation-Version:/{s/^Implementation-Version:\s*//;s/\r//g;p}'
}

check() {
	[[ -x "${pkgname}/dbshell" ]]
	for f in ${pkgname}/drivers/*/*.jar; do
		[[ -e "$f" ]] && continue
		return 1
	done
}

package() {
	install -vdm755 "${pkgdir}/opt"
	cp -favt "${pkgdir}/opt" "dbshell"

	cd "${pkgname}"
	install -vdm755 "${pkgdir}/usr/bin"
	ln -svT "/opt/dbshell/dbshell" "${pkgdir}/usr/bin/dbshell"
	install -vDm644 -t "$pkgdir/usr/share/licenses/${pkgname}" "license/license.txt"
	install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "Readme.txt"
}
