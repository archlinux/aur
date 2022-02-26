# Maintainer zhanghua <zhanghua.00@qq.com>
# Contributor lyswhut <lyswhut@qq.com>

pkgname=lx-music-desktop-git
pkgdesc=一个免费的音乐查找助手
pkgver=1.18.0.2f39808
pkgrel=2
arch=(x86_64 aarch64 armv7l)
url=https://github.com/lyswhut/lx-music-desktop
licence=(Apache)
conflicts=('lx-music-desktop')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
makedepends=('npm' 'nodejs>=14')
source=(
	${pkgname}::git+${url}
	lx-music-desktop.desktop
	lxmusic-url.desktop)
sha256sums=('SKIP'
            '34342d437c59c6ae352123272daa1819e275c843170bbb8b467cbbc1c4c63dac'
            '83083f9febee2332f9d038bcf5693128f3bde17b41ed094f005265eafe1eb94f')

pkgver(){
	cd "${srcdir}/${pkgname}"
	echo $(git describe --tags | sed s/v//).$(git rev-parse --short HEAD)
}
prepare(){
	cd "${srcdir}/${pkgname}"
	npm install
}
build(){
	cd "${srcdir}/${pkgname}"
	npm run pack:dir
}
package(){
	_arch=$(node -e "os=require('os'); console.log(os.arch());")-
	if [ ${_arch}==x64- ]
	then
		_arch=""
	fi
	cd "${srcdir}/${pkgname}/build/linux-${_arch}unpacked"
	mkdir -p "${pkgdir}/opt/${pkgname//-git/}"
	cp -r * "${pkgdir}/opt/${pkgname//-git/}"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /opt/${pkgname//-git/}/lx-music-desktop "${pkgdir}/usr/bin/lx-music-desktop"
	install -Dm644 "${srcdir}/lx-music-desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname//-git/}.desktop"
	for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512
	do
		install -Dm644 "${srcdir}/${pkgname}/resources/icons/${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/${pkgname//-git/}.png"
	done
	# Enable it when supports url sheme on Linux
	install -Dm644 "${srcdir}/lxmusic-url.desktop" "${pkgdir}/usr/share/applications/lxmusic-url.desktop"
}
