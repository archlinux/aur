# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

pkgname=quake2xp-svn
_svnname=quake2xp
pkgver=r913
pkgrel=1
pkgdesc='Quake 2 based engine with glsl per pixel lighting effects and more'
arch=('i686' 'x86_64')
url='http://quake2xp.sourceforge.net/'
license=('GPL')
depends=('devil-ilut-vanilla' 'openal' 'sdl' 'libvorbis')
makedepends=('mesa' 'python2' 'unzip')
install="$_svnname.install"
source=("$_svnname::svn://svn.code.sf.net/p/quake2xp/code/trunk"
	'yandex://q2xp0.pkx'
	'yandex://q2xpMaps.pkx'
	'yandex://q2xpMdl.pkx'
	'yandex://q2xpMusic.pkx'
	'yandex://q2xpTex0.pkx'
	'yandex://q2xpWater.pkx'
	'ftp://ftp.idsoftware.com/idstuff/quake2/q2-3.20-x86-full.exe')
DLAGENTS+=("yandex::/usr/bin/echo %u - You need to download the files from https://yadi.sk/d/RP5yRSM-sx5ck/baseq2.")
sha256sums=('SKIP'
            'c6ea8f5f5d0e024dcc5f11fc47d65939965827cfc11151c22cd290ef046e1d6d'
            '5cec5b38a7e1225dc805b35d3c735524fb3b662991449449e392d45d8578f15a'
            'c4a6d25db4c9165dd5c8e1ff14ab134c21df326036b9a5bdee4380a20ceccf3a'
            '855ca6f37449deb82fc77d573c39d29e452c5a33dba23576402623653e58b893'
            'fb7ab9a545b8f561c4fc56e74276c1b1d066428e20a1b1d672f5b758226ca632'
            '9bc8cd9498bac5fd77db09848e3a5d0bd7e50b11e76997cc28bd26e66c750d33'
            'ee1b430258d5fc5a897ef47c6246f5da11de885f4c29fbeca005ff27924700be')
noextract=(q2xp0.pkx q2xpMaps.pkx q2xpMdl.pkx q2xpMusic.pkx q2xpTex0.pkx q2xpWater.pkx)

pkgver() {
	cd "$srcdir/$_svnname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	cd "$srcdir"
	unzip q2-3.20-x86-full.exe baseq2/\*
}

build() {
	cd "$srcdir/$_svnname"
	python2 waf configure --prefix=/usr
	python2 waf
}

package() {
	cd "$srcdir/$_svnname"
	python2 waf install --destdir="$pkgdir"
	install -Dm444 "$srcdir/"q2xp{0,Maps,Mdl,Music,Tex0}.pkx -t "$pkgdir/usr/share/quake2xp/baseq2"
	install -Dm444 "$srcdir/baseq2/"{maps.lst,*.pak} -t "$pkgdir/usr/share/quake2xp/baseq2"
	for p in $(ls "$srcdir/baseq2/players")
	do
		install -Dm444 "$srcdir/baseq2/players/$p/"* -t "$pkgdir/usr/share/quake2xp/baseq2/players/$(basename "$p")"
	done
}
