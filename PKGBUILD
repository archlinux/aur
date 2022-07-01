# Maintainer: Eric Cheng <eric@chengeric.com>

pkgbase=jellyfin-bin
pkgname=(jellyfin-bin jellyfin-web-bin jellyfin-server-bin)
pkgver=10.8.1
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
	'0b7ab57f6d88ea1bd87f88b56bcaf597b88f3b73ca037007d3f6dae7b4673215'
	'1ea19635cced6672484937903c27976a5a145d708caff06a687a8defdd23d549'
	'0f8511673816daf528625366b6c27bc7e6182e4ac789191c87474667398376e2'
	'9bc1ddb77c73d46cc4078356b5773e5a776ebf8b47a1c820ad5fb17591ad5228'
	'b7faa4b0c756cdb361ef5b04fddfdc416b00f1246bb3a19a34bf4d185a6a7e5a'
)
sha256sums_x86_64=('2edf6e485ec4d04e9fd9b8573ec4cb0f58f47c6645ebd8edc65511597a194115')
sha256sums_aarch64=('683ec1ac76a78d46568ecc88ff891e23f63038fa8c89466f6be0f7e8da363c15')
sha256sums_armv7h=('d4f558c4e35a58f503aa54a49e6fe726fff2b13a55438f0fbe3e3adb87b2d5bd')
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
