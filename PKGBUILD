# Maintainer: Kimiblock Moe
pkgname=rime-moe-pinyin-git
pkgver=3.5.r10.g21d6002f
pkgrel=1
epoch=1
pkgdesc="moeOS RIME 拼音方案"
arch=('any')
url="https://github.com/Kimiblock/moeOS-pinyin"
license=('GPL-3.0-or-later')
depends=("rime-pinyin-moegirl" "rime-pinyin-zhwiki")
makedepends=("git" "git-lfs")
provides=('rime-moe-pinyin')
conflicts=('rime-moe-pinyin')
source=(
	pinyin::"git+https://github.com/Kimiblock/moeOS-pinyin.git"
	wanxiang-lts-zh-hans.gram::"https://github.com/Kimiblock/moeOS-pinyin/raw/refs/heads/master/rime-data/others/LMDG/wanxiang-lts-zh-hans.gram"
)
sha256sums=('SKIP' 'SKIP')

function pkgver() {
	cd pinyin
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare() {
	cd pinyin
	git submodule update --init --depth 1 --remote
}

function package() {
	cd pinyin
	mkdir -p "${pkgdir}/usr/share"
	cp "${srcdir}/pinyin/rime-data" -r "${pkgdir}/usr/share"
	install -Dm644 "${srcdir}/pinyin/default.yaml" "${pkgdir}/usr/share/moeOS-Docs/ibus-rime.conf.d/default.yaml"
	for dir in $(ls "${pkgdir}/usr/share/rime-data/others"); do
		rm -rf "${pkgdir}/usr/share/rime-data/others/${dir}/.git"
	done
	install -Dm644 "${srcdir}/wanxiang-lts-zh-hans.gram" "${pkgdir}/usr/share/rime-data/others/LMDG/wanxiang-lts-zh-hans.gram"
	chmod -R 755 "${pkgdir}/usr/share/rime-data"
}


