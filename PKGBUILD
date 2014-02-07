# Contributor: J0k3r <moebius282 at gmail dot com>
# Contributor: Marcel Pfeiffer <pfeiffer.marcel at gmx dot de>
# Contributor: epsy < epsy46 at free dot fr >

pkgname=netradiant-git
pkgver=1334
pkgrel=1
epoch=1
pkgdesc="A Stabilized Q3 Map Editor - git version"
arch=('i686' 'x86_64')
url="http://dev.xonotic.org/projects/xonotic/wiki/Netradiant"
license=('GPL' 'BSD' 'LGPL')
depends=('gtk2' 'gtkglext' 'libxml2' 'zlib' 'libpng')
options=()
makedepends=('svn')
provides=('netradiant')
conflicts=('netradiant-svn-unfree' 'netradiant-svn' 'netradiant-bin32')
source=("${pkgname}::git://git.xonotic.org/xonotic/netradiant.git"
		"netradiant.desktop")
sha256sums=('SKIP'
			'e462d733d2c9136f4b9648573065b457e80568fddafd331c0cac895994049454')

pkgver()
{
  cd "${srcdir}/${pkgname}/"
  echo $(git rev-list --count master)
}

build()
{
	cd "${srcdir}/${pkgname}/"
	make
}

package()
{
	cd "${srcdir}/${pkgname}/"

	mkdir -p "${pkgdir}/opt/"
	mkdir -p "${pkgdir}/usr/bin/"

	mv "install/" "${pkgdir}/opt/${pkgname}/"

	cat > "${pkgdir}/usr/bin/netradiant" <<-EOF
		#!/bin/bash

		cd "/opt/${pkgname}/"
		./radiant.x86
	EOF

	chmod 0755 "${pkgdir}/usr/bin/netradiant"

	install -Dm644 "${srcdir}/netradiant.desktop" "${pkgdir}/usr/share/applications/netradiant.desktop"
	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
