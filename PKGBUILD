# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=remotrix-git
_pkgname=Remotrix
pkgver=0.6.0.beta.4.r0.g97823a1
pkgrel=1
pkgdesc="A Rust-native desktop download manager inspired by Motrix, built with the iced GUI framework."
arch=('x86_64')
url="https://github.com/lazy1104/Remotrix"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'glibc'
    'gtk3'
)
makedepends=(
    'git'
    'rustup'
    'gendesk'
)
source=("${pkgname//-/.}::git+${url}.git")
sha256sums=('SKIP')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		[ -f "$d/Cargo.toml" ] && [ -d "$d/src" ] && { echo "$d"; return; }
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
	export CARGO_HOME="${HOME}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${HOME}" "${CARGO_HOME}"
}
build() {
    cd "$(_get_project_dir)"
    _set_build_env
    gendesk -q -f -n \
		--pkgname="${pkgname%-git}" \
		--pkgdesc="${pkgdesc}" \
		--categories="Network" \
		--name="${_pkgname}" \
		--exec="${pkgname%-git} %U"
    rustup toolchain install stable
	rustup default stable
    cargo build --profile dist --locked
}
package() {
    install -Dm755 "$(_get_project_dir)/target/dist/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm755 "$(_get_project_dir)/assets/icon.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
    install -Dm755 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}