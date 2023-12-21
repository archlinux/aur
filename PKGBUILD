# Maintainer zhanghua <zhanghua.00@qq.com>
# Contributor lyswhut <lyswhut@qq.com>
# Contributor taotieren <admin@taotieren.com>

pkgbase=lx-music-desktop-git
pkgname=(lx-music-desktop-git lx-music-desktop-electron-git)
pkgdesc=一个免费的音乐查找助手
pkgver=2.5.0.ac7daa70
pkgrel=4
arch=(x86_64 aarch64 armv7l)
url=https://github.com/lyswhut/lx-music-desktop
licence=(Apache)
conflicts=('lx-music-desktop')
provides=('lx-music-desktop')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
makedepends=(
	git
	npm)
source=(
	${pkgbase}::git+${url}
	lx-music-desktop.desktop
	lxmusic-url.desktop
	lx-music-desktop)
sha256sums=('SKIP'
            '34342d437c59c6ae352123272daa1819e275c843170bbb8b467cbbc1c4c63dac'
            '83083f9febee2332f9d038bcf5693128f3bde17b41ed094f005265eafe1eb94f'
            '47bc117b8137990e538ab4049f1b2d8b04d3d495432c4002c5343a9331dc59c7')
_electron=electron16

pkgver(){
	cd "${srcdir}/${pkgbase}"
	echo $(git describe --tags | sed s/v//).$(git rev-parse --short HEAD)
}

prepare(){
    git -C "${srcdir}/${pkgbase}" clean -dfx

	cd "${srcdir}/${pkgbase}"
	npm install
}

build(){
	cd "${srcdir}/${pkgbase}"
	npm run pack:dir
}

package_lx-music-desktop-git(){
	_arch=$(node -e "os=require('os'); console.log(os.arch());")-
	if [ ${_arch}==x64- ]
	then
		_arch=""
	fi
	cd "${srcdir}/${pkgbase}/build/linux-${_arch}unpacked"
	mkdir -p "${pkgdir}/opt/${pkgbase//-git/}"
	cp -r * "${pkgdir}/opt/${pkgbase//-git/}"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /opt/${pkgbase//-git/}/lx-music-desktop "${pkgdir}/usr/bin/lx-music-desktop"
	install -Dm644 "${srcdir}/lx-music-desktop.desktop" "${pkgdir}/usr/share/applications/${pkgbase//-git/}.desktop"
	for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512
	do
		install -Dm644 "${srcdir}/${pkgbase}/resources/icons/${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgbase//-git/}.png"
	done
	# Enable it when supports url sheme on Linux
	install -Dm644 "${srcdir}/lxmusic-url.desktop" "${pkgdir}/usr/share/applications/lxmusic-url.desktop"
}

package_lx-music-desktop-electron-git(){
	depends+=("${_electron}")
	conflicts+=("lx-music-desktop-electron")
	provides+=("lx-music-desktop-electron")
	pkgdesc+=" (with system electron)"
	_arch=$(node -e "os=require('os'); console.log(os.arch());")-
	if [ ${_arch}==x64- ]
	then
		_arch=""
	fi
	install -Dm644 "${srcdir}/${pkgbase}/build/linux-${_arch}unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgbase//-git/}/lx-music-desktop.asar"
	install -Dm755 "${srcdir}/lx-music-desktop" "${pkgdir}/usr/bin/lx-music-desktop"
	sed -i "s/electron/${_electron}/" "${pkgdir}/usr/bin/lx-music-desktop"
	install -Dm644 "${srcdir}/lx-music-desktop.desktop" "${pkgdir}/usr/share/applications/${pkgbase//-git/}.desktop"
	for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512
	do
		install -Dm644 "${srcdir}/${pkgbase}/resources/icons/${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgbase//-git/}.png"
	done
	# Enable it when supports url sheme on Linux
	install -Dm644 "${srcdir}/lxmusic-url.desktop" "${pkgdir}/usr/share/applications/lxmusic-url.desktop"
}
