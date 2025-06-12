# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Valerio Pizzi (pival81) <pival81@yahoo.com>
pkgname=museeks
_pkgname=Museeks
pkgver=0.21.1
_nodeversion=23
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
	'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=${pkgver}"
)
sha256sums=('29da551a8b6f21a5a3a777c1ddd99123d3a3b0033b0352acadb22917978f1e71')
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
		{
			echo 'registry=https://registry.npmmirror.com'
		} >> .npmrc
		export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
		export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
		export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
	fi
    bun install --frozen-lockfile
}
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's/"dmg", "nsis", "appimage", "deb", "rpm"/"deb"/g' src-tauri/tauri.conf.json
	bun tauri build
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