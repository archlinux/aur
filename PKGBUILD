# Maintainer: Yassine Oudjana <y.oudjana@protonmail.com>

pkgname=wayland-d
pkgver=0.3.1
pkgrel=1
pkgdesc="Dynamic Wayland bindings for D"
arch=('x86_64')
url="https://github.com/rtbo/wayland-d"
license=('MIT')
makedepends=('dub')
source=("https://github.com/rtbo/wayland-d/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('901be1d5f083c37666dc7ea896aeed886d6d55731ff9a42744c9d93b74a60748')

build() {
	cd wayland-d-$pkgver

	dub build wayland:client -c dynamic --parallel
	dub build wayland:cursor -c dynamic --parallel
	#dub build wayland:egl -c dynamic --parallel
	dub build wayland:server -c dynamic --parallel
}

package() {
	cd wayland-d-$pkgver
	
	mkdir -p "$pkgdir/usr/include/d/wayland"

	# Client
	install -Dm0755 "client/libwayland_client.a" "$pkgdir/usr/lib/libwayland-d-client.a"
	cp -R --no-dereference --preserve=mode,links "client/source/wayland/client" "$pkgdir/usr/include/d/wayland/client/"
	install -Dm0755 -t "$pkgdir/usr/include/d/wayland/native/" "client/source/wayland/native/client.d"
	
	# Cursor
	install -Dm0755 "cursor/libwayland_cursor.a" "$pkgdir/usr/lib/libwayland-d-cursor.a"
	install -Dm0755 -t "$pkgdir/usr/include/d/wayland/cursor/" "cursor/source/wayland/cursor.d"
	install -Dm0755 -t "$pkgdir/usr/include/d/wayland/native/" "cursor/source/wayland/native/cursor.d"
	
	# EGL
	#install -Dm0755 -t "$pkgdir/usr/lib/libwayland-d-egl.a" "egl/libwayland-d-egl.a"
	#cp -R --no-dereference --preserve=mode,links "egl/source/wayland/egl.d" "$pkgdir/usr/include/d/wayland/egl/"
	#install -Dm0755 -t "$pkgdir/usr/include/d/wayland/native/egl.d" "egl/source/wayland/native/egl.d"

	# Server
	install -Dm0755 "server/libwayland_server.a" "$pkgdir/usr/lib/libwayland-d-server.a"
	cp -R --no-dereference --preserve=mode,links "server/source/wayland/server" "$pkgdir/usr/include/d/wayland/server/"
	install -Dm0755 -t "$pkgdir/usr/include/d/wayland/native/" "server/source/wayland/native/server.d"
	
	# Util
	cp -R --no-dereference --preserve=mode,links "common/wayland/util/" "$pkgdir/usr/include/d/wayland/util/"
	install -Dm0755 -t "$pkgdir/usr/include/d/wayland/native/" "common/wayland/native/util.d"
}

