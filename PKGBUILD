# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-downloader-git
_pkgname=Ghost-Downloader
pkgver=4.4.3.r8.gc7921e9
pkgrel=1
pkgdesc="A multi-threading async downloader with QThread based on PyQt/PySide.多线程下载器 协程下载器."
arch=('any')
url="https://github.com/XiaoYouChR/Ghost-Downloader-3"
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
    "${pkgname%-git}.git::git+${url}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'b0592310f06c0ad828c080f34159209e8bb04d2228faf8f3461502de0d4d41ff')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		{ [ -f "$d/pyproject.toml" ] || [ -f "$d/setup.py" ] || [ -f "$d/setup.cfg" ] || [ -f "$d/requirements.txt" ]; } && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
    cd "$(_get_project_dir)"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_set_build_env() {
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
    _set_build_env
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
    uv venv --clear --python 3.13
    uv sync --python 3.13
}
build() {
    cd "$(_get_project_dir)"
    _set_build_env
    uv run scripts/deploy.py
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}/plugins"
    cp -a "$(_get_project_dir)/dist/${_pkgname}-3.dist/"* "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/app/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
