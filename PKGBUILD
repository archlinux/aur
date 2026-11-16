# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: fow0ryl <henning.ryll at web dot de>
pkgname=zoraxy-git
pkgver=3.3.5.r0.gd10dba9
pkgrel=1
pkgdesc='A general purpose HTTP reverse proxy and forwarding tool.'
arch=('any')
url="https://zoraxy.aroz.org/"
_ghurl="https://github.com/tobychui/zoraxy"
license=('AGPL-3.0-only')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    'glibc'
)
makedepends=(
    'git'
    'go'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.service"
)

sha256sums=('SKIP'
            'e38e83de069d7f79d3172e85d4b6577457909804fecb8146aacbe59c6cbf6c57')
pkgver() {
	cd "$(_get_project_dir)" || return 1
	local _t=$(git tag --list --sort=-v:refname | grep -m1 -E '^v?[0-9]+(\.[0-9]+)+$' || :)
	local _n=$(git rev-list --count "${_t:+$_t..}HEAD") _s=$(git rev-parse --short=7 HEAD)
	[[ -n $_t ]] && printf '%s.r%s.g%s\n' "${_t#v}" "$_n" "$_s" || printf 'r%s.%s\n' "$_n" "$_s"
}
_get_project_dir() {
	local d _mod
	for d in "${srcdir}"/*/; do
		_mod=$(find "${d%/}" -name go.mod \
			-not -path '*/.git/*' -not -path '*/docs/*' -not -path '*/example/*' \
			-not -path '*/examples/*' -not -path '*/tools/*' \
			-printf '%d\t%h\n' 2>/dev/null | sort -n | head -1 | cut -f2-)
		[[ -n "${_mod}" ]] && { printf '%s\n' "${_mod}"; return 0; }
	done
	return 1
}
_set_go_build_env() {
	export HOME="${srcdir}/.home"
	export GOPATH="${HOME}/go"
	export GOCACHE="${HOME}/go-build"
	export GOENV="${HOME}/go/env"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export GOTOOLCHAIN=local
	export GOWORK=off
	mkdir -p "${HOME}" "${GOCACHE}" "${XDG_CONFIG_HOME}" "${XDG_CACHE_HOME}" "$(dirname "${GOENV}")"
	: > "${GOENV}"
	export PATH="${GOPATH}/bin:${PATH}"
}
prepare() {
    cd "$(_get_project_dir)"
    _set_go_build_env
    go mod tidy
}
build() {
    cd "$(_get_project_dir)"
    _set_go_build_env
    go build
}
package() {
    install -Dm755 "$(_get_project_dir)/${pkgname%-git}" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.service" -t "${pkgdir}/usr/lib/systemd/system"
}