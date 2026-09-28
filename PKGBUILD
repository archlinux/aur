# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easyeditor-git
_pkgname=Easyeditor
pkgver=2.5.0.r3.gcf0f043
_nodeversion=24
pkgrel=1
pkgdesc="An easy markdown editor that allows you to professionally write MarkDown (MD), Mermaid, PlantUML, KaTeX and preview it in real-time. Import only MD, Templates and Docx. You can save, load .md files and export to PDF, PNG, TXT & SSTP."
arch=('any')
url="https://www.easyeditor.co.uk/"
_ghurl="https://github.com/gcclinux/Easyeditor"
license=('AGPL-3.0-only')
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'gendesk'
    'rustup'
)
source=("${pkgname//-/.}::git+${_ghurl}.git")
sha256sums=('SKIP')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "src-tauri" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
    cd "$(_get_project_dir)"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_set_build_env() {
    export HOME="${srcdir}/.home"
    export XDG_CACHE_HOME="${HOME}/.cache"
    export XDG_CONFIG_HOME="${HOME}/.config"
    export XDG_DATA_HOME="${HOME}/.local/share"
    export npm_config_cache="${HOME}/.npm_cache"
    export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
    export COREPACK_HOME="${HOME}/.corepack"
    export npm_config_audit=false
    export CARGO_HOME="${HOME}/.cargo"
    export CARGO_NET_GIT_FETCH_WITH_CLI=true
    export CARGO_NET_RETRY=5
    export CARGO_HTTP_MULTIPLEXING=false
    export CARGO_INCREMENTAL=0
    export CARGO_TERM_COLOR=never
    export CARGO_PROFILE_RELEASE_STRIP=symbols
    mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}" "${CARGO_HOME}"
}
prepare() {
    cd "$(_get_project_dir)"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    cp src-tauri/icons/128x128@2x.png src-tauri/icons/256x256.png
    sed -i 's/"active": true/"active": false/' src-tauri/tauri.conf.json
    rm -rf package-lock.json
    rustup update stable
    rustup default stable
    export NODE_ENV=development
    npm install
}
build() {
    cd "$(_get_project_dir)"
    _set_build_env
    _ensure_local_nvm
    export NODE_ENV=production
    npm run tauri:build
}
package() {
    local _src="$(_get_project_dir)"
    install -Dm755 "${_src}/src-tauri/target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${_src}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${_src}/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}