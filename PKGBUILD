# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

pkgname=quake2xp-svn
_svnname=quake2xp
pkgver=r1043
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
	'http://ftp.mancubus.net/pub/idstuff/quake2/q2-3.20-x86-full.exe'
	'keys-guard.patch')
DLAGENTS+=("yandex::/usr/bin/echo %u - You need to download the files from https://yadi.sk/d/RP5yRSM-sx5ck/baseq2.")
sha256sums=('SKIP'
            'a22b9324b1b8acada8f3abdd2a7787560a468b564d5cb1743e389da86b54363b'
            'a96204dfab7e6632042267a8360b1f2cb33c7b4a804478a2b6527d2167d34a71'
            'd2e0e15beaade312b929eb24b82b8561be9cb5ab66e921e0553ca78533f11a4a'
            '855ca6f37449deb82fc77d573c39d29e452c5a33dba23576402623653e58b893'
            '7f4116742cb3abcf05e374793e4b13a630f7b0eda818b8d509dc7e5691955d34'
            'ee1b430258d5fc5a897ef47c6246f5da11de885f4c29fbeca005ff27924700be'
            '4a5cd39f61d54cce9daa11272e2f79662c87b39d87fc4ac4a8b1ee3710d181fc')
noextract=(q2xp0.pkx q2xpMaps.pkx q2xpMdl.pkx q2xpMusic.pkx q2xpTex0.pkx)

pkgver() {
	cd "$srcdir/$_svnname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	cd "$srcdir"
	unzip q2-3.20-x86-full.exe baseq2/\*
	cd "$_svnname"
	patch --binary -p1 -i ../keys-guard.patch || true
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
