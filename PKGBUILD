# Contributor MYT1 <MYT1 @ YAHOO.com>

pkgname=linkandroid-git
_pkgname=LinkAndroid
pkgdesc="Easily project Android screen to PC"
pkgver=20241223.0706be2
pkgrel=1
arch=('x86_64' 'arm64')
url=https://linkandroid.com/
licence=(GPL-3.0)
depends=('hicolor-icon-theme'
    'gtk3'
    'libnotify'
    'nss'
    'libxss'
    'libxtst'
    'xdg-utils'
    'at-spi2-core'
    'util-linux-libs'
    'libsecret'
    'libappindicator-gtk3'
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
source=("git+https://github.com/modstart-lib/linkandroid.git")
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
	sed -i '5i\Name[zh_CN]=安卓投屏' "${srcdir}/${pkgname%-git}/${pkgname%-git}.desktop"
	install -Dm644 "${srcdir}/${pkgname%-git}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm644 "${srcdir}/${pkgname%-git}/dist/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
	install -Dm644 "${srcdir}/${pkgname%-git}/dist/logo-white.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.svg"
}

