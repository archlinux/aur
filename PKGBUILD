# Maintainer: E5ten

pkgname=mpd-rich-presence-discord-git
_pkgname=mpd-rich-presence-discord
pkgver=r29
pkgrel=1
pkgdesc=" Broadcast your MPD state using discord rich presence!"
arch=('x86_64')
url='https://github.com/SSStormy'
license=('MIT')
depends=('libmpdclient')
makedepends=('git' 'cmake')
source=("git+https://github.com/SSStormy/$_pkgname.git")
md5sums=('SKIP')

build() {
	cd $srcdir/$_pkgname
	git submodule update --init --recursive
	cd lib/discord-rpc
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=.
	sed -i '1952s/.*/std::memcpy(reinterpret_cast<void *>(m), reinterpret_cast<void *>(members), count * sizeof(Member));/' ../thirdparty/rapidjson-1.1.0/include/rapidjson/document.h
	sed -i '1939s/.*/std::memcpy(reinterpret_cast<void *>(e), reinterpret_cast<void *>(values), count * sizeof(GenericValue));/' ../thirdparty/rapidjson-1.1.0/include/rapidjson/document.h
	cmake --build . --config Release --target install
	cd ../../..
	mkdir release
	cd release
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd $srcdir/$_pkgname/release
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib/systemd/system/
	install -Dm755 mpd_discord_richpresence $pkgdir/usr/bin/
	ln -s /usr/bin/mpd_discord_richpresence $pkgdir/usr/bin/mpd-rpc
	install -Dm644 mpd-discord.service $pkgdir/usr/lib/systemd/system/
}