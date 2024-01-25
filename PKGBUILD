# Maintainers: kobe-koto <admin[at]koto.cc>, Ketal_Q_ray <k[at]ketal.icu>
pkgname="liteloader-qqnt-git"
_pkgname="LiteLoaderQQNT"
pkgver=1.0.2.r0.gf621aee
pkgrel=1
pkgdesc="轻量, 简洁, 开源的 QQNT 插件加载器"
arch=('any')
url="https://github.com/LiteLoaderQQNT/LiteLoaderQQNT"
license=('MIT')
depends=("linuxqq")
makedepends=("npm")
conflicts=("linuxqq-appimage" "liteloader-qqnt")
provides=("liteloader-qqnt")
source=(
	"git+${url}.git"
	"liteloader-qqnt-depatch.hook"
	"liteloader-qqnt-patch.hook"
)
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver (){
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build () {
	cd "${srcdir}/${_pkgname}"

	# Modify LiteLoaderQQNT version code to the GIT version code.
	TargetVersionCodeLine=$(awk "/version/{print NR}" ./package.json)
	OrigVersionCode=$(cat ./package.json | grep -o '"version": "[^"]*' | cut -d '"' -f4)
	sed -i "${TargetLine}s/${OrigVersionCode}/${pkgver}/g" ./package.json
	# Modify done
}

package () {
	# prepare to copy files
	mkdir -p "${pkgdir}/opt/LiteLoader"
	mkdir -p "${pkgdir}/opt/QQ/resources/app/application"

	# copy files
	cp -rf "${_pkgname}"/* "${pkgdir}/opt/LiteLoader"
	cp -f "${_pkgname}/src/preload.js" "${pkgdir}/opt/QQ/resources/app/application/preload.js"

	# modify premissions
	chmod -R 0777 "${pkgdir}/opt/LiteLoader"

	# clean up
	# - remove .git/
	rm -rf "${pkgdir}/opt/QQ/resources/app/LiteLoader/.git"

	# install hooks
	install -Dm644 "${srcdir}/liteloader-qqnt-patch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-patch.hook"
	install -Dm644 "${srcdir}/liteloader-qqnt-depatch.hook" "${pkgdir}/etc/pacman.d/hooks/liteloader-qqnt-depatch.hook"
}
