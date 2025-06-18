# Maintainer: Rinne <aur@rinne.in>

_pkgname=bilibili-danmu-crawling
pkgname=bilibili-danmu-crawling-git
pkgver=New.V1.3.1.r0.0b7a32f
pkgrel=2
pkgdesc="爬取B站历史弹幕/全弹幕, 支持高级弹幕, Bas弹幕爬取. [2025年]可用; 内有算法可保证几乎不丢失弹幕情况下, 减少请求次数, 以提高爬取速度; 有GUI界面, 支持继续爬取. 通过二分确认最早有弹幕的日期, 再而爬取; 内置弹幕文件去重和弹幕文件合并功能"
arch=('any')
url="https://github.com/HengXin666/BiLiBiLi_DanMu_Crawling"
license=('MIT')
depends=('tk')
makedepends=('git' 'python' 'python-build' 'python-pip')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
options=(!strip)
install=$pkgname.install
source=("${pkgname%-VCS}::git+https://github.com/HengXin666/BiLiBiLi_DanMu_Crawling.git#branch=main"
"${_pkgname}.desktop"
"${_pkgname}-config.json")
# noextract=()
sha256sums=('SKIP' 'SKIP' 'SKIP')

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
	rm -rf ./dist
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	source env/bin/activate
	pyinstaller ./main.spec
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/opt/${_pkgname}/_internal"
	install -d "$pkgdir/usr/share/applications"
	install -d "$pkgdir/etc/${_pkgname}"
	cp -r ./dist/main/_internal "$pkgdir/opt/${_pkgname}"
	install -dm755 "$pkgdir/opt/${_pkgname}/_internal/config"
	install -Dm775 "$srcdir/${_pkgname}-config.json" "$pkgdir/opt/${_pkgname}/_internal/config/config.json"
	install -dm777 "$pkgdir/opt/${_pkgname}/_internal/output"
	install -Dm644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
	install -Dm755 ./dist/main/main "$pkgdir/opt/${_pkgname}/main"
	ln -sf "/opt/${_pkgname}/_internal/config" "$pkgdir/etc/${_pkgname}"
	# install -Dm755 ./dist/main "$pkgdir/usr/bin/bilibili-danmu-crawling"
}
