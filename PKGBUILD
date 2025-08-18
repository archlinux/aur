# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>

pkgname=ubports-installer
pkgver=0.11.2
pkgrel=3
_nodeversion=18
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=('any')
url='https://github.com/ubports/ubports-installer'
license=('GPL-3.0-or-later')
depends=('android-tools' 'android-udev' 'electron' 'e2fsprogs' 'heimdall' 'p7zip')
makedepends=('nvm')
options=('!strip')
conflicts=('ubports-installer-git' 'ubports-installer-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ubports/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('55538e2e275ee26cfb042cd260a7c3953de61fc712a4179fec08c5ff07a1ef0a')

_srcdir="$pkgname-$pkgver"

_ensure_local_nvm() {
	export npm_config_cache="${srcdir}/npm-cache"
  local NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install "${_nodeversion}"
  nvm use "${_nodeversion}"
}

prepare() {
	_ensure_local_nvm

	cd "$_srcdir"

	npm ci
}

build() {
	_ensure_local_nvm

	cd "$_srcdir"

	npm install
	npm run build
	./node_modules/.bin/electron-builder --linux --x64 --dir -c.electronDist=/usr/lib/electron -c.electronVersion="$(cat /usr/lib/electron/version)"
}

package() {
	cd "$_srcdir"

	find ./dist/linux-unpacked/resources/app.asar.unpacked -type d \( -name linux -o -name mac -o -name win32 -o -name darwin \) -print -exec rm -rf {} + &>/dev/null
	install -dm755 "$pkgdir/usr/share/${pkgname}"
	cp -rt "$pkgdir/usr/share/${pkgname}" dist/linux-unpacked/resources/*

	cd 'build/icons'
	for i in *x*.png; do
		install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/${i%.png}/apps/ubports-installer.png"
	done

	install -Dm755 <(cat << EOF
#!/usr/bin/env sh
USE_SYSTEM_7ZA=true USE_SYSTEM_TOOLS=1 electron /usr/share/${pkgname}/app.asar "\$@"
EOF
	) "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 <(cat << EOF
[Desktop Entry]
Name=UBports Installer
Comment=UBports Installer
Exec=${pkgname} %U
Terminal=false
Type=Application
Icon=${pkgname}
Categories=System
EOF
	) "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
