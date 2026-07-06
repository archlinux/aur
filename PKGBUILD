# Maintainer: komex <kolchenko at ptsecurity dot com>
# Contributor: komex <kolchenko at ptsecurity dot com>

pkgname=llm-stats-git
_pkgname=llm-stats
pkgver=r157.3d2753f
pkgrel=2
pkgdesc="Anthropic/OpenAI passthrough proxy with Prometheus metrics, structured logging and SSE streaming (env-only config)"
arch=('x86_64')
url="https://gitlab.com/komex/llm-stats"
license=('MIT')
depends=()
makedepends=('go' 'git')
optdepends=(
    'promtail: log shipping to Loki (recommended for production observability)'
    'prometheus: metrics scraping'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

install=llm-stats.install

# Dynamic pkgver: prefer `git describe --tags`, fall back to <count>.<shortsha>.
pkgver() {
    cd "${_pkgname}" || exit 1
    local _desc
    _desc="$(git describe --long --tags --abbrev=7 2>/dev/null || true)"
    if [[ -n "$_desc" ]]; then
        printf '%s' "$_desc" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' \
            "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "${_pkgname}"

    export CGO_ENABLED=0
    go tool task build:release BINARY="${_pkgname}"
}

check() {
    cd "${_pkgname}"

    # -race needs cgo; build() disabled it above.
    export CGO_ENABLED=1

    go tool task test-fresh
}

package() {
    cd "${_pkgname}"

    install -Dm0755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # AUR-maintained: upstream packaging/llm-stats.service still uses
    # --config which the env-only binary doesn't accept.
    install -Dm0644 "${srcdir}/../${_pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    install -Dm0644 ../../LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# No backup=(): config is env-only via systemd drop-in (see .install).
