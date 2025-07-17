# Maintainer: Rinne <aur@rinne.in>

_pkgname=BiLiBiLi_DanMu_Crawling
pkgname=bilibili-danmu-crawling-git
pkgver=New.V1.5.1.r0.e26ee7a
pkgrel=1
pkgdesc="爬取B站历史弹幕/全弹幕; 上游正在测试v2.0.0_beta版，该版本为当前稳定版。"
arch=('any')
url="https://github.com/HengXin666/BiLiBiLi_DanMu_Crawling"
license=('MIT')
depends=('tk')
makedepends=('git' 'python' 'python-build' 'python-pip')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
# options=(!strip)
install=$pkgname.install
source=("${pkgname%-VCS}::git+https://github.com/HengXin666/BiLiBiLi_DanMu_Crawling.git#branch=v1.5.1-old-ed"
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
