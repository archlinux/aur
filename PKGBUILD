# Maintainer: EndlessEden <eden@rose.place>
pkgname=monaserver2-git
pkgver=7.4.9.524f727
pkgrel=1
pkgdesc="MonaServer2 is a remake of Monaserver, a lightweight web and media server customizable by LUA script applications."
arch=('x86_64')
url="https://github.com/MonaSolutions/MonaServer2"
license=('GPL3')
depends=("luajit>=2.0.9" "openssl" "srt")
makedepends=('clang')
provides=('monaserver2')
conflicts=('monaserver2')
source=($pkgname::git+'https://github.com/MonaSolutions/MonaServer2.git')
md5sums=(SKIP)
CC=clang
CXX=clang++

pkgver() {
	cd "$pkgname"
	basever=$( cat Version.h | sed -e 's| |\n|g' | tail -1 | sed 's/./& /g' | sed 's| |.|g')
	printf "$basever$(git rev-parse --short HEAD)"
}

build() {
	unset CC CXX
	export CC="clang"
	export CXX="clang++"

	cd "$pkgname"
	make ENABLE_SRT=1
}

package() {
	cd ${srcdir}/"$pkgname"
	mkdir -p $pkgdir/etc
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/include
	mkdir -p $pkgdir/var/log/monaserver
	mkdir -p $pkgdir/var/lib/MonaServer
	mkdir -p $pkgdir/var/lib/MonaTiny
	cp -r MonaCore/include $pkgdir/usr/
	cp -r MonaCore/lib $pkgdir/usr/
	cp -r MonaBase/include $pkgdir/usr/
	cp -r MonaBase/lib $pkgdir/usr/
	#cp -r MonaServer/External/include $pkgdir/usr/ 
	#cp -r MonaServer/External/lib $pkgdir/usr/ 
	#cp -r MonaServer/External/lib64 $pkgdir/usr/
	cp MonaServer/MonaServer	$pkgdir/var/lib/MonaServer/
	ln -s /etc/MonaServer.ini $pkgdir/var/lib/MonaServer/MonaServer.ini
	cat MonaServer/MonaServer.ini | sed -e "s|directory=MonaServer.log|directory=/var/log/monaserver/|g" > $pkgdir/etc/MonaServer.ini
	cp -r MonaServer/www $pkgdir/var/lib/MonaServer/
	mkdir -p $pkgdir/var/lib/MonaServer/www/live
	cp -r MonaTiny/cert.pem $pkgdir/var/lib/MonaTiny/
	cp -r MonaTiny/key.pem $pkgdir/var/lib/MonaTiny/
	cp -r MonaTiny/MonaTiny $pkgdir/var/lib/MonaTiny/
	ln -s /var/log/MonaTiny.log $pkgdir/var/lib/MonaTiny/MonaTiny.log
	mkdir -p $pkgdir/var/log/MonaTiny.log/
	sudo chmod 0775 $pkgdir/var/log/MonaTiny.log/
	touch $pkgdir/var/log/monaserver/0.log && chmod 0775 $pkgdir/var/log/monaserver/0.log
	printf "#/bin/bash\n cd /var/lib/MonaServer\n ./MonaServer $@" >> $pkgdir/usr/bin/monaserver
	printf "#/bin/bash\n cd /var/lib/MonaTiny\n ./MonaTiny $@" >> $pkgdir/usr/bin/monatiny
	chmod a+x $pkgdir/usr/bin/monaserver
	chmod a+x $pkgdir/usr/bin/monatiny
}
