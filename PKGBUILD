# Maintainer: Rinne <aur@rinne.in>

_pkgname=BiLiBiLi_DanMu_Crawling
pkgname=bilibili-danmu-crawling-git
pkgver=New.V1.4.1.r0.587d07a
pkgrel=2
pkgdesc="爬取B站历史弹幕/全弹幕, 支持高级弹幕, Bas弹幕爬取. [2025年]可用; 内有算法可保证几乎不丢失弹幕情况下, 减少请求次数, 以提高爬取速度; 有GUI界面, 支持继续爬取. 通过二分确认最早有弹幕的日期, 再而爬取; 内置弹幕文件去重和弹幕文件合并功能"
arch=('any')
url="https://github.com/HengXin666/BiLiBiLi_DanMu_Crawling"
license=('MIT')
depends=('tk')
makedepends=('git' 'python' 'python-build' 'python-pip')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
# options=(!strip)
install=$pkgname.install
source=("${pkgname%-VCS}::git+https://github.com/HengXin666/BiLiBiLi_DanMu_Crawling.git#branch=main"
"${_pkgname}.desktop")
# noextract=()
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-VCS}"
	python -m venv env
        source env/bin/activate
	pip install -r requirements.txt
	pip install pyinstaller
	#rm -rf ./dist
	#rm -rf ./tmp-hx-build
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	source env/bin/activate
	pyinstaller --name ${_pkgname} --onefile main.py --distpath ./dist --specpath ./tmp-hx-build --workpath ./tmp-hx-build/build
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	install -d "$pkgdir/usr/share/applications"
	install -d "$pkgdir/usr/share/icons/hicolor/192x192/apps"
	install -Dm644 ./src/ico/app.png "$pkgdir/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png"
	install -Dm644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
	install -Dm755 ./dist/${_pkgname} "$pkgdir/opt/${_pkgname}/app"
}
