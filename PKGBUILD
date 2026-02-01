# Contributor: Jan Peter Koenig <public@janpeterkoenig.com>
# Contributor: John Lane <archlinux at jelmail dot com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=dcc
pkgver=2.3.169
pkgrel=1
pkgdesc="Distributed Checksum Clearinghouse spam tool"
url="https://www.dcc-servers.net/dcc/"
arch=('x86_64')
license=('custom')
depends=('sh')
source=(
	"https://www.dcc-servers.net/dcc/source/old/${pkgname}-${pkgver}.tar.Z"
)
sha256sums=('3447e655476ac742942daf25fc217236da456dd0f82b7117661b9a70484b7bf6')

_dstdir="/var/lib/${pkgname}"

build() {
	cd ${pkgname}-${pkgver}
	
	# Following fix is no longer needed
	# CPPFLAGS="$CPPFLAGS -O2" # https://bbs.archlinux.org/viewtopic.php?id=182812

	./configure \
		--with-installroot="${pkgdir}" \
		--mandir="/usr/share/man" \
		--homedir="${_dstdir}" \
		--bindir="/usr/bin" \
		--libexecdir="/usr/lib/${pkgname}"

	make
}

package() {
	cd ${pkgname}-${pkgver}

	# AUR comment zmeYski 2014-10-14 17:57
	MAKEFLAGS="$MAKEFLAGS -j1"

	make DESTDIR="${pkgdir}/" install
	
	# License
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Fix file and dir permissions
	chown -R root:root "${pkgdir}/"

	# Fix libraries not being stripped
	#find "${pkgdir}/" -exec file {} \; | grep -i elf|grep "not stripped"|awk -F: '{ print $1 }'|xargs strip
}

