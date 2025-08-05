# Maintainers: kobe-koto <admin[at]koto.cc>, Ketal_Q_ray <k[at]ketal.icu>
pkgname="liteloader-qqnt-git"
_pkgname="LiteLoaderQQNT"
pkgver=1.2.4.r7.g09f83c4
pkgrel=1
pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/LiteLoaderQQNT/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq")
makedepends=("git")
conflicts=("linuxqq-appimage" "liteloader-qqnt")
provides=("liteloader-qqnt")
source=(
	"git+${url}.git"
	"liteloader-qqnt-patcher.sh"
	"liteloader-qqnt-depatch.hook"
	"liteloader-qqnt-patch.hook"
	)

sha256sums=(
	'SKIP'
	'71f645653e7ed404e70027bab159571636a2311b633246836028ddb9c730b530'
	'5f963c6ec64e93332f9a965d0ab85cf989df3607759c88162593baf31a0bd66f'
	'8bca733426b030cc481fd46733754be36d68432b2fe46bdaed4d552298da8737'
	)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	# Make LiteLoaderQQNT's version code match to the Git version code.
	TargetVersionCodeLine=$(awk "/version/{print NR}" ./package.json)
	OrigVersionCode=$(cat ./package.json | grep -o '"version": "[^"]*' | cut -d '"' -f4)
	sed -i "${TargetLine}s/${OrigVersionCode}/${pkgver}/g" ./package.json

	# Generate LiteLoaderQQNT.js
	echo "require(String.raw\`/opt/LiteLoaderQQNT\`)" > "${srcdir}/LiteLoaderQQNT.js"
}

package() {
	# Copy LiteLoaderQQNT files
	mkdir -p "${pkgdir}/opt/LiteLoaderQQNT"
	cp -rf "${srcdir}/${_pkgname}"/* "${pkgdir}/opt/LiteLoaderQQNT"

	# Install LiteLoaderQQNT's loading script
	mkdir -p "${pkgdir}/opt/QQ/resources/app/app_launcher"
	install -Dm644 "${srcdir}/LiteLoaderQQNT.js" "${pkgdir}/opt/QQ/resources/app/app_launcher/LiteLoaderQQNT.js"

	# Install patcher script
	mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/patching"
	install -Dm755 "${srcdir}/liteloader-qqnt-patcher.sh" "${pkgdir}/opt/LiteLoaderQQNT/patching/liteloader-qqnt-patcher.sh"

	# Install pacman hooks
	install -Dm644 "${srcdir}/liteloader-qqnt-patch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-patch.hook"
	install -Dm644 "${srcdir}/liteloader-qqnt-depatch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-depatch.hook"
}
