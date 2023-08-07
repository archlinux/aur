# Maintainer: xihale <xihale.top@qq.com>
pkgname=listen1-git
pkgver=0
pkgrel=1
pkgdesc="Listen 1 可以搜索和播放来自多个主流音乐网站的歌曲，让你的曲库更全面。并支持收藏功能，方便的创建自己的歌单。"
arch=("x86_64")
license=('MIT')
depends=('electron' 'npm')
makedepends=('gendesk' 'git')
url="https://github.com/listen1/listen1_desktop"
source=("listen1::git+https://github.com/xihale/listen1_desktop.git")
sha512sums=("SKIP")

prepare() {
	cd listen1
	# Use ther second hand dev version of mine, it's a temporary work
	git clone https://github.com/xihale/listen1_chrome_extension app/listen1_chrome_extension
	# 	git submodule update --init --recursive
}

build() {
	cd listen1/app
	if command -v cnpm &>/dev/null; then
		cnpm i --production
	elif command -v pnpm &>/dev/null; then
		pnpm i -P
	else
		npm i --production
	fi
}

package() {

	gendesk -f -n --icon "listen1" --categories "Utility" --name "${pkgname%-git}" --exec "electron /opt/${pkgname%-git}/"
	install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"

	cd listen1/app/listen1_chrome_extension
	install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
	install -Dm644 "./images/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
	cd ..
	# Only 755 can build success!
	install -dm755 $pkgdir/opt/${pkgname%-git}/
	mv * $pkgdir/opt/${pkgname%-git}/
}
