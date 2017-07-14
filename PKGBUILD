# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=ygopro-bin
pkgver=1.033.D
pkgrel=4
_pkgrel=1
pkgdesc="YGOPRO is a free online dueling system made for playing Yu-Gi-Oh! duels."
arch=('x86_64')
url='https://github.com/cromerc/ygopro'
license=('GPL2')
depends=('openal' 'openssl' 'freetype2' 'libevent' 'sfml' 'libgit2')
makedepends=('git')
backup=(opt/ygopro/system.conf)
source=("https://github.com/cromerc/ygopro/archive/${pkgver}-${_pkgrel}.tar.gz"
        ygopro.sh)
sha256sums=('017604d20afbef5ec548eceff3040db14427da499e833908b79b9321c61bd5dd'
            '706523e0c9732107e889cb20f3eece86096791237a959847bcd1debbdeb09532')
options=('!strip' 'emptydirs')
install=${pkgname}.install

package() {
	cd "${srcdir}/ygopro-${pkgver}-${_pkgrel}"
	mkdir -pv "$pkgdir/usr/share/pixmaps"
	mkdir -pv "$pkgdir/usr/share/applications"
	mv -v "YGOPro.png" "$pkgdir/usr/share/pixmaps/YGOPro.png"
	mv -v "YGOPro.desktop" "$pkgdir/usr/share/applications/YGOPro.desktop"
	mkdir -pv "$pkgdir/opt/ygopro"
	cp -dRv * "$pkgdir/opt/ygopro"
	cd "$pkgdir/opt/ygopro"
	find "$pkgdir/opt/ygopro" -type d -exec chmod 777 {} \;
	find "$pkgdir/opt/ygopro" -type f -exec chmod 777 {} \;
	mkdir -pv "$pkgdir/usr/lib"
	cd "$pkgdir/usr/lib"
	ln -s libsfml-audio.so.2.4 libsfml-audio.so.2.3
	ln -s libsfml-system.so.2.4 libsfml-system.so.2.3
	ln -s libgit2.so.25 libgit2.so.24
	ln -s libevent-2.1.so.6 libevent-2.0.so.5
	ln -s libevent_pthreads-2.1.so.6 libevent_pthreads-2.0.so.5

	mkdir -p "$pkgdir/opt/ygopro/expansions/live2017"
	cd "$pkgdir/opt/ygopro/expansions/live2017"
	git init
	git remote add origin https://github.com/Ygoproco/Live2017
	git pull origin master

	mkdir -p "$pkgdir/opt/ygopro/expansions/liveanime"
	cd "$pkgdir/opt/ygopro/expansions/liveanime"
	git init
	git remote add origin https://github.com/Ygoproco/Liveanime
	git pull origin master

	install -DTm755 ${srcdir}/ygopro.sh ${pkgdir}/usr/bin/ygopro
}
