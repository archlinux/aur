# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=vacuumtube
pkgver=1.5.7
pkgrel=1
pkgdesc='Unofficial wrapper of YouTube Leanback with a built-in adblocker and minor enhancements.'
arch=('any')
url='https://github.com/shy1132/VacuumTube'
license=('MIT')
depends=('electron')
makedepends=('nvm')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('30eb836d7b46287dd906dc4606f6afe6672ad0062a16a45e6593c6ba8ef91349')
_nodeversion=23

_srcdir="VacuumTube-$pkgver"

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
	npm install
}

build() {
	_ensure_local_nvm
	cd "$_srcdir"
	./node_modules/.bin/electron-builder --linux --x64 --dir -c.electronDist=/usr/lib/electron -c.electronVersion="$(cat /usr/lib/electron/version)"
}

package() {
	cd "$_srcdir"

	install -dm755 "$pkgdir/usr/share/${pkgname}"
	cp -rt "$pkgdir/usr/share/${pkgname}" dist/linux-unpacked/resources/*

	install -Dm644 'assets/icon.svg' "${pkgdir}/usr/share/pixmaps/rocks.shy.VacuumTube.svg"

	install -Dm755 <(cat << EOF
#!/usr/bin/env sh
electron /usr/share/${pkgname}/app.asar "\$@"
EOF
	) "${pkgdir}/usr/bin/startvacuumtube"

	install -Dm644 'flatpak/rocks.shy.VacuumTube.desktop' -t "${pkgdir}/usr/share/applications"
}
