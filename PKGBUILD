# Maintainer: Mario Rodas <marsam@users.noreply.github.com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=ats2-postiats
_pkgname=ATS2-Postiats
pkgver=0.3.7
pkgrel=4
pkgdesc="Statically typed programming language"
arch=('i686' 'x86_64')
url="http://www.ats-lang.org/"
license=('GPL3')
depends=('bash' 'gmp')
optdepends=()
options=('staticlibs' '!emptydirs' '!makeflags')
install="${pkgname}.install"
source=("https://downloads.sourceforge.net/project/ats2-lang/ats2-lang/ats2-postiats-${pkgver}/${_pkgname}-${pkgver}.tgz")

sha256sums=('05820af2390bd7f33fe8bc00e251e609f7b5af5124d089c6d582589746f4dda6')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	# NOTE: Before update a version check if has been correctly packaged
	# sed -i "s/0.2.11/${pkgver}/g" VERSION
	# sed -i "s/0.2.10/${pkgver}/g" configure.ac
	autoconf
	./configure --prefix=/usr
	make all
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	local profiled="${pkgdir}/etc/profile.d"
	local patshome="/usr/lib/${pkgname}-${pkgver}"
	mkdir -p "${profiled}"

	echo "export PATSHOME=${patshome}" > "${profiled}/${pkgname}.sh"
	echo "setenv PATSHOME ${patshome}" > "${profiled}/${pkgname}.csh"

	chmod 0755 "${profiled}/${pkgname}.sh" "${profiled}/${pkgname}.csh"
}

# Local Variables:
# compile-command: "makepkg -sm && mksrcinfo"
# End:
