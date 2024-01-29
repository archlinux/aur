# Maintainer: Kimiblock Moe
pkgname=bili-you-bin
pkgver=1.1.5+15
pkgrel=2
epoch=1
pkgdesc="一个用flutter制作的第三方B站客户端."
arch=('x86_64')
url="https://github.com/lucinhu/bili_you"
license=('Apache-2.0')
groups=()
depends=('gtk3' 'mpv')
makedepends=('fuse' 'imagemagick')
checkdepends=()
optdepends=()
provides=(bili-you)
conflicts=(bili-you)
replaces=()
source=(
	bili-you-${pkgver}.AppImage::"https://github.com/lucinhu/bili_you/releases/latest/download/BiliYou-x86_64.AppImage"
	"bili-you"
)
noextract=()
md5sums=('d5edb9c731d408ee4ffbace1bd8ceacb'
         'b7f665b6897f82734d5f57179ae397c0')
validpgpkeys=()
function package() {
	mkdir -p "${pkgdir}"/usr/share/applications
	mkdir -p "${pkgdir}"/usr/share/icons/hicolor/512x512/apps
	mkdir -p "${pkgdir}"/usr/bin
	info 'Extracting AppImage...'
	cd ${srcdir}
	chmod +x "${srcdir}"/bili-you-${pkgver}.AppImage
	"${srcdir}"/bili-you-${pkgver}.AppImage --appimage-extract
	echo '''[Desktop Entry]
Categories=AudioVideo;
Comment[zh_CN]=一个用flutter制作的第三方B站客户端
Comment=Third party Bilibili client.
Exec=/usr/bin/bili-you
Icon=bili
Name[zh_CN]=BiliYou
Name=BiliYou
Terminal=false
Type=Application''' >"${pkgdir}"/usr/share/applications/bili_you.desktop
	install -d "${pkgdir}/opt/bili_you"
	cp -r "${srcdir}/squashfs-root/opt"/* "${pkgdir}/opt/bili_you"
	convert "${pkgdir}/opt/bili_you/data/flutter_assets/assets/icon/bili.png" -resize 512x512 "${pkgdir}/usr/share/icons/hicolor/512x512/apps/bili.png"
	install -Dm755 "${srcdir}/bili-you" "${pkgdir}/usr/bin/bili-you"
}

function info() {
	if [ -f /usr/bin/pamac ]; then
		echo "  ==> [Info]: $@"
	else
		all_off="$(tput sgr0)"
		bold="${all_off}$(tput bold)"
		blue="${bold}$(tput setaf 4)"
		yellow="${bold}$(tput setaf 3)"
		printf "${blue}==>${yellow} [Info]:${bold} $1${all_off}\n"
	fi
}
