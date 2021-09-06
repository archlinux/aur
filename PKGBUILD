# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgbase=jellyfin-bin
pkgname=(jellyfin-bin jellyfin-web-bin jellyfin-server-bin)
pkgver=10.7.7
_pkgver="${pkgver}-1"
pkgrel=2
pkgdesc='The Free Software Media System'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://jellyfin.org/'
license=('GPL2')
provides=('jellyfin')
conflicts=('jellyfin' 'jellyfin-git')
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
sha256sums=('ca06cc1be55cb0393de9cd002e5cd422b7746c68341125b8f4c18907c59647c8'
	'1ea19635cced6672484937903c27976a5a145d708caff06a687a8defdd23d549'
	'0f8511673816daf528625366b6c27bc7e6182e4ac789191c87474667398376e2'
	'9bc1ddb77c73d46cc4078356b5773e5a776ebf8b47a1c820ad5fb17591ad5228'
	'b7faa4b0c756cdb361ef5b04fddfdc416b00f1246bb3a19a34bf4d185a6a7e5a')
sha256sums_x86_64=('938c8be07e2d183b4ee23a0f01f78d140ecb7f58aadc7c0a6105b2e4382c7a4e')
sha256sums_aarch64=('0c42e615382fa567d8e274e77a65632f878680536eaf2bd77fb13a09dc59ada9')
sha256sums_armv7h=('685931c972ad044fbdc2ccbea07a5aaf75f93e99562ea799cd6e5a7ac4bdb0cf')
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
	optdepends=('ffmpeg-mmal: OpenMAX OMX hardware acceleration on Raspberry Pis')
	depends=('ffmpeg')
	provides=('jellyfin-server')
	conflicts=('jellyfin-server' 'jellyfin-server-git')
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
	conflicts=('jellyfin-web' 'jellyfin-web-git')

	tar -xf "jellyfin-web/data.tar.xz" -C "jellyfin-web"
	cp -r "$srcdir/jellyfin-web/usr" "$pkgdir/"
}
