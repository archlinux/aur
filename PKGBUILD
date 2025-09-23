# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Valerio Pizzi (pival81) <pival81@yahoo.com>
pkgname=museeks
_pkgname=Museeks
_flatpakname="io.${pkgname}.app"
pkgver=0.23.1
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
	'npm'
    'nvm'
    'curl'
	'rust'
	'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=${pkgver}"
)
sha256sums=('c6133f3a05e1539ed3debb664f8fbc80d858fe9f7b42a5e2b899fdefe3c810c7')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_ensure_rust_toolchain() {
    export RUSTUP_HOME="${srcdir}/.rustup"
    rustup default stable
}
prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	export CARGO_HOME="${srcdir}/.cargo"
	HOME="${srcdir}/.electron-gyp"
	{
		echo -e '\n'
		#echo 'build_from_source=true'
		echo "cache=${srcdir}/.npm_cache"
		echo "maxsockets=32"
	} >> .npmrc
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		{
			echo 'registry=https://registry.npmmirror.com'
		} >> .npmrc
		export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
		export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"
		find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
	fi
	_ensure_local_nvm
    _ensure_rust_toolchain
    NODE_ENV=development    npm install
}
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	_ensure_local_nvm
	sed -i 's/"dmg", "nsis", "appimage", "deb", "rpm"/"deb"/g' src-tauri/tauri.conf.json
	NODE_ENV=production     npm run tauri build
	sed -i "s/${_flatpakname}/${pkgname}/g" src-tauri/release/flatpak.metainfo.xml
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_"*/data/usr/bin/"${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm755 -d "${pkgdir}/usr/lib/${_pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_"*/data/usr/lib/"${_pkgname}/icons" \
        "${pkgdir}/usr/lib/${_pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_"*/data/usr/share/applications/"${_pkgname}".desktop \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	_icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${_pkgname}_"*/data/usr/share/icons/hicolor/"${_icons}"/apps/"${pkgname}".png \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/release/flatpak.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname}.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}