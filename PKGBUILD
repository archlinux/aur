# Maintainer: Zhang Hua <https://github.com/zhanghua000>
# Contributer: Fuck-XuexiQiangguo <https://github.com/fuck-xuexiqiangguo>
pkgname=fxxk-xuexiqiangguo-git
pkgver="1.0.3"
pkgrel=1
pkgdesc="一款帮助成年人（或许未来包括小朋友）自动学刁的软件"
arch=( "aarch64" "x86_64" "i686" "armv7l" )
url="https://github.com/fuck-xuexiqiangguo/fuck-xuexiqiangguo"
licence=('MIT')
depends=( 'wget' 'unzip' 'gtk3' 'xorg-server-xvfb' 'libxss' 'alsa-lib' )
makedepends=( 'yarn' 'git' 'jq' )
source=(
	"${pkgname}::git+https://hub.fastgit.org/fuck-xuexiqiangguo/source-code"
	"arguments.json::https://raw.fastgit.org/zhanghua000/fuck-xuexiqiangguo-aur/main/arguments.json"
	"fuck-xuexiqiangguo.desktop::https://raw.fastgit.org/zhanghua000/fuck-xuexiqiangguo-aur/main/fuck-xuexiqiangguo.desktop"
)
md5sums=(
	"SKIP"
	"1dc893ed808ef14e0950a676342438e0"	
	"98884597ddd91fffc2c3e6e7b10137fc"
	
)
pkgver(){
	cd "${srcdir}/${pkgname}"
	jq .version package.json
	
}
prepare(){
	cd "${srcdir}/${pkgname}"
	install -D ${srcdir}/${pkgname}/logo.png build/logo.png
	install -D ${srcdir}/arguments.json arguments.json
	yarn install
	yarn add electron-builder --dev
	#sed -i '12s/3.0.17/$(jq .electron package.json)/' arguments.json
	sed -i '12s/3.0.17/9.3.4/' arguments.json
	jq -s '.[0] * .[1]' package.json arguments.json > package.json.new
	mv package.json.new package.json
}
build(){
	cd "${srcdir}/${pkgname}"
	yarn electron-builder build
}
package(){
	cd "${srcdir}/${pkgname}/dist"
	install -d -m755 ${pkgdir}/usr/bin
	install -d -m755 ${pkgdir}/usr/share/{applications,pixmaps}
	install -d -m755 ${pkgdir}/opt/fuck-xuexiqiangguo-git 
	cp -r `ls | grep linux*unpacked`/* ${pkgdir}/opt/fuck-xuexiqiangguo-git
	install -D ${srcdir}/fuck-xuexiqiangguo.desktop ${pkgdir}/usr/share/applications/fuck-xuexiqiangguo.desktop
	install -D ${srcdir}/${pkgname}/build/logo.png ${pkgdir}/usr/share/pixmaps/fuck-xuexiqiangguo.png
	ln -s /opt/fuck-xuexiqiangguo-git/fuck-xuexiqiangguo ${pkgdir}/usr/bin/fuck-xuexiqiangguo
}

