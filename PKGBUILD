# Maintainer: griffin <19497824+WingofaGriffin@users.noreply.github.com>
pkgname=emudeck
pkgver=2.1.4
pkgrel=3
pkgdesc='An installation script that helps you get started with emulation.'
arch=('x86_64')
url="https://emudeck.com"
license=('GPL')
depends=('flatpak' 'rsync' 'unzip' 'jq' 'bash' 'curl' 'zenity' 'fuse2' 'git')
optdepends=('steam: Steam ROM Manager Support, Proton Support')
provides=('emudeck')
source=(launch-emudeck.sh)
sha512sums=('94fddc5a4fa578dbe2a2b1c9f331567079c6ed99950be1476fa8e6797cb0531c16abb5a9ad038d6153566ab23b592d83d07e715d919e3c6c1131b0dddc27fb04')

prepare() {
	EMUDECK_GITHUB_URL="https://api.github.com/repos/EmuDeck/emudeck-electron/releases/latest"
	EMUDECK_URL="$(curl -s ${EMUDECK_GITHUB_URL} | grep -E 'browser_download_url.*AppImage' | cut -d '"' -f 4)"
	
	mkdir -p ~/Applications
	curl -L "${EMUDECK_URL}" -o ~/Applications/EmuDeck.AppImage
	chmod +x ~/Applications/EmuDeck.AppImage
}

pkgver() {
	EMUDECK_GITHUB_URL="https://api.github.com/repos/EmuDeck/emudeck-electron/releases/latest"
  
  	emudeckVer=$(curl --silent ${EMUDECK_GITHUB_URL} | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/v//')
  	if [ -z "$emudeckVer" ]; then
    	emudeckVer=$pkgver
  	fi
  	echo $emudeckVer
}

package() {
 	install -Dm755 launch-emudeck.sh "$pkgdir/usr/bin/emudeck"
}
