# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-downloader-git
_pkgname=Ghost-Downloader
pkgver=4.5.2.r4.g45a60ba
pkgrel=1
pkgdesc="A multi-threading async downloader with QThread based on PyQt/PySide.多线程下载器 协程下载器."
arch=('any')
url="https://gd.xychr.com/"
_ghurl="https://github.com/XiaoYouChR/Ghost-Downloader-3"
license=('GPL-3.0-only')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'xcb-util-cursor'
    'xcb-util-renderutil'
    'xcb-util-keysyms'
    'xcb-util-wm'
    'xcb-util-image'
    'gtk3'
    'qt6-base'
    'libxkbcommon-x11'
    'python'
    'python-loguru'
    'ffmpeg'
    'libtorrent-rasterbar'
)
makedepends=(
    'git'
    'gendesk'
    'patchelf'
    'uv'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '1ea8181f36e7a4b37f6fbe8c2c9bda7bd92fcc4e7934cedca97eed1826751b67')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		{ [ -f "$d/pyproject.toml" ] || [ -f "$d/setup.py" ] || [ -f "$d/setup.cfg" ] || [ -f "$d/requirements.txt" ]; } && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
	cd "$(_get_project_dir)" || return 1
	local _t=$(git tag --list --sort=-v:refname | grep -m1 -E '^v?[0-9]+(\.[0-9]+)+$' || :)
	local _n=$(git rev-list --count "${_t:+$_t..}HEAD") _s=$(git rev-parse --short=7 HEAD)
	[[ -n $_t ]] && printf '%s.r%s.g%s\n' "${_t#v}" "$_n" "$_s" || printf 'r%s.%s\n' "$_n" "$_s"
}
_set_python_uv_build_env() {
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export XDG_STATE_HOME="${HOME}/.local/state"
	export UV_CACHE_DIR="${HOME}/.uv/cache"
	export UV_PROJECT_ENVIRONMENT="${srcdir}/.venv"
	export PYTHONDONTWRITEBYTECODE=1
	export PYTHONNOUSERSITE=1
	export PYTHONHASHSEED=0
	mkdir -p "${HOME}" "${UV_CACHE_DIR}"
}
prepare() {
    cd "$(_get_project_dir)"
    _set_python_uv_build_env
    sed -i -e "
        s/@appname@/${pkgname%-git}/g
        s/@runname@/${_pkgname}-3.bin/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    local _pyver="$(cat .python-version)"
    uv venv --clear --python "${_pyver}"
    uv sync --python "${_pyver}"
}
build() {
    cd "$(_get_project_dir)"
    _set_python_uv_build_env
    uv run scripts/deploy.py
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}/plugins"
    cp -a "$(_get_project_dir)/dist/${_pkgname}-3.dist/." "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/app/assets/logo.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
