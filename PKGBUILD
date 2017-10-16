# Maintainer: Mario Rodas <marsam@users.noreply.github.com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>

pkgname=ats2-postiats
_pkgname=ATS2-Postiats
pkgver=0.3.7
pkgrel=3
pkgdesc="Statically typed programming language"
arch=('i686' 'x86_64')
url="http://www.ats-lang.org/"
license=('GPL3')
depends=('bash' 'gmp')
optdepends=()
options=('staticlibs' '!emptydirs' '!makeflags')
install="${pkgname}.install"
source=("https://downloads.sourceforge.net/project/ats2-lang/ats2-lang/ats2-postiats-${pkgver}/${_pkgname}-${pkgver}.tgz"
        'https://raw.githubusercontent.com/githwxi/ATS-Postiats/bcc2ece436fdad3b64a1aa15f032d65d807d6076/bin/myatscc_env.sh.in')

sha256sums=('909c72b6a9db7434122815e391a4ac0ed421e6c668412b2344d55086cf7e29e4'
            '6b52eed360826b8dd768c9660c902b7506e3e61175d4a2179c40f3b829a581de')

prepare() {
	cp myatscc_env.sh.in "${_pkgname}-${pkgver}"/bin/
}

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
