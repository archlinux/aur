# Maintainer zhanghua <zhanghua.00@qq.com>
# Contributor lyswhut <lyswhut@qq.com>

pkgname=lx-music-desktop-git
pkgdesc=一个免费的音乐查找助手
pkgver=1.10.2_c538e9c
pkgrel=1
arch=(x86_64 aarch64 armv7l)
url=https://github.com/lyswhut/lx-music-desktop
licence=(Apache)
conflicts=('lx-music-desktop')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
makedepends=('npm' 'nodejs>=14' 'jq')
source=(${pkgname}::git+https://github.com/lyswhut/lx-music-desktop)
sha256sums=(SKIP)

pkgver(){
	cd ${srcdir}/${pkgname}
	echo $(jq -r .version package.json)_$(git rev-parse --short HEAD)
}
prepare(){
	cd ${srcdir}/${pkgname}
	npm install
}
build(){
	cd ${srcdir}/${pkgname}
	npm run pack:dir
}
package(){
	_arch=$(node -e "os=require('os'); console.log(os.arch());")
	cd ${srcdir}/${pkgname}/build/linux-${_arch}-unpacked
	mkdir -p ${pkgdir}/opt/${pkgname//-git/}
	cp -r * ${pkgdir}/opt/${pkgname//-git/}
	mkdir -p ${pkgdir}/usr/bin
	ln -s /opt/${pkgname//-git/}/lx-music-desktop ${pkgdir}/usr/bin/lx-music-desktop
	mkdir -p ${pkgdir}/usr/share/applications
	cat > ${pkgdir}/usr/share/applications/${pkgname//-git/}.desktop << "EOF"
[Desktop Entry]
Name=Luo Xue Music Helper
Name[zh_CN]=洛雪音乐助手
Comment=A free music search helper
Comment[zh_CN]=一个免费的音乐查找助手
Type=Application
Exec=lx-music-desktop
Icon=lx-music-desktop.png
Terminal=false
Categories=Utility;AudioVideo;Audio;Player;Music;
EOF
	mkdir -p ${pkgdir}/usr/share/pixmaps
	cp ${srcdir}/${pkgname}/resources/icons/512x512.png ${pkgdir}/usr/share/pixmaps/${pkgname//-git/}.png
}
