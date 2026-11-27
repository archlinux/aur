# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sodam-git
_pkgname=SodaM
pkgver=0.4.1.r1.g6fbb561
pkgrel=1
pkgdesc="Native Qishui Music desktop client built with GPUI."
arch=('any')
url="https://sodahub-org.github.io/sodam"
_ghurl="https://github.com/sodahub-org/sodam"
license=('AGPL-3.0-only')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
	'glibc'
	'alsa-lib'
	'libxkbcommon-x11'
	'dbus'
	'hicolor-icon-theme'
)
makedepends=(
	'git'
	'rustup'
)
source=("${pkgname//-/.}::git+${_ghurl}.git")
sha256sums=('SKIP')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		[ -f "$d/Cargo.toml" ] && [ -d "$d/.github/workflows" ] && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
	cd "$(_get_project_dir)" || return 1
	local _t=$(git tag --list --sort=-v:refname | grep -m1 -E '^v?[0-9]+(\.[0-9]+)+$' || :)
	local _n=$(git rev-list --count "${_t:+$_t..}HEAD") _s=$(git rev-parse --short=7 HEAD)
	[[ -n $_t ]] && printf '%s.r%s.g%s\n' "${_t#v}" "$_n" "$_s" || printf 'r%s.%s\n' "$_n" "$_s"
}
_set_rust_build_env() {
	export HOME="${srcdir}/.home"
	export CARGO_HOME="${HOME}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${HOME}" "${CARGO_HOME}"
}
_generate_icons() {
	local _sizes=(16 24 32 48 64 96 128 256 512 1024) _src="$(_get_project_dir)/crates/${pkgname%-git}/assets/brand/${pkgname%-git}-icon-macos.png" _s
	for _s in "${_sizes[@]}"; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
		magick "${_src}" -background none -filter Lanczos -resize "${_s}x${_s}" \
			-strip -define png:compression-level=9 \
			"${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/${pkgname%-git}.png"
	done
}
prepare() {
	cd "$(_get_project_dir)"
	sed -i "s/\/usr\/bin\///g" "packaging/arch/${pkgname%-git}.desktop"
	_set_rust_build_env
	rustup toolchain install stable
	rustup default stable
}
build() {
	cd "$(_get_project_dir)"
	_set_rust_build_env
	cargo build --release --locked --workspace
}
package() {
	install -Dm755 "$(_get_project_dir)/target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
	_generate_icons
	install -Dm755 "$(_get_project_dir)/crates/${pkgname%-git}/assets/brand/${pkgname%-git}-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
	install -Dm755 "$(_get_project_dir)/packaging/arch/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications/"
}