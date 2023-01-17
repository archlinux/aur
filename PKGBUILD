#
# Maintainer: Michael Tindal <mj.tindal at gmail dot com>
# Contributor: Jani Lång <jani . long at gmail dot com>
# Contributor: Patrik Plihal <patrik.plihal at gmail dot com>
#
pkgname=nunit3-console
pkgver=3.16.0
pkgrel=2
pkgdesc="NUnit 3 console runner"
arch=('any')
license=('MIT')
url="http://www.nunit.com"
depends=('mono')

source=("https://github.com/nunit/nunit-console/releases/download/${pkgver}/NUnit.Console-${pkgver}.zip")
sha256sums=('d597c6a5ca3c08b5900159635dc30f39951f9a2ad53fdd69b0ad7bf782d1916a')
package() {
	# copy files, except the link to the original zip file
	mkdir -p   "${pkgdir}/usr/lib/${pkgname}"
	cp -r -p * "${pkgdir}/usr/lib/${pkgname}"
	rm -f      "${pkgdir}/usr/lib/${pkgname}/NUnit.Console-${pkgver}.zip"

	# install license and icon
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -Dm644 nunit.ico "${pkgdir}/usr/share/icons/${pkgname}/nunit.ico"

	# create wrapper script for launching console runner with mono
	# using '<<-' trims leading tabs (but not spaces!)
	mkdir -p "${pkgdir}/usr/bin/"
	cat <<-EOF > "$pkgdir/usr/bin/nunit3-console"
		#!/bin/sh
		# Wrapper script for NUnit 3 console runner
		exec $(which mono) --debug /usr/lib/${pkgname}/bin/nunit3-console.exe "\$@"
EOF
	chmod +x "${pkgdir}/usr/bin/nunit3-console"
}
