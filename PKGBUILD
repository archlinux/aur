# Maintainer: Eric Cheng <eric@chengeric.com>

pkgbase=jellyfin-bin
pkgname=(jellyfin-bin jellyfin-web-bin jellyfin-server-bin)
pkgver=10.8.0
_pkgver="${pkgver}-1"
pkgrel=1
pkgdesc='The Free Software Media System'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://jellyfin.org/'
license=('GPL2')
provides=('jellyfin')
conflicts=('jellyfin')
source=(
	"jellyfin-web-${pkgver}.deb::https://repo.jellyfin.org/releases/server/debian/versions/stable/web/${pkgver}/jellyfin-web_${_pkgver}_all.deb"
	'jellyfin.conf'
	'jellyfin.service'
	'jellyfin.sysusers'
	'jellyfin.tmpfiles'
)
source_x86_64=("jellyfin-${pkgver}.deb::https://repo.jellyfin.org/releases/server/debian/versions/stable/server/${pkgver}/jellyfin-server_${_pkgver}_amd64.deb")
source_aarch64=("jellyfin-${pkgver}.deb::https://repo.jellyfin.org/releases/server/debian/versions/stable/server/${pkgver}/jellyfin-server_${_pkgver}_arm64.deb")
source_armv7h=("jellyfin-${pkgver}.deb::https://repo.jellyfin.org/releases/server/debian/versions/stable/server/${pkgver}/jellyfin-server_${_pkgver}_armhf.deb")
sha256sums=(
	'f5e5861f3e9941cef17fbd04d294a6f538f258f6167ef5201b97632167cd3af4'
	'1ea19635cced6672484937903c27976a5a145d708caff06a687a8defdd23d549'
	'0f8511673816daf528625366b6c27bc7e6182e4ac789191c87474667398376e2'
	'9bc1ddb77c73d46cc4078356b5773e5a776ebf8b47a1c820ad5fb17591ad5228'
	'b7faa4b0c756cdb361ef5b04fddfdc416b00f1246bb3a19a34bf4d185a6a7e5a'
)
sha256sums_x86_64=('af0b6133fe9df3b9096c3cd329a4a7df1664279a3903f47e8b003670305ac761')
sha256sums_aarch64=('1e594290beb3128f03221c4e5bcaa5b2f8fada1ade519fcc60d12f466fd090ec')
sha256sums_armv7h=('4acfcdb8f70fb57615ea66fdbf400b9e1a990bd95439b94479fd101cf657c340')
noextract=("jellyfin-${pkgver}.deb" "jellyfin-web-${pkgver}.deb")
options=('staticlibs')

prepare() {
	mkdir -p "jellyfin-web" "jellyfin-server"
	bsdtar -xf "jellyfin-web-${pkgver}.deb" -C "jellyfin-web"
	bsdtar -xf "jellyfin-${pkgver}.deb" -C "jellyfin-server"
}

package_jellyfin-bin() {
	depends=("jellyfin-web-bin=${pkgver}" "jellyfin-server-bin=${pkgver}")
}

package_jellyfin-server-bin() {
	pkgdesc="Jellyfin server component"
	optdepends=('jellyfin-ffmpeg5: Patched FFmpeg providing hardware acceleration and tonemapping support')
	depends=('ffmpeg')
	provides=('jellyfin-server')
	conflicts=('jellyfin-server')
	backup=('etc/conf.d/jellyfin')

	tar -xf "jellyfin-server/data.tar.xz" -C "jellyfin-server"
	cp -r "$srcdir/jellyfin-server/usr" "$pkgdir/usr"
	rm -r "$pkgdir/usr/share"

	install -Dm 644 "jellyfin.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm 644 "jellyfin.sysusers" "$pkgdir/usr/lib/sysusers.d/jellyfin.conf"
	install -Dm 644 "jellyfin.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/jellyfin.conf"
	install -Dm 644 "jellyfin.conf" "$pkgdir/etc/conf.d/jellyfin"
}

package_jellyfin-web-bin() {
	pkgdesc="Jellyfin web client"
	provides=('jellyfin-web')
	conflicts=('jellyfin-web')

	tar -xf "jellyfin-web/data.tar.xz" -C "jellyfin-web"
	cp -r "$srcdir/jellyfin-web/usr" "$pkgdir/"
}
