# Contributor MYT1 <MYT1 @ YAHOO.com>

pkgname=aigcpanel-git
_pkgname=AigcPanel
pkgdesc="AigcPanel 是一个简单易用的一站式AI数字人系统，小白也可使用。 支持视频合成、声音合成、声音克隆，简化本地模型管理、一键导入和使用AI模型。"
pkgver=20241122.1970dde
pkgrel=1
arch=('x86_64' 'arm64')
url=https://aigcpanel.com/
licence=(AGPL-3.0)
depends=('hicolor-icon-theme'
    'gtk3'
    'libnotify'
    "electron${_electronversion}"
    "ffmpeg")
makedepends=('asar'
    'npm'
    'nvm'
    'pnpm'
)
conflicts=("${pkgname%-git}"
    "${pkgname%-git}-bin"
)
source=("git+https://gitee.com/modstart-lib/aigcpanel.git")
sha256sums=('SKIP')
_electronversion=33
_nodeversion=23

pkgver(){
    cd "${srcdir}/${pkgname%-git}"

    # Commit date + short rev
    echo $(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD).$(git rev-parse --short HEAD)
}

prepare(){
    npm config set registry https://registry.npmmirror.com
    git -C "${srcdir}/${pkgname%-git}" clean -dfx

	cd "${srcdir}/${pkgname%-git}"
	npm install
}

build(){
	cd "${srcdir}/${pkgname%-git}"
	gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U" --comment="Link android to PC easily" --icon="${pkgname%-git}"
	sed -i '114,120d' electron-builder.json5
	npm run build:linux --dir
}

package(){
	_arch=$(node -e "os=require('os'); console.log(os.arch());")-
	if [ ${_arch}==x64- ]
	then
		_arch=""
	fi
	cd "${srcdir}/${pkgname%-git}/dist-release/linux-unpacked"
	mkdir -p "${pkgdir}/opt/${pkgname%-git}"
	cp -r * "${pkgdir}/opt/${pkgname%-git}"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "${srcdir}/${pkgname%-git}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm644 "${srcdir}/${pkgname%-git}/dist/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
	install -Dm644 "${srcdir}/${pkgname%-git}/dist/logo-white.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.svg"
}

