# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Valerio Pizzi (pival81) <pival81@yahoo.com>
pkgname=museeks
_pkgname=Museeks
pkgver=0.20.0
_nodeversion=22
pkgrel=1
pkgdesc="🎵 A simple, clean and cross-platform music player."
arch=('any')
url="https://museeks.io"
_ghurl="https://github.com/martpie/museeks"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
	'gtk3'
)
makedepends=(
    'bun'
    'nvm'
    'curl'
	'rust'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('c8b1bb43c6e0f41f537d1dd13ef01fa90fcbfcea9c41db2b8e1dfff67d4bbe00')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}-${pkgver}"
	export CARGO_HOME="${srcdir}/.cargo"
	HOME="${srcdir}/.electron-gyp"
	if [ -f bunfig.toml ]; then
		rm -rf bunfig.toml
	fi
		if [ -f bun.lockb ];then
		rm -rf bun.lockb
	fi
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		export npm_config_electron_mirror="https://registry.npmmirror.com/-/binary/electron/"
		export npm_config_electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
		export sqlite3_binary_site="https://registry.npmmirror.com/-/sqlite3/"
		{
			echo '[install]'
			echo 'registry = "https://registry.npmmirror.com"'
		} >> bunfig.toml
		export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
		export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
	fi
    NODE_ENV=development    bun install
}
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	NODE_ENV=production    bun run tauri build -b deb
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_"*/data/usr/bin/"${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_"*/data/usr/lib/"${_pkgname}"/icons/icon.png \
        -t "${pkgdir}/usr/lib/${_pkgname}/icons"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_"*/data/usr/share/applications/"${_pkgname}".desktop \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	_icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_"*/data/usr/share/icons/hicolor/"${_icons}"/apps/"${pkgname}".png \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}