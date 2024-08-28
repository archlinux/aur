# Maintainers: kobe-koto <admin[at]koto.cc>, Ketal_Q_ray <k[at]ketal.icu>
pkgname="liteloader-qqnt-git"
_pkgname="LiteLoaderQQNT"
pkgver=latest
pkgrel=3
pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/LiteLoaderQQNT/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq" "bubblewrap")
makedepends=("git")
conflicts=("linuxqq-appimage" "liteloader-qqnt")
provides=("liteloader-qqnt")
source=(
	"git+${url}.git"
	"liteloader-qqnt-depatch.hook"
	"liteloader-qqnt-patch.hook"
	"gen_preload.js"
	"index.js"
	"patch_liteloader_bwarp.sh"
	)

sha256sums=("SKIP"
	'a7182c1697285c46fca19b02f5e34051562a51a4dc529a1cd5d171177c584710'
	'3cacd5aa344eba037f45279b1cb4c2e56fe01057b3fa9acc32474957c97f9be0'
	'34647dd074b6cbcc0ab7e7b1178de6c92064703f6d219b422baee42fbe729949'
	'da197eee75d92d5d79861d3531e59afc1caf091446b4ba2d0a8916e0a9c87b0b'
	'6c81d269959110b38495e72b51ebd51021f6feb837cac6bedc46a697eaa67462'
	)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	# Modify LiteLoaderQQNT version code to the GIT version code.
	TargetVersionCodeLine=$(awk "/version/{print NR}" ./package.json)
	OrigVersionCode=$(cat ./package.json | grep -o '"version": "[^"]*' | cut -d '"' -f4)
	sed -i "${TargetLine}s/${OrigVersionCode}/${pkgver}/g" ./package.json
}

package() {
	# prepare to copy files
	mkdir -p "${pkgdir}/opt/LiteLoaderQQNT"
	#mkdir -p "${pkgdir}/opt/QQ/resources/app/application"

	# copy files
	cp -rf "${_pkgname}"/* "${pkgdir}/opt/LiteLoaderQQNT"
	# cp -f "${_pkgname}/src/preload.js" "${pkgdir}/opt/QQ/resources/app/application/preload.js"

	# modify premissions
	# chmod -R 0777 "${pkgdir}/opt/LiteLoaderQQNT"

	# clean up
	# - remove .git/
	# - rm -rf "${pkgdir}/opt/QQ/resources/app/LiteLoader/.git"

	# copying patching files
	mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/patching"
	cp "${srcdir}/gen_preload.js" "${pkgdir}/opt/LiteLoaderQQNT/patching/gen_preload.js"
	cp "${srcdir}/index.js" "${pkgdir}/opt/LiteLoaderQQNT/patching/index.js"
	cp "${srcdir}/patch_liteloader_bwarp.sh" "${pkgdir}/opt/LiteLoaderQQNT/patching/patch_liteloader_bwarp.sh"

	# install hooks
	install -Dm644 "${srcdir}/liteloader-qqnt-patch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-patch.hook"
	install -Dm644 "${srcdir}/liteloader-qqnt-depatch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-depatch.hook"
}
