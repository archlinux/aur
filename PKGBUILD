# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

pkgname=quake2xp-svn
_svnname=quake2xp
pkgver=r783
pkgrel=1
pkgdesc='Quake 2 based engine with glsl per pixel lighting effects and more'
arch=('i686' 'x86_64')
url='http://quake2xp.sourceforge.net/'
license=('GPL')
depends=('devil-ilut-vanilla' 'openal' 'sdl' 'libvorbis')
makedepends=('mesa' 'python2' 'unzip')
install="$_svnname.install"
source=("$_svnname::svn://svn.code.sf.net/p/quake2xp/code/trunk"
	'http://downloads.sourceforge.net/quake2xp/media/baseq2/q2xp0.pkx'
	'http://downloads.sourceforge.net/quake2xp/media/baseq2/q2xpMaps.pkx'
	'http://downloads.sourceforge.net/quake2xp/media/baseq2/q2xpMdl.pkx'
	'http://downloads.sourceforge.net/quake2xp/media/baseq2/q2xpMusic.pkx'
	'http://downloads.sourceforge.net/quake2xp/media/baseq2/q2xpTex0.pkx'
	'ftp://ftp.idsoftware.com/idstuff/quake2/q2-3.20-x86-full.exe')
sha256sums=('SKIP'
            '1c4e5e6dc5f6a362db1abefa0b81c486e6c145ea39c7adfc412c167535f82562'
            'e3830df0da5bf95acd793ee299527fbb67ba53fe480c2a992e61d740be4c410b'
            '6810dfc43dab5dec3c5d046ea943530e0b1c3fbfc32515d2909180dcf170427c'
            '855ca6f37449deb82fc77d573c39d29e452c5a33dba23576402623653e58b893'
            'd81348c1a89e6a0d00c310c8514dc346ab84e6d8b1a10345585f6936aefede3d'
            'ee1b430258d5fc5a897ef47c6246f5da11de885f4c29fbeca005ff27924700be')
noextract=(q2xp0.pkx q2xpMaps.pkx q2xpMdl.pkx q2xpMusic.pkx q2xpTex0.pkx)

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
	install -Dm444 "$srcdir/"{q2xp0,q2xpMaps,q2xpMdl,q2xpMusic,q2xpTex0}.pkx -t "$pkgdir/usr/share/quake2xp/baseq2"
	install -Dm444 "$srcdir/baseq2/"{maps.lst,*.pak} -t "$pkgdir/usr/share/quake2xp/baseq2"
	for p in $(ls "$srcdir/baseq2/players")
	do
		install -Dm444 "$srcdir/baseq2/players/$p/"* -t "$pkgdir/usr/share/quake2xp/baseq2/players/$(basename "$p")"
	done
}
