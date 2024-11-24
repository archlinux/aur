# Contributor MYT1 <MYT1 @ YAHOO.com>

pkgname=linkandroid-git
_pkgname=LinkAndroid
pkgdesc="全能手机连接助手,简单 高清投屏,多设备,USB/无线连接,录屏 MP4/GIF录屏,截屏美化,命令行,强大 文件管理,键盘鼠标OTG,应用管理"
pkgver=20241123.05d1bea
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
makedepends=(
    'wget'
    'perl-image-exiftool'
    'asar'
    'unzip'
    'p7zip'
    'curl'
    'npm'
    'nvm'
    'pnpm'
)
conflicts=(
    "${pkgname%-git}"
    "${pkgname%-git}-bin"
)
source=("git+https://gitee.com/modstart-lib/linkandroid.git"
	"$_pkgname.desktop"
	"${pkgname%-git}.sh")
sha256sums=('SKIP'
            '5a940687e951435ad6288459810b747ab17331a03542d7f67c9aabccd8e8351c'
            '328332738472dfbd9bd279ea3df0053a2b2f50a81835baf554f976fb9be9696d')
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
	mkdir -p "${pkgdir}/opt/${_pkgname}"
	cp -r * "${pkgdir}/opt/${_pkgname}"
	mkdir -p "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgbase%-git}"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname%-git}/dist/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
	install -Dm644 "${srcdir}/${pkgname%-git}/dist/logo-white.svg" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.svg"
}

