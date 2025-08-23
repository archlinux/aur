# Maintainers: kobe-koto <admin[at]koto[dot]cc>, Ketal_Q_ray <k[at]ketal[dot]icu>, Kevin_Liu <we123445[at]outlook[dot]com>
pkgname="liteloader-qqnt-bin"
_pkgname="LiteLoaderQQNT"
pkgver=1.3.0
pkgrel=1
pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/LiteLoaderQQNT/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq")
conflicts=("linuxqq-appimage" "liteloader-qqnt")
provides=("liteloader-qqnt")
source=("LiteLoaderQQNT-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}.zip"
	"liteloader-qqnt-patcher.sh"
	"liteloader-qqnt-depatch.hook"
	"liteloader-qqnt-patch.hook"
	)

sha256sums=(
	'00649308217a10bb191207709d7073c0ffaddb8e4e3e56ef4c152adee0f418c2'
	'71f645653e7ed404e70027bab159571636a2311b633246836028ddb9c730b530'
	'5f963c6ec64e93332f9a965d0ab85cf989df3607759c88162593baf31a0bd66f'
	'8bca733426b030cc481fd46733754be36d68432b2fe46bdaed4d552298da8737'
	)

build() {
	# Generate LiteLoaderQQNT.js
	echo "require(String.raw\`/opt/LiteLoaderQQNT\`)" > "${srcdir}/LiteLoaderQQNT.js"
}

package() {
	# Copy LiteLoaderQQNT files
	mkdir -p "${pkgdir}/opt/LiteLoaderQQNT"
	cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoaderQQNT/"

	# Install LiteLoaderQQNT's loading script
	mkdir -p "${pkgdir}/opt/QQ/resources/app/app_launcher"
	install -Dm644 "${srcdir}/LiteLoaderQQNT.js" "${pkgdir}/opt/QQ/resources/app/app_launcher/LiteLoaderQQNT.js"

	# Clean up in target dir
	rm -f "${pkgdir}/opt/LiteLoaderQQNT/LiteLoaderQQNT-${pkgver}.zip"
	rm -f "${pkgdir}/opt/LiteLoaderQQNT/liteloader-qqnt-patcher.sh"
	rm -f "${pkgdir}/opt/LiteLoaderQQNT/liteloader-qqnt-patch.hook"
	rm -f "${pkgdir}/opt/LiteLoaderQQNT/liteloader-qqnt-depatch.hook"
	rm -f "${pkgdir}/opt/LiteLoaderQQNT/LiteLoaderQQNT.js"

	# Install patcher script
	mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/patching"
	install -Dm755 "${srcdir}/liteloader-qqnt-patcher.sh" "${pkgdir}/opt/LiteLoaderQQNT/patching/liteloader-qqnt-patcher.sh"

	# Install pacman hooks
	install -Dm644 "${srcdir}/liteloader-qqnt-patch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-patch.hook"
	install -Dm644 "${srcdir}/liteloader-qqnt-depatch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-depatch.hook"
}
