# Maintainers: kobe-koto <admin[at]koto.cc>, Ketal_Q_ray <k[at]ketal.icu>
pkgname="liteloader-qqnt-git"
_pkgname="LiteLoaderQQNT"
pkgver=latest
pkgrel=5
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
	"patch_liteloader_bwrap.sh"
	)

sha256sums=("SKIP"
	'a7182c1697285c46fca19b02f5e34051562a51a4dc529a1cd5d171177c584710'
	'bd1a8f828cbf328ddeaee3fe72049192927420404cf1295caa7dffca3e53b8bf'
	'6105389087a7d94eb743191aa1bf484bdf48f24d6470a8c1e4e7a74aa359ec23'
	'da197eee75d92d5d79861d3531e59afc1caf091446b4ba2d0a8916e0a9c87b0b'
	'40a575bdfcde9d4a77412282302b8fc71e9b1533386bba2352abc8e72e53e668'
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
	cp "${srcdir}/patch_liteloader_bwrap.sh" "${pkgdir}/opt/LiteLoaderQQNT/patching/patch_liteloader_bwrap.sh"

	# install hooks
	install -Dm644 "${srcdir}/liteloader-qqnt-patch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-patch.hook"
	install -Dm644 "${srcdir}/liteloader-qqnt-depatch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-depatch.hook"
}
