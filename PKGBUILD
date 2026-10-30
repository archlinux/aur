# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailspring-git
_pkgname=Mailspring
pkgver=1.26.2.r106.g52e4958
_electronversion=44
_nodeversion=22
pkgrel=1
pkgdesc="A beautiful, fast and fully open source mail client."
arch=('x86_64')
url="https://getmailspring.com/"
_ghurl="https://github.com/Foundry376/Mailspring"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'db5.3'
    'glib2'
    'openssl'
    'curl'
    'libxml2'
    'xz'
    'c-ares'
    'util-linux-libs'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'jq'
    'cmake'
    'autoconf'
    'automake'
    'libtool'
    'pkgconf'
    'tidy'
    'ctemplate'
    'cyrus-sasl'
    'icu'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.js"
    "${pkgname%-git}.sh"
)
options=('!strip')
sha256sums=('SKIP'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            '0f4675ddc96a032accf82723c7b6b66007bafd18aa8d919b61e983a68fd25328')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
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
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/resources" ]] && { echo "$d"; return 0; }; done
}
_get_electron_version() {
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -oE '[0-9]+' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	(( _elec_ver == _electronversion )) && c=32 || c=31
	echo -e "Electron version: \033[1;${c}m${_elec_ver}$([[ $c -eq 31 ]] && echo " (expected ${_electronversion})")\033[0m"
}
_set_npm_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export npm_config_cache="${HOME}/.npm_cache"
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export npm_config_audit=false
	export npm_config_registry="${NPM_CONFIG_REGISTRY:-${npm_config_registry:-https://registry.npmjs.org}}"
	# 原生模块(better-sqlite3 等)需针对 electron 编译，node-gyp 会下载 electron headers。
	# 默认源 electronjs.org 在本机直连被 TLS 重置(ECONNRESET)，改走 npmmirror 镜像。
	export npm_config_runtime=electron
	export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
	export npm_config_disturl="https://cdn.npmmirror.com/binaries/electron"
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}"
}
_build_mailsync() {
	local _etpan_prefix _msdir _appdir
	_msdir="$(_get_project_dir)/mailsync"
	_etpan_prefix="${srcdir}/libetpan-build"
	_appdir="$(_get_project_dir)/app"
	export CPATH="${_etpan_prefix}/include${CPATH:+:${CPATH}}"
	export LIBRARY_PATH="${_etpan_prefix}/lib${LIBRARY_PATH:+:${LIBRARY_PATH}}"

	cd "${_msdir}/Vendor/libetpan"
	NOCONFIGURE=1 ./autogen.sh
	./configure --prefix="${_etpan_prefix}" --enable-static --with-openssl
	make -j"$(nproc)"
	make install
	cd "${_msdir}/Vendor/mailcore2"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_PREFIX_PATH="${_etpan_prefix}" -DCMAKE_BUILD_TYPE=Release
	make MailCore
	cd "${_msdir}"
	cmake . -DCMAKE_PREFIX_PATH="${_etpan_prefix}" -DCMAKE_BUILD_TYPE=Release
	make
	install -Dm755 "${_msdir}/mailsync" "${_appdir}/mailsync.bin"
	cat > "${_appdir}/mailsync" <<'EOF'
#!/bin/bash
set -e
set -o pipefail
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
export SASL_PATH="/usr/lib/sasl2"
export LD_LIBRARY_PATH="${SCRIPTPATH}:${LD_LIBRARY_PATH}"
exec "${SCRIPTPATH}/mailsync.bin" "$@"
EOF
	chmod 755 "${_appdir}/mailsync"
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    _set_npm_build_env
    git submodule update --depth=1 --init --recursive
    sed -i "/await createRpmInstaller/d" app/build/build.js
    sed -i "1a exit 0" app/script/mkdeb
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    sed -i "s/tmpdir,/tmpdir,\n    electronDist: process.env.ELECTRON_DIST,/" app/build/build.js
    export NODE_ENV=development
    npm install
    _build_mailsync
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_npm_build_env
    export NODE_ENV=production
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(16 32 64 128 256 512)
    for _icon_size in "${_icon_size[@]}"; do
        install -Dm644 "$(_get_project_dir)/app/build/resources/linux/icons/${_icon_size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icon_size}x${_icon_size}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "$(_get_project_dir)/app/dist/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/app/dist/${pkgname%-git}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}
