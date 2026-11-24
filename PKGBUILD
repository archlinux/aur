# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor and Ahthor: qier22 <qier222@outlook.com>
pkgname=yesplaymusic-git
_pkgname=YesPlayMusic
pkgver=3.0.0.r0.gbb8912f
pkgrel=1
pkgdesc="A better-looking desktop music player for local files, media servers, and plugins.高颜值的桌面音乐播放器，音乐源由插件提供"
arch=(
    'aarch64'
    'x86_64'
)
url="https://yesplaymusic.0xtangerine.com"
_ghurl="https://github.com/qier222/YesPlayMusic"
license=('GPL-3.0-or-later')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=(
    "${pkgname%-git}"
    "my-${pkgname%-git}"
    "${pkgname%-git}-appimage"
    "${pkgname%-git}osd-electron"
    "${pkgname%-git}osd-origin"
    "r3play"
    "r3playx"
)
depends=(
    'gtk3'
    'mpv'
)
makedepends=(
    'flutter-bin'
    'git'
    'pkgconf'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git#branch=main"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'd7002fa1a9ae60749490e982fa8a4f4622f7381b02559f5b014df033c0773a3c')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "pubspec.yaml" -not -path "*/.git/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
	cd "$(_get_project_dir)" || return 1
	local _t=$(git tag --list --sort=-v:refname | grep -m1 -E '^v?[0-9]+(\.[0-9]+)+(-[0-9A-Za-z][0-9A-Za-z.-]*)?$' || :)
	local _n=$(git rev-list --count "${_t:+$_t..}HEAD") _s=$(git rev-parse --short=7 HEAD) _v=${_t#v}; _v=${_v//-/_}
	[[ -n $_t ]] && printf '%s.r%s.g%s\n' "$_v" "$_n" "$_s" || printf 'r%s.%s\n' "$_n" "$_s"
}
_get_bundle_dir() {
	local _archdir=$([[ "${CARCH}" == "aarch64" ]] && echo arm64 || echo x64)
	echo "$(_get_project_dir)/build/linux/${_archdir}/release/bundle"
}
_set_flutter_build_env() {
    export HOME="${srcdir}/.home"
    export XDG_CACHE_HOME="${HOME}/.cache"
    export XDG_CONFIG_HOME="${HOME}/.config"
    export XDG_DATA_HOME="${HOME}/.local/share"
    export XDG_STATE_HOME="${HOME}/.local/state"
    export PUB_CACHE="${HOME}/.pub-cache"
    export FLUTTER_SUPPRESS_ANALYTICS=1
    export DO_NOT_TRACK=1
    export PUB_HOSTED_URL="${PUB_HOSTED_URL:-https://pub.dev}"
    mkdir -p "${HOME}" "${XDG_CACHE_HOME}" "${XDG_CONFIG_HOME}" "${XDG_DATA_HOME}" "${XDG_STATE_HOME}" "${PUB_CACHE}"
}
prepare() {
    cd "$(_get_project_dir)"
    _set_flutter_build_env
    sed -i -e "
        s/@appname@/${pkgname%-git}/g
        s/@runname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
}
build() {
    cd "$(_get_project_dir)"
    _set_flutter_build_env
    local _ver _major _minor _patch _build
    _ver="$(sed -n 's/^version: *\([0-9.]*\).*/\1/p' pubspec.yaml)"
    IFS=. read -r _major _minor _patch <<< "${_ver}"
    _build=$((_major * 10000 + _minor * 100 + _patch))
    flutter build linux --release \
        --build-name "${_ver}" \
        --build-number "${_build}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -a "$(_get_bundle_dir)/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "$(_get_project_dir)/linux/packaging/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/linux/packaging/${pkgname%-git}.png" -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}