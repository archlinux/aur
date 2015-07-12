# Maintainer: AkiraYB <brunoyb!outlook,com>

pkgname=nethack-nao
_pkgname=nethack
_gitname=nh343-nao
pkgver=3.4.3_20141103
_pkgver=3.4.3
pkgrel=1
pkgdesc='A single player dungeon exploration game (with patches from NAO)'
arch=('i686' 'x86_64')
url='http://alt.org/nethack/naonh.php' # http://www.nethack.org/
license=('custom')
depends=('bash')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('var/games/nethack/logfile'
        'var/games/nethack/perm'
        'var/games/nethack/record'
        'var/games/nethack/xlogfile')
changelog="${_pkgname}.changelog"
source=("git+http://alt.org/nethack/nh343-nao.git"
        "${_pkgname}.patch")
sha256sums=('SKIP'
            '4263cac9fa958763966525a6e9d67149f608b01bef26039a12deb0d5b6a979bf')

prepare()
{
	cd "$_gitname"
	git apply "${srcdir}/${_pkgname}.patch"
}

build()
{
	cd "$_gitname"
	make
}

package()
{
	cd "$_gitname"

	local _libdir="${pkgdir}/usr/lib/nethack"
	local _docdir="${pkgdir}/usr/share/doc/${_pkgname}"
	local _mandir="${pkgdir}/usr/share/man/man6"
	local _licensesdir="${pkgdir}/usr/share/licenses/${_pkgname}"
	local _gamesdir="${pkgdir}/var/games/nethack"

	install -d "$_docdir" "$_mandir" "$_licensesdir"

	make PREFIX="$pkgdir" MANDIR="$_mandir" install manpages

	mv "${_libdir}/license" "${_licensesdir}/LICENSE"
	install -m 644 doc/Guidebook.txt "${_docdir}"

	sed -e "s|^HACKDIR=${pkgdir}|HACKDIR=|" -i "${pkgdir}/usr/bin/nethack"

	chown -R root:games "${_gamesdir%/nethack}" "${_libdir}/nethack"
	chmod 775 "${_gamesdir%/nethack}"
	chmod 775 "${_gamesdir}"/{,save}
	chmod 664 "${_gamesdir}"/{logfile,perm,record,xlogfile}
}
