# Maintainers: kobe-koto <admin[at]koto.cc>, Ketal_Q_ray <k[at]ketal.icu>
pkgname="liteloader-qqnt-git"
_pkgname="LiteLoaderQQNT"
pkgver=1.3.0.r32.gec5b588
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
	)

sha256sums=(
	'SKIP'
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
}

package() {
	# Copy LiteLoaderQQNT files
	install -dm755 "${pkgdir}/opt/LiteLoaderQQNT/"
	cp -r $srcdir/LiteLoaderQQNT/* "${pkgdir}/opt/LiteLoaderQQNT/"
	chmod -Rf 755 "${pkgdir}/opt/LiteLoaderQQNT/"

	# Clean up
	cd $pkgdir/opt/LiteLoaderQQNT
	rm -rf .git .github .gitignore README.md README_EN.md
}
