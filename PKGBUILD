# Maintainer: Kimiblock Zhou <pn3535 at icloud dot com>
pkgname=stapxs-qq-lite-bin
pkgver=2.5.0
pkgrel=1
epoch=
pkgdesc="一个兼容 oicq-http 的非官方网页版 QQ 客户端, 使用 Vue 重制的全新版本."
arch=('any')
url="https://github.com/Stapxs/Stapxs-QQ-Lite-2.0"
license=('Apache-2.0')
groups=()
depends=('nss' 'xdg-utils' 'libxss' 'electron' 'bc' 'libnotify')
makedepends=('wget' 'yq')
checkdepends=()
optdepends=(
	'xdg-desktop-portal-kde: KDE 原生文件选取器'
	'xdg-desktop-portal-lxqt: lxqt 原生文件选取器'
	'xdg-desktop-portal-gnome: Gnome 原生文件选取器'
	'xdg-desktop-portal: 原生文件选取器'
)
provides=(stapxs-qq-lite)
conflicts=(stapxs-qq-lite)
replaces=()
install=${pkgname}.install
source=(
	icon.svg::"https://github.com/Stapxs/Stapxs-QQ-Lite-2.0/raw/main/public/img/icons/icon.svg"
	stapxs-qq-lite-bin
	stapxs-qq-lite-bin.desktop
)
noextract=()
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)
validpgpkeys=()

pkgver(){
	if [[ -f "${srcdir}/latest-linux.yml" ]]; then
		rm "${srcdir}/latest-linux.yml"
	fi
	wget -q 'https://github.com/Stapxs/Stapxs-QQ-Lite-2.0/releases/latest/download/latest-linux.yml'
	_ver="$(yq -r .version latest-linux.yml)"
	printf ${_ver}
}
package() {
	cd ${srcdir}
	if [ -d stapxs-qq-lite-* ]; then
		rm stapxs-qq-lite-* -r
	fi
	wget "https://github.com/Stapxs/Stapxs-QQ-Lite-2.0/releases/latest/download/stapxs-qq-lite-${pkgver}.tar.gz"
	tar -xf "${srcdir}"/*.tar.gz
	install -Dm755 "${srcdir}"/stapxs-qq-lite-bin "${pkgdir}"/usr/bin/stapxs-qq-lite-bin
	install -Dm644 "${srcdir}"/stapxs-qq-lite-*/resources/app.asar "${pkgdir}"/opt/stapxs-qq-lite-bin/app.asar
	install -Dm644 "${srcdir}"/icon.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/stapxs-qq-lite-bin.svg
	install -Dm644 "${srcdir}"/stapxs-qq-lite-bin.desktop "${pkgdir}"/usr/share/applications/stapxs-qq-lite-bin.desktop
}

function _info() {
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
